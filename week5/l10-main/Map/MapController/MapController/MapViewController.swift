//
//  ViewController.swift
//  MapController
//
//  Created by Kerem Demir on 19.03.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adressLabel: UILabel!
    
      let locationManager = CLLocationManager()
      var lastLocation: CLLocation?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          checkLocationServices()
      }
      
      func setupLocationManager() {
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
      }
      
      func showUserLocationCenterMap() {
          if let location = locationManager.location?.coordinate {
              let region = MKCoordinateRegion(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
              mapView.setRegion(region, animated: true)
          }
      }
      
      func checkLocationServices() {
          DispatchQueue.global().async {
              if CLLocationManager.locationServicesEnabled() {
                  self.setupLocationManager()
                  self.checkLocationAuthorization()
              } else {
                  // TODO: Kullaniciyi ayarlardan konum servisini acmak icin yonlendir.
              }
          }
      }
      
      func checkLocationAuthorization() {
          switch CLLocationManager.authorizationStatus() {
          case .notDetermined:
              self.locationManager.requestWhenInUseAuthorization()
          case .restricted, .denied:
              break
          case .authorizedAlways, .authorizedWhenInUse:
              print("Kullanici izin almis.")
              self.trackingLocation()
          @unknown default:
              break
          }
      }
      
      func trackingLocation() {
          mapView.showsUserLocation = true
          showUserLocationCenterMap()
//          addPinToCurrentLocation()
          locationManager.startUpdatingLocation()
          lastLocation = getCenterLocation(mapView)
      }
      
      func getCenterLocation(_ mapView: MKMapView) -> CLLocation {
          let latitude = mapView.centerCoordinate.latitude
          let longitude = mapView.centerCoordinate.longitude
          return CLLocation(latitude: latitude, longitude: longitude)
      }
  }

  extension MapViewController: CLLocationManagerDelegate {
      func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          checkLocationAuthorization()
      }
  }

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation else { return }
        guard center.distance(from: lastLocation) > 50 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] placemarks, error in
            guard let self else { return }
            if let error {
                print("Error at reverse geo code : \(error.localizedDescription)")
                return
            }
            guard let placemark = placemarks?.first else { return }
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            
            self.adressLabel.text = "\(city) - \(street)"
        }
    }
}

// TODO: Alabildiginiz tum konum bilgilerini alip adresi labael'a yazdiriniz. Pin ve konumu birlikte hareket ettiriniz.
