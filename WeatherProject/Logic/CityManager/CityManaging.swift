//
//  CityManaging.swift
//  WeatherProject
//
//  Created by Alexander on 23/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

protocol CityManaging {
	
	var cityList: [String] { get }
	func addCity(_ city: String) -> Bool
	
}
