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
	var cityList: [String] {
		return CityManager.shared.cityList
	}
		
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
	
	//
	
	@IBAction func plusAction() {
		let alertController = UIAlertController(title: "Add new city:",
		                                        message: nil,
		                                        preferredStyle: .alert)
		
		alertController.addTextField(configurationHandler: nil)
		
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
			guard let text = alertController.textFields?.first?.text else { return }
			
			if !CityManager.shared.addCity(text) {
				self.showAddCityErrorAlert(withCity: text)
				return
			}
			
			self.tableView.reloadData()
		}))
		
		present(alertController, animated: true, completion: nil)
	}
	
	private func showAddCityErrorAlert(withCity city: String) {
		let alertController = UIAlertController(title: "Oops..",
		                                        message: "This city \(city) already added.",
		                                        preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		present(alertController, animated: true, completion: nil)
	}
}
