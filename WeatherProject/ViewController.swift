//
//  ViewController.swift
//  WeatherProject
//
//  Created by Alexander on 06/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON

class ViewController: UITableViewController {

    var cityList = ["Yekateringburg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlComponents = NSURLComponents(string: "http://api.openweathermap.org/data/2.5/weather") else {
            return
        }
        
        let cityName = "yekaterinburg"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: "\(cityName),ru"),
                                    URLQueryItem(name: "appid", value: "624cc73c21367a228af79250ce287fff"),
                                    URLQueryItem(name: "units", value: "metric")]
        
        guard let url = urlComponents.url else { return }
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            /*switch response.result {
            case .success(let value):
                //print(value)
                
                let weather = WeatherData()
                let json = JSON(value)
                
                weather.cityName = json["name"].stringValue
                
                let main = json["main"]
                weather.temperature = main["temp"].intValue
                weather.temperatureMin = main["temp_min"].intValue
                weather.temperatureMax = main["temp_max"].intValue
                
                let realm = try! Realm()
                print(Realm.Configuration.defaultConfiguration)
                
                try! realm.write {
                    realm.add(weather)
                }
 
            case .failure(let error):
                print(error)
            } */
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = cityList[indexPath.row]
        return cell
    }

}
