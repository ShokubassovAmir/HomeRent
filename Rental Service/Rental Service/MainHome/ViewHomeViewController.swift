//
//  ViewHomeViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift
import GoogleMaps
import ImageSlideshow
import Firebase

class ViewHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var constHeight: NSLayoutConstraint!
    @IBOutlet weak var roomsLbl: UILabel!
    @IBOutlet weak var ownerLbl: UILabel!
    
    @IBOutlet weak var descripLbl: UILabel!


    @IBOutlet weak var bedPlacesLbl: UILabel!
    @IBOutlet weak var FloorLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var mapGoogle: GMSMapView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ImgView: ImageSlideshow!
    @IBOutlet weak var collectionView: UICollectionView!
    var apartment:Apartments!
    var aps:[Favorites]?
    var comfort:[Comfort]?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapGoogle.settings.compassButton = true
        self.collectionView.register(UINib(nibName: "ComfortCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ComfortCollectionViewCell")
        self.LoadImages()
        generateMarkers()
        self.ownerLbl.text = self.apartment.owner.name
        self.descripLbl.text = self.apartment.descr
        self.roomsLbl.text = "\(self.apartment.countrooms ?? 0)"
        self.bedPlacesLbl.text = "\(self.apartment.bedPlaces ?? 0)"
        self.addressLbl.text = self.apartment.address
        self.priceLbl.text = "\(self.apartment.price ?? 0)₸"
        self.lblName.text = self.apartment.name
        self.comfort = self.apartment.comfort
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height;
        constHeight.constant = height;
    }
    
   
    
    @IBAction func callOwner(_ sender: Any) {
        let url:URL = URL(string: "TEL://\(self.apartment.owner.phone ?? 16505553434)")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    func generateMarkers(){
       let marker = GMSMarker()
        let latitude = self.apartment.latitude
        let longitude = self.apartment.longitude
        marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 10.0)

        self.mapGoogle?.animate(to: camera)
        marker.title = self.apartment.name
        marker.snippet = self.apartment.address
        marker.map = mapGoogle
        
    
    }

    
    
    
    
    @objc func addToFavour(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .postFavour(apatmentId: self.apartment.id, userId: UIApplication.shared.user?.id):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.postFavour(apatmentId: self.apartment.id, userId: (UIApplication.shared.user?.id)!)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                    if(moyaResponse.statusCode == 201){
                        self.view.makeToast("Успешно добавлено в избранное")
                        let rightBtn = UIBarButtonItem(image: UIImage(named: "Rectangle 49")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.deleteFromFavour))//Change your function name and image name here
                        let share = UIBarButtonItem(image: UIImage(named: "Rectangle 36")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.share))
                        self.navigationItem.rightBarButtonItems = [share,rightBtn]
                        
                    }
                    else{
                        self.view.makeToast("Неудалось добавить в избранное")
                    }
                    
                    
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
    @objc func share(){
      //let link = URL(string: "https://homerent.com/apartments?apartmentID=\(self.apartment.id)")
        
        var component = URLComponents()
        component.scheme = "https"
        component.host = "www.homerent.com"
        component.path = "/apartments"
        let apsIDQueryItem = URLQueryItem(name: "apartmentID", value: "\(self.apartment.id ?? 0)")
        component.queryItems = [apsIDQueryItem]
        
        guard let linkparameter = component.url else {return}
        print("link is \(linkparameter.absoluteString)")
        
        guard let shareLink = DynamicLinkComponents.init(link: linkparameter, domainURIPrefix: "https://homerenttest.page.link") else{
            print("error")
            return
        }
        if let myBundle = Bundle.main.bundleIdentifier{
           shareLink.iOSParameters = DynamicLinkIOSParameters(bundleID: myBundle )
            
        }
        //googlePhoto
        shareLink.iOSParameters?.appStoreID = "962194608"
        shareLink.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
        shareLink.socialMetaTagParameters?.title = "\(self.apartment.name ?? "noname") от HomeRent"
        shareLink.socialMetaTagParameters?.descriptionText = self.apartment.descr
        shareLink.socialMetaTagParameters?.imageURL = URL(string: self.apartment.img[0].urlImg)
        guard let longURL = shareLink.url else {return}
        print("long is \(longURL.absoluteString)")
        
        shareLink.shorten {[weak self] (url, warnings, error) in
            if let error = error{
                print("error \(error)")
                return
            }
            if let warnings = warnings{
                for warning in warnings{
                    print("warning \(warning)")
                }
                
            }
            guard let url = url else{return}
            print("short url \(url.absoluteString)")
            self?.showshare(url: url)
        }
    }
    func showshare(url:URL){
        let promotext = "Просмотри это жилье \(self.apartment.name ?? "noname"), которое я нашел на сервисе HomeRent!"
        let activity = UIActivityViewController(activityItems: [promotext,url], applicationActivities: nil)
        self.present(activity, animated: true)
    }
    
    @objc func deleteFromFavour(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .deleteFavour(apartmentId: self.aps?[0].id):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.deleteFavour(apartmentId: (self.aps?[0].id)!)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                    if(moyaResponse.statusCode == 200){
                        self.view.makeToast("Успешно удалено из избранного")
                        let rightBtn = UIBarButtonItem(image: UIImage(named: "Favourites")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.addToFavour))//Change your function name and image name here
                        let share = UIBarButtonItem(image: UIImage(named: "Rectangle 36")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.share))
                        self.navigationItem.rightBarButtonItems = [share,rightBtn]
                    }
                    else{
                        self.view.makeToast("Неудалось удалить из избранного")
                    }
                    
                    
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
    
    
    
    
    func isFavour(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getIsFavour(apartment: "apartment", apartmentId:self.apartment.id , userId: UIApplication.shared.user?.id):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getIsFavour(apartment: "apartment", apartmentId: self.apartment.id, userId: (UIApplication.shared.user?.id)!)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                    if(moyaResponse.statusCode == 200){
                        self.aps = try moyaResponse.mapArray(Favorites.self)
                        if(self.aps?.isEmpty != true){
                            let rightBtn = UIBarButtonItem(image: UIImage(named: "Rectangle 49")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.deleteFromFavour))//Change your function name and image name here
                            let share = UIBarButtonItem(image: UIImage(named: "Rectangle 36")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.share))
                                   self.navigationItem.rightBarButtonItems = [share,rightBtn]
                            
                            
                        }
                        else{
                            let rightBtn = UIBarButtonItem(image: UIImage(named: "Favourites")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.addToFavour))//Change your function name and image name here
                            let share = UIBarButtonItem(image: UIImage(named: "Rectangle 36")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.share))
                            self.navigationItem.rightBarButtonItems = [share,rightBtn]
                        }
                        
                    }
                    else{
                        self.view.makeToast("Неудалось проверить на избранное")
                    }
                    
                    
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
    
    
    @IBAction func Reserve(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        nextViewController.apartment = self.apartment
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        self.isFavour()
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Объявление"
       
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.navigationItem.title = " "
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(self.comfort?.count != nil){
            return self.comfort!.count
        }
        else{
          return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: 50)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComfortCollectionViewCell", for: indexPath) as! ComfortCollectionViewCell
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 7
        cell.nameLbl.text = self.comfort?[indexPath.row].name
        return cell
    }
    
    func LoadImages(){
        self.ImgView.backgroundColor = UIColor.clear
        self.ImgView.slideshowInterval = 4.0
        self.ImgView.contentScaleMode = UIView.ContentMode.scaleToFill
        self.ImgView.activityIndicator = DefaultActivityIndicator()
       
        let ee = [SDWebImageSource(url: URL(string: self.apartment.img[0].urlImg)!),SDWebImageSource(url: URL(string: self.apartment.img[1].urlImg)!)]
        self.ImgView.setImageInputs(ee)
    
        
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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
