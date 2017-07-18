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
    
    // Model
    private var weather: WeatherConst?

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
                                       weatherDescription: weather.weatherDescription)
        
        detailsCell.configure(withModel: model)
    
        return detailsCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let cityName = cityName else { return }
        
        if let weatherData = StorageManager().loadWeather(cityName: cityName) {
            weather = WeatherConst(weatherData: weatherData)
        }
        
        APIManager().fetchWeather(cityName: cityName) { (weather) in
            
            // UI refresh
            self.weather = weather
            self.collectionView?.reloadData()
            
            // DB write
            guard let weather = weather else { return }
            StorageManager().saveWeather(weather.weatherData)
        }
        
    }
}
