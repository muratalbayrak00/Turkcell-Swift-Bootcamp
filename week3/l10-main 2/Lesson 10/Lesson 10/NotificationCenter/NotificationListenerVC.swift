

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var images = ["kangal","kayisi","cagkebap","suthelvasi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationCenter: NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil)
    }
    
    @objc func changeImage() {
        if let randomImageName = images.randomElement() {
            imageView.image = UIImage(named: randomImageName)
        }
    }
    
}

// fromListenerToSender

// HOMEWORK : Resim disinda sender ekranindan kullanicinin girdigi degeri ilk ekrandaki label'a tasiyiniz.
// Frame ve bound arasindaki fark nedir aciklayiniz ?
// static keyword ne zaman ve neden kullanilir ?
// Bir tableview veya collectionview kullanarak listeye eleman ekleyebileceginiz bir uygulama yapiniz. 
// Sag ust kosede konacak bir + butonu ile acilacak alertview icindeki textfield ile alinan veriyi tableview
// veya colelctionview'e ekleyiniz.
