//
//  SearchViewControllerDestinationViewController.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class SearchViewControllerDestination: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var selectedCityto: CityModel?
    
    var cities: [CityModel] = [
        CityModel(cityName: "İstanbul"),
        CityModel(cityName: "Ankara"),
        CityModel(cityName: "İzmir"),
        CityModel(cityName: "Antalya"),
        CityModel(cityName: "Sivas"),
        CityModel(cityName: "Konya"),
        CityModel(cityName: "Mersin")
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
        title = "Varış için şehir seçiniz"
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
        
     
    }
    

    func filterContextForSearchtext(_ searchText: String) {
        filteredUsers = cities.filter({ city -> Bool in
            return city.cityName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            selectedCityto = filteredUsers[indexPath.row]
        } else {
            selectedCityto = cities[indexPath.row]
        }
        
        NotificationCenter.default.post(name: .selectedCityNotificationto, object: selectedCityto)

         dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "İl veya ilçe yazınız"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
}
extension Notification.Name {
    static let selectedCityNotificationto = Notification.Name("SelectedCityNotificationto")
}

extension SearchViewControllerDestination: UITableViewDelegate, UITableViewDataSource {
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

extension SearchViewControllerDestination: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchtext(searchBar.text!)
    }
}
