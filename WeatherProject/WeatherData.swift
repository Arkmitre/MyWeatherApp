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
    dynamic var temperature: Int = 0
    dynamic var temperatureMax: Int = 0
    dynamic var temperatureMin: Int = 0
}
