//
//  FavouritesViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya

class FavouritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var lblHidden: UILabel!
    @IBOutlet weak var imgHidden: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var NoLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var favorites:[Favorites]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ApartmentTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
       view.backgroundColor = UIColor(rgb: 0xEBF9FD)

        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(self.favorites?.count != nil && self.favorites?.isEmpty != true){
            self.NoLabel.isHidden = true
            self.imgView.isHidden = true
            return favorites!.count
        }
        else{
            self.NoLabel.isHidden = false
            self.imgView.isHidden = false
            self.tableView.backgroundColor = .clear
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(self.favorites?.count != nil){
            if(section == self.favorites!.count-1){
                return 0
            }
            else{
                return 10
            }
        }
        else{
          return 10
        }
        
    }
    
    
    func getFavour(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getMyFavoutites(apartment: "apartment", userId: UIApplication.shared.user?.id):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getMyFavoutites(apartment: "apartment", userId: (UIApplication.shared.user?.id)!)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.favorites = try moyaResponse.mapArray(Favorites.self)
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                    self.tableView.reloadData()
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
    
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentTableViewCell", for: indexPath) as! ApartmentTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.imgLike.image = UIImage(named: "Rectangle 50")
        cell.addressLbl.text = self.favorites?[indexPath.section].apartment.address
        cell.cityLbl.text = self.favorites?[indexPath.section].apartment.city
        cell.ownerLbl.text = self.favorites?[indexPath.section].apartment.owner.name
        cell.datePostedLbl.text = self.favorites?[indexPath.section].apartment.datePosted
        cell.priceLbl.text = "\(self.favorites?[indexPath.section].apartment.price ?? 0)₸"
        cell.roomsLbl.text = "\(self.favorites?[indexPath.section].apartment.countrooms ?? 1) - комн.\(self.favorites?[indexPath.section].apartment.type.lowercased() ?? "")"
        if(self.favorites?[indexPath.section].apartment.isHot == false){
            cell.isHotImg.isHidden = true
        }
        let imageUrl = URL(string: (self.favorites?[indexPath.section].apartment.img[0].urlImg)!)
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "Rectangle 12"),
            options: [
                .transition(.fade(0.5))
            ])
        cell.imgView.layer.cornerRadius = 10
        cell.imgView.layer.borderWidth = 2
        cell.imgView.layer.borderColor = UIColor(rgb: 0x00E2D6).cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewHomeViewController") as! ViewHomeViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        nextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.view.layer.add(transition, forKey: nil)
        nextViewController.apartment = self.favorites?[indexPath.section].apartment
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.getFavour()
        self.navigationItem.title = "Избранные"
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Rectangle 63")
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Rectangle 63")
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
