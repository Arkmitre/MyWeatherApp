//
//  CityFileManager.swift
//  WeatherProject
//
//  Created by Alexander on 23/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation

class CityFileManager: CityManaging {
	
	private let fileName = "testFile"
	lazy private(set) var path: String = {
		let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
		                                                        .userDomainMask,
		                                                        true)[0]
		return documentsPath + "/" + self.fileName
	}()
	
	
    private let defaultCityList = ["Yekaterinburg",
                           "Oslo",
                           "Moscow"]
	private var defaultCityString: String {
		return defaultCityList.joined(separator: "\n")
	}
	
    init() {
		print(path)
		
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
			print("Exists")
		} else {
            do {
                try defaultCityString.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
                print("File created")
            } catch {
                print("Could't write file: \(error)")
            }
        }
    }
    
	var cityList: [String] {
        do {
            let cityList = try String(contentsOfFile: path)
            return cityList.components(separatedBy: "\n")
        } catch {
            print(error)
        }
		return []
	}
	
	func addCity(_ city: String) -> Bool {
		guard cityList.index(of: city) != nil else { return false }
		
        let previousCityList = cityList.joined(separator: "\n")
        let newFileData = previousCityList + "\n" + city
        do {
            try newFileData.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            print("File rewrite")
            return true
        } catch {
            print("Could't write file: \(error)")
        }
		return false
	}
    
}
