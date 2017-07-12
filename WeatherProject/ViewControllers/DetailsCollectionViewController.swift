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
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        guard let detailsCell = cell as? DetailsCollectionViewCell else { return cell }
        
        detailsCell.cityNameLabel.text = cityName
        
        guard let weather = weather else { return cell }
        detailsCell.cityTemperature.text = String(weather.temperature)
        detailsCell.cityTemperatureMin.text = String(weather.temperatureMin)
        detailsCell.cityTemperatureMax.text = String(weather.temperatureMax)
    
        return detailsCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let cityName = cityName else { return }
        APIManager().fetchWeather(cityName: cityName) { (weather) in
            
            self.weather = weather
            self.collectionView?.reloadData()
        }
    }
}
