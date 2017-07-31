//
//  DetailsCollectionViewCell.swift
//  WeatherProject
//
//  Created by Alexander on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit
import Foundation

class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityTemperature: UILabel!
    @IBOutlet weak var cityTemperatureMax: UILabel!
    @IBOutlet weak var cityTemperatureMin: UILabel!
    @IBOutlet weak var cityWeatherDescription: UILabel!
    @IBOutlet private weak var updateTimeLabel: UILabel!
	
	static let dateFormatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm:ss"
		return dateFormatter
	}()
	
    func configure(withModel model: DetailsCollectionViewCellModel) {
        cityNameLabel.text = model.cityName
        cityTemperature.text = model.temperature != nil ? String(model.temperature!) : nil
        cityTemperatureMin.text = model.temperatureMin != nil ? String(model.temperatureMin!) : nil
        cityTemperatureMax.text = model.temperatureMax != nil ? String(model.temperatureMax!) : nil
        cityWeatherDescription.text = model.weatherDescription != nil ? String(model.weatherDescription!) : nil
		
		if let updateTime = model.updateTime {
			let date = Date(timeIntervalSince1970: updateTime)
			let time = DetailsCollectionViewCell.dateFormatter.string(from: date)
			updateTimeLabel.text = "updated: \(time)"
		}
		
		updateTimeLabel.alpha = 0.0
		updateTimeLabel.isHidden = false
		UIView.animate(withDuration: 0.3, animations: {
			self.updateTimeLabel.alpha = 1.0
		})
    }
    
}
