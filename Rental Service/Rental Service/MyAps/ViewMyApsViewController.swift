//
//  ViewMyApsViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import GoogleMaps
import Moya
class ViewMyApsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var cancOrDel: UIButton!
    @IBOutlet weak var GoogleMap: GMSMapView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var dateFrom: UILabel!
    @IBOutlet weak var dateTo: UILabel!
    var apartment:Apartments!
    var idOrder:UInt64!
    var StrdateFrom:String!
    var StrdateTo:String!
    var check:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy/MM/dd"
        let toDateFrom = dateFormatter.date(from: StrdateFrom)
        let toDateTo = dateFormatter.date(from: StrdateTo)
        let dateFormatterSec = DateFormatter()
        dateFormatterSec.dateFormat = "EEEE, MMMM dd, yyyy"
        dateFormatterSec.locale = Locale(identifier: "ru_RU")
        let newFrom: String = dateFormatterSec.string(from: toDateFrom!)
        let newTo: String = dateFormatterSec.string(from: toDateTo!)
        self.dateFrom.text = newFrom
        self.dateTo.text = newTo
        GoogleMap.settings.compassButton = true
        generateMarkers()
        self.addressLbl.text = self.apartment.address
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let imageUrl = URL(string: (self.apartment.img[0].urlImg)!)
        self.imgView.kf.indicatorType = .activity
        self.imgView.kf.setImage(
        with: imageUrl,
        placeholder: UIImage(named: "Rectangle 12"),
        options: [
            .transition(.fade(0.5))
        ])
        self.imgView.layer.cornerRadius = 10
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = self.apartment.name
        
        if(self.check == 1){
            self.cancOrDel.setTitle("Удалить", for: UIControl.State.normal)
        }
        else{
           self.cancOrDel.setTitle("Отменить бронь", for: UIControl.State.normal)
        }
        
    }
    
    func generateMarkers(){
       let marker = GMSMarker()
        let latitude = self.apartment.latitude
        let longitude = self.apartment.longitude
        marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 10.0)

        self.GoogleMap?.animate(to: camera)
        marker.title = self.apartment.name
        marker.snippet = self.apartment.address
        marker.map = GoogleMap
        
    
    }
    
    @IBAction func condCanc(_ sender: Any) {
    }
    
    @IBAction func callOwner(_ sender: Any) {
        let url:URL = URL(string: "TEL://\(self.apartment.owner.phone ?? 16505553434)")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func cancelRes(_ sender: Any) {
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .delOrder(id:self.idOrder):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.delOrder(id: self.idOrder)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    if(moyaResponse.statusCode == 200){
                        let response = try moyaResponse.mapJSON()
                        print(response)
                        let transition = CATransition()
                        transition.duration = 0.5
                        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                        transition.type = CATransitionType.fade
                        self.navigationController?.view.layer.add(transition, forKey: nil)
                        if(self.check == 0){
                           self.navigationController?.parent!.view.makeToast("Бронь отменена")
                        }
                        else{
                           self.navigationController?.parent!.view.makeToast("Архив удален")
                        }
                        
                        self.navigationController?.popViewController(animated:false)
                    }
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                }
                catch let error {
                    print(error)
                }
            // do something in your app
            case let .failure(error):
                print(error)
                break
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool){
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.title = " "
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
