//
//  ViewController.swift
//  TGY2024-Week-5
//
//  Created by Kerem Demir on 14.03.2024.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var cookNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCooks()
    }
    
    private func getCooks() {
        guard let appDelegae = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegae.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cooks")
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                }
                tableView.reloadData()
            } else {
                print("Error at here.")
            }
        } catch {
            
        }
    }
    
}

extension CookListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath)
        cell.textLabel?.text = cookNames[indexPath.row]
        return cell
    }
}
