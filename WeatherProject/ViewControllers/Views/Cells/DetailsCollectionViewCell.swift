//
//  DetailsCollectionViewCell.swift
//  WeatherProject
//
//  Created by Alexander on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit
import Foundation
import Dispatch

class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    @IBOutlet weak var cityTemperatureMax: UILabel!
    @IBOutlet weak var cityTemperatureMin: UILabel!
    @IBOutlet weak var cityWeatherDescription: UILabel!
    @IBOutlet weak var updateTime: UILabel!
    @IBOutlet weak var updateImageWaiting: UIImageView!
    @IBOutlet weak var updateTimeStatic: UILabel!
    
    func configure(withModel model: DetailsCollectionViewCellModel) {
        cityNameLabel.text = model.cityName
        cityTemperature.text = model.temperature != nil ? String(model.temperature!) : nil
        cityTemperatureMin.text = model.temperatureMin != nil ? String(model.temperatureMin!) : nil
        cityTemperatureMax.text = model.temperatureMax != nil ? String(model.temperatureMax!) : nil
        cityWeatherDescription.text = model.weatherDescription != nil ? String(model.weatherDescription!) : nil
        updateTime.text = model.updateTime != nil ? String(model.updateTime!) : nil
        // image исчезает время обновления/запроса появляется, пока ютс (нужно конветировать)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            self.updateImageWaiting.isHidden = true
            self.updateTimeStatic.isHidden = false
            self.updateTime.isHidden = false
        }

    }
    
}
