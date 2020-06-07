//
//  MapViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import GoogleMaps
class MapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapGoogle: GMSMapView!
    var aps:[Apartments]!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapGoogle.settings.compassButton = true
        mapGoogle.isMyLocationEnabled = true
        mapGoogle.settings.myLocationButton = true
        
        self.locationManager.delegate = self
        
        self.locationManager.startUpdatingLocation()
        
        
        generateMarkers()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func toFilter(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FilterPageViewController") as! FilterPageViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 6.0)

        self.mapGoogle?.animate(to: camera)

        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()

    }
    
    @IBAction func backTo(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
    
    func generateMarkers(){
        for ap in self.aps{
            let marker = GMSMarker()
            let latitude = ap.latitude
            let longitude = ap.longitude
            marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            marker.title = ap.name
            marker.snippet = ap.address
            marker.map = mapGoogle
        }
    
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
