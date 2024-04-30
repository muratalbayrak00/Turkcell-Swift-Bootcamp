//
//  CookCreateViewController.swift
//  TGY2024-Week-5
//
//  Created by Kerem Demir on 14.03.2024.
//

import UIKit
import CoreData

class CookCreateViewController: UIViewController {

    @IBOutlet weak var cookNameTextField: UITextField!
    @IBOutlet weak var cookImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cookImageView.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        cookImageView.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: Actions
    @IBAction func saveButtoAction(_ sender: Any) {
        guard let appDelegae = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegae.persistentContainer.viewContext
        
        let newCook = NSEntityDescription.insertNewObject(forEntityName: "Cooks", into: context)
        newCook.setValue(cookNameTextField.text, forKey: "name")
        
        let imageData = cookImageView.image?.jpegData(compressionQuality: 0.5)
        newCook.setValue(imageData, forKey: "image")
        
        do {
            print("Veri kaydedildi : \(cookNameTextField.text!) -> image : \(imageData!)")
            
            try context.save()
        } catch {
            print("Veri kaydedilemedi.")
        }
        
        // Listeye gec
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
}

extension CookCreateViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
    }
}
