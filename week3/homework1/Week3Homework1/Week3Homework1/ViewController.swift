//
//  ViewController.swift
//  Week3Homework1
//
//  Created by murat albayrak on 12.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var textArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {

        let alertController = UIAlertController(title: "New Text", message: "Enter a text", preferredStyle: .alert)
        

        alertController.addTextField { (textField) in
            textField.placeholder = "Text"
        }
        

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in

            if let textField = alertController.textFields?.first {

                if let text = textField.text {
                    self.textArray.append(text)
                    self.tableView.reloadData()
                }
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = textArray[indexPath.row]

        return cell
    }


}

