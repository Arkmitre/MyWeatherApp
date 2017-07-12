//
//  WeatherData.swift
//  WeatherProject
//
//  Created by Alexander on 06/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherData: Object {
    dynamic var cityName: String = ""
    dynamic var temperature: Double = 0.0
    dynamic var temperatureMax: Double = 0.0
    dynamic var temperatureMin: Double = 0.0
}
