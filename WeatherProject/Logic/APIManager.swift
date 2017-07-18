//
//  APIManager.swift
//  WeatherProject
//
//  Created by Alexander on 12/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    func fetchWeather(cityName: String, completion: @escaping (WeatherConst?) -> Void) {
        guard let urlComponents =
            NSURLComponents(string: "http://api.openweathermap.org/data/2.5/weather") else { return }
        
        urlComponents.queryItems = [URLQueryItem(name: "q", value: "\(cityName),ru"),
                                    URLQueryItem(name: "appid", value: "624cc73c21367a228af79250ce287fff"),
                                    URLQueryItem(name: "units", value: "metric")]
        
        guard let url = urlComponents.url else { return }

        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let weatherConst = WeatherConst(json: json)
                
                completion(weatherConst)
            case .failure(let error):
                print(error)
            }
        }
    }
}
