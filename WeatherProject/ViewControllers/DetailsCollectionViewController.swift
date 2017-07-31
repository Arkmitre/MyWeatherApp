//
//  DetailsCollectionViewController.swift
//  WeatherProject
//
//  Created by Alexander on 10/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "cell"

class DetailsCollectionViewController: UICollectionViewController {
    
    // In
    var cityName: String?
	
	private var activityIndicator: UIActivityIndicatorView = {
		let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
		// Settings
		return activityIndicator
	}()
	private var indicatorItem: UIBarButtonItem {
		return UIBarButtonItem(customView: activityIndicator)
	}
	
	@IBOutlet private var refreshButton: UIBarButtonItem!
	
    // Model
    private var weather: WeatherConst?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
		updateWeather()
    }
	
	private func updateWeather() {
		guard let cityName = cityName else { return }
		
		if let weatherData = StorageManager().loadWeather(cityName: cityName) {
			weather = WeatherConst(weatherData: weatherData)
		}
		
		fetchWeather()
	}
	
	private func fetchWeather() {
		guard let cityName = cityName else { return }
		
		NotificationCenter.default.addObserver(self,
		                                       selector: #selector(handleWeatherNotification),
		                                       name: .weatherWasUpdated,
		                                       object: nil)
		
		navigationItem.rightBarButtonItem = indicatorItem
		activityIndicator.startAnimating()
		APIManager().fetchWeather(cityName: cityName)
	}
	
	@objc private func handleWeatherNotification(notification: Notification) {
		guard let weather = notification.userInfo?["weather"] as? WeatherConst else { return }
		update(withWeather: weather)
	}
	
	private func update(withWeather weather: WeatherConst) {
		// UI refresh
		self.weather = weather
		collectionView?.reloadData()
		activityIndicator.stopAnimating()
		navigationItem.rightBarButtonItem = refreshButton
		
		// DB write
		StorageManager().saveWeather(weather.weatherData)
	}
	
	// MARK: - Actions
	
	@IBAction private func refreshAction() {
		fetchWeather()
	}
	
	// MARK: - CollectionViewDatasource
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView,
	                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
		
		guard let detailsCell = cell as? DetailsCollectionViewCell else { return cell }
		
		guard let weather = weather else { return cell }
		
		let model = DetailsCollectionViewCellModel(cityName: cityName,
		                                           temperature: weather.temperature,
		                                           temperatureMax: weather.temperatureMax,
		                                           temperatureMin: weather.temperatureMin,
		                                           weatherDescription: weather.weatherDescription,
		                                           updateTime: weather.updateTime)
		
		detailsCell.configure(withModel: model)
		
		return detailsCell
	}
	
}
