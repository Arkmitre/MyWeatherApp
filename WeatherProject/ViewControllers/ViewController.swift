//
//  ViewController.swift
//  WeatherProject
//
//  Created by Alexander on 06/07/2017.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // Model
    var cityList = ["Yekaterinburg", "Oslo", "Moscow"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailsCollectionViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let cityName = cityList[indexPath.row]
        
        destination.cityName = cityName
    }
    
    //
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cityList[indexPath.row]
        return cell
    }
}
