//
//  SeatDesign.swift
//  TicketApp
//
//  Created by murat albayrak on 16.03.2024.
//

import UIKit

class SeatDesign: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collectionView: UICollectionView!
    // Koltukların sayısı
    let numberOfSeats = 45
    var nonSelectedSeats = [String]()
    var selectedSeats = [String]()
    
    let seatsPerRow = 5
    let minimumInteritemSpacing: CGFloat = 5 // Minimum yatay boşluk
    let minimumLineSpacing: CGFloat = 5 // Minimum dikey boşluk
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Collection view'nin veri kaynağını bu sınıf olarak ayarla
        collectionView.dataSource = self
        collectionView.delegate = self
               
        collectionView.register(UINib(nibName: "SeatCell", bundle: nil), forCellWithReuseIdentifier: "SeatCell")

        // Collection view'yi yeniden yükle
        collectionView.reloadData()
    }

    // UICollectionViewDataSource metotları
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as! SeatCell
        
        // Hücre içeriğini ayarla, örneğin koltuk numarasını atayabilirsiniz
        cell.seatCellLabel.text = "\(indexPath.item + 1)"
        nonSelectedSeats.append("\(indexPath.item)")
       
        
        
        let clickedCells = UITapGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        
        cell.seatCellLabel.isUserInteractionEnabled = true
        cell.seatCellLabel.addGestureRecognizer(clickedCells)
        
        return cell
    }
    
    @objc func handleClick(_ sender: UITapGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else { return }
       // label.backgroundColor = .white
        // Arka plan rengi beyaz ise yeşil yap, aksi takdirde beyaz yap
        if selectedSeats.count < 5 || selectedSeats.contains(label.text ?? ""){
            if label.backgroundColor == nil {
                label.backgroundColor = .white
            }
            if label.backgroundColor == .white {
                label.backgroundColor = .green
                selectedSeats.append(label.text ?? "")
                if let index = nonSelectedSeats.firstIndex(where: { $0 == label.text }) {
                    // Bulunan indeksi diziden kaldır
                    nonSelectedSeats.remove(at: index)
                }
            } else {
                label.backgroundColor = .white
                if let index = selectedSeats.firstIndex(where: { $0 == label.text }) {
                    // Bulunan indeksi diziden kaldır
                    selectedSeats.remove(at: index)
                }
                nonSelectedSeats.append(label.text ?? "")
            }
            
        } else {
            print("koltuk secilemedi")
        }
        
        
        
       
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Collection view genişliğini al
        let collectionViewWidth = collectionView.frame.width
        
        // Hücreler arasındaki yatay boşluğu hesapla
        let totalInteritemSpacing = minimumInteritemSpacing * CGFloat(seatsPerRow - 1)
        let availableWidth = collectionViewWidth - totalInteritemSpacing
        
        // Bir hücrenin genişliğini hesapla
        let cellWidth = availableWidth / CGFloat(seatsPerRow)
        
        return CGSize(width: cellWidth, height: 50) // Hücre yüksekliği 50 birim olsun
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Sol ve sağ kenarlara boşluk ver
        let horizontalInset = minimumInteritemSpacing / 2
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing // Dikey boşluğu ayarla
    }

}
    
    

