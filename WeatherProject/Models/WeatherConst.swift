//
//  WeatherConst.swift
//  WeatherProject
//
//  Created by Vyacheslav Khorkov on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

struct WeatherConst {
    
    let cityName: String
    let temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double
    let weatherDescription: String
}

extension WeatherConst {
    
    var weatherData: WeatherData {// вычисляемое значение
        let data = WeatherData()
        data.cityName = cityName
        data.temperature = temperature
        data.temperatureMax = temperatureMax
        data.temperatureMin = temperatureMin
        data.weatherDescription = weatherDescription
        return data
    }
    
    init(weatherData: WeatherData) {
        
        cityName = weatherData.cityName
        temperature = weatherData.temperature
        temperatureMax = weatherData.temperatureMax
        temperatureMin = weatherData.temperatureMin
        weatherDescription = weatherData.weatherDescription
    }
}
