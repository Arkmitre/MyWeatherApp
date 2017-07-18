//
//  CityManager.swift
//  WeatherProject
//
//  Created by Alexander on 18/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

class CityManager {
	
	private enum Consts {
		static let cityKey = "cityKey"
	}
	
	static let shared = CityManager()
	private init() {
		if cityDictionary == nil {
			cityDictionary = ["Yekaterinburg": true,
							  "Oslo": true,
							  "Moscow": true]
		}
	}
	
	var cityList: [String] {
		return cityDictionary?.keys.sorted(by: <) ?? []
	}
	
	private var cityDictionary: [String: Bool]? {
		get {
			return UserDefaults.standard.value(forKey: Consts.cityKey) as? [String: Bool]
		}
		set {
			UserDefaults.standard.set(newValue, forKey: Consts.cityKey)
		}
	}
	
	func addCity(_ city: String) -> Bool {
		guard var cityDictionary = cityDictionary else { return false }
		if cityDictionary[city] != nil { return false }
		cityDictionary[city] = true
		self.cityDictionary = cityDictionary
		return true
	}
	
}
