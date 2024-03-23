//
//  SeatDesign.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class SeatDesign: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collectionView: UICollectionView!
    let numberOfSeats = 45
    var nonSelectedSeats = [String]()
    var selectedSeats = [String]()
    
    let seatsPerRow = 5
    let minimumInteritemSpacing: CGFloat = 5
    let minimumLineSpacing: CGFloat = 5
        
    var ticket: Ticket?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SeatCell", bundle: nil), forCellWithReuseIdentifier: "SeatCell")
       
        collectionView.reloadData()
        
    }
    
    @IBAction func continueButton(_ sender: Any) {
        UserDefaults.standard.set(selectedSeats, forKey: "selectedSeats")
    }
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as! SeatCell
        
        cell.seatCellLabel.text = "\(indexPath.item + 1)"
        nonSelectedSeats.append("\(indexPath.item)")
       
        
        
        let clickedCells = UITapGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        
        cell.seatCellLabel.isUserInteractionEnabled = true
        cell.seatCellLabel.addGestureRecognizer(clickedCells)
        
        return cell
    }
    
    @objc func handleClick(_ sender: UITapGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else { return }
        if selectedSeats.count < 5 || selectedSeats.contains(label.text ?? ""){
            if label.backgroundColor == nil {
                label.backgroundColor = .white
            }
            if label.backgroundColor == .white {
                label.backgroundColor = .green
                selectedSeats.append(label.text ?? "")
                if let seatNumberString = label.text, let seatNumber = Int(seatNumberString) {
                    ticket?.addSeatNumber(seatNumber)
                    print("seatdesign ticketin seats arrayine elaman eklendi. \(ticket?.seats[0] ?? 0)")
                }
                if let index = nonSelectedSeats.firstIndex(where: { $0 == label.text }) {
                   

                    nonSelectedSeats.remove(at: index)
                }
            } else {
                label.backgroundColor = .white
                if let index = selectedSeats.firstIndex(where: { $0 == label.text }) {
                    selectedSeats.remove(at: index)
                    if let seatNumberString = label.text, let seatNumber = Int(seatNumberString) {
                        print("seatdesign ticketin seats arrayine elaman kaldirildi.\(ticket?.seats[0])")
                        ticket?.removeSeatNumber(seatNumber)
                    }
                }
                nonSelectedSeats.append(label.text ?? "")
            }
            
        } else {
            let alertController = UIAlertController(title: "Uyarı", message: "En fazla 5 koltuk seçebilirsiniz", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "Tamam", style: .default) { (action:UIAlertAction) in
            print("Tamam butonuna basıldı.")
            }
            alertController.addAction(actionOK)
            self.present(alertController, animated: true, completion: nil)
            print("koltuk secilemedi")
        }
       
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        
        let totalInteritemSpacing = minimumInteritemSpacing * CGFloat(seatsPerRow - 1)
        let availableWidth = collectionViewWidth - totalInteritemSpacing
        
        let cellWidth = availableWidth / CGFloat(seatsPerRow)
        
        return CGSize(width: cellWidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let horizontalInset = minimumInteritemSpacing / 2
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
 

}
    
    

