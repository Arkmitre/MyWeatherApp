//
//  WeatherConst.swift
//  WeatherProject
//
//  Created by Alexander on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherConst {
    
    let cityName: String
    let temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double
    let weatherDescription: String
    let updateTime: Double
}

extension WeatherConst {

    var weatherData: WeatherData {// вычисляемое значение
        let data = WeatherData()
        data.cityName = cityName
        data.temperature = temperature
        data.temperatureMax = temperatureMax
        data.temperatureMin = temperatureMin
        data.weatherDescription = weatherDescription
        data.updateTime = updateTime
        return data
    }
    
    init(json: JSON) {
        cityName = json["name"].stringValue
        
        let main = json["main"]
        temperature = main["temp"].doubleValue
        temperatureMin = main["temp_min"].doubleValue
        temperatureMax = main["temp_max"].doubleValue
        
        let weather = json["weather"][0]
        weatherDescription = weather["description"].stringValue
        
        //updateTime = json["dt"].doubleValue
		updateTime = Date().timeIntervalSince1970
    }
    
    init(weatherData: WeatherData) {
        cityName = weatherData.cityName
        temperature = weatherData.temperature
        temperatureMax = weatherData.temperatureMax
        temperatureMin = weatherData.temperatureMin
        weatherDescription = weatherData.weatherDescription
        updateTime = weatherData.updateTime
    }
}
