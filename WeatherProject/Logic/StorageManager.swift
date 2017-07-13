//
//  StorageManager.swift
//  WeatherProject
//
//  Created by Alexander on 13/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class StorageManager {
    
    func loadWeather(cityName: String) -> WeatherData? {
        
        let realm = try! Realm()
        let cityWeather = realm.objects(WeatherData.self).filter("cityName == %@", cityName).first
        return cityWeather
    }
    
    func saveWeather(_ weather: WeatherData) {
        
        print(Realm.Configuration.defaultConfiguration)
        
        let realm = try! Realm()
        guard let _ = loadWeather(cityName: weather.cityName) else {
            
            try! realm.write {
                realm.add(weather)
            }
            return
        }
        
        try! realm.write {
            realm.add(weather, update: true)
        }
    }
}
