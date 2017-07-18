//
//  DetailsCollectionViewCell.swift
//  WeatherProject
//
//  Created by Alexander on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    @IBOutlet weak var cityTemperatureMax: UILabel!
    @IBOutlet weak var cityTemperatureMin: UILabel!
    @IBOutlet weak var cityWeatherDescription: UILabel!
    
    func configure(withModel model: DetailsCollectionViewCellModel) {
        cityNameLabel.text = model.cityName
        cityTemperature.text = model.temperature != nil ? String(model.temperature!) : nil
        cityTemperatureMin.text = model.temperatureMin != nil ? String(model.temperatureMin!) : nil
        cityTemperatureMax.text = model.temperatureMax != nil ? String(model.temperatureMax!) : nil
        cityWeatherDescription.text = model.weatherDescription != nil ? String(model.weatherDescription!) : nil
    }
}
