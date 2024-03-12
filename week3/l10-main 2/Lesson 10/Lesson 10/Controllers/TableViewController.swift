
import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cities = ["Karabük","Sivas","Bursa","Malatya","Erzurum"]
    var famousThings = ["Lokum","Kangal","Süt Helvası","Kayısı","Cağ Kebap"]
    var images = ["lokum","kangal","suthelvasi","kayisi","cagkebap"]
    
    var allCities = [CityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allCities.append(CityModel(famousThingsName: "Lokum", cityName: "Karabuk", famousImageView: "lokum"))
        allCities.append(CityModel(famousThingsName: "Kangal", cityName: "Sivas", famousImageView: "kangal"))
        allCities.append(CityModel(famousThingsName: "Sut Helvasi", cityName: "Bursa", famousImageView: "suthelvasi"))
        allCities.append(CityModel(famousThingsName: "Kayisi", cityName: "Malatya", famousImageView: "kayisi"))
        allCities.append(CityModel(famousThingsName: "Cag Kebap", cityName: "Erzurum", famousImageView: "cagkebap"))
        
        // Register cell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "newCityCell")
    }

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCityCell", for: indexPath) as! TableViewCell
                
        cell.configureModel(allCities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cities[indexPath.row])
        
        let alertContoller = UIAlertController(title: "\(cities[indexPath.row])", message: "\(famousThings[indexPath.row])", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertContoller.addAction(action)
        present(alertContoller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
