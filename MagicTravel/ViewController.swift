//
//  ViewController.swift
//  MagicTravel
//
//  Created by Eliezer Antonio on 22/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView: UITableView!
    var countries :[String] = ["Germany", "France", "China","Brazil","Angola", "India","Canada", "USA"]
    
    var continentCountry: [String : String] =  ["Germany":" Europe", "France":"Europe", "China":"Asia","Brazil":"South America","Angola":"Africa", "India":"Asia","Canada":"North America", "USA":"North America"]
    
    struct Constants{
        static let cellIdentifier = "MagicCountryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
       
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView:UITableView)->Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
    var tableViewCellContentConfiguration = tableViewCell.defaultContentConfiguration()
               let countryName =  countries[indexPath.row]
        tableViewCellContentConfiguration.text = countryName
        tableViewCellContentConfiguration.secondaryText = continentCountry[countryName] ?? ""
        tableViewCell.contentConfiguration=tableViewCellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("user tapped on cell at \(indexPath)")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
}
