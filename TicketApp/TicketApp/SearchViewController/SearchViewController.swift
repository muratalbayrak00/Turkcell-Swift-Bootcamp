//
//  SearchViewController.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var selectedCityFrom: CityModel?
    
    var cities: [CityModel] = [
        CityModel(cityName: "İstanbul"),
        CityModel(cityName: "Ankara"),
        CityModel(cityName: "İzmir")
    ]
 var filteredUsers: [CityModel] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        filteredUsers = cities
        tableView.delegate = self
        tableView.dataSource = self
        configure()
    }
    
    private func configure(){
        configureTableView()
        configureSearchController()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "cityCell", bundle: nil), forCellReuseIdentifier: "cityCell")
        
        // Main Thread : UI Islemleri yapilir. (Mulakatta cikabilir.)
     
        //self.cities = cities
    }
    
    func filterContextForSearchtext(_ searchText: String) {
        filteredUsers = cities.filter({ city -> Bool in
            return city.cityName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            selectedCityFrom = filteredUsers[indexPath.row]
        } else {
            selectedCityFrom = cities[indexPath.row]
        }
        
        NotificationCenter.default.post(name: .selectedCityNotificationStart, object: selectedCityFrom)

        // Burada ekranı kapatmak için uygun bir yöntem kullanabilirsiniz
        // Örneğin, bir navigation controller kullanıyorsanız:
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        // definesPresentationContext = true // ODEV NE ISE YARIYOR.
    }
    
}
extension Notification.Name {
    static let selectedCityNotificationStart = Notification.Name("SelectedCityNotificationStart")
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! cityCell
        
        if isFiltering {
            cell.configure(filteredUsers[indexPath.row])
        } else {
            cell.configure(cities[indexPath.row])
        }
        
       
        
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchtext(searchBar.text!)
    }
}
