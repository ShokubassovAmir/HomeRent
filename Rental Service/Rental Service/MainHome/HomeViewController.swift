//
//  HomeViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Moya_ObjectMapper

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var aps:[Apartments]?
    var test:[String]?
    var searchAps:[Apartments]?
    var searching = false
    var filtering = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
          tableView.register(UINib(nibName: "ApartmentTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if(filtering == false){
          self.getAps()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      //  self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Rectangle 63")
      //  self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Rectangle 63")
        filtering = false
    }
    
    

    
    func getAps(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getAparts:
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getAparts){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.aps = try moyaResponse.mapArray(Apartments.self)
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        searchAps = self.aps?.filter({$0.city.prefix(searchText.count) == searchText || $0.address.prefix(searchText.count) == searchText || $0.name.prefix(searchText.count) == searchText || $0.descr.prefix(searchText.count) == searchText || $0.owner.name.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
    
    
    
    @IBAction func toFilter(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FilterPageViewController") as! FilterPageViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        nextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    
    @IBAction func toMap(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        nextViewController.aps = self.aps
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear

        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if (self.aps?.count != nil){
            if(searching != true){
                return self.aps!.count
            }
            else{
                if(self.searchAps?.count != nil){
                    return self.searchAps!.count
                }
                else{
                    return 0
                }
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentTableViewCell", for: indexPath) as! ApartmentTableViewCell
        
        if searching{
            cell.addressLbl.text = self.searchAps?[indexPath.section].address
            cell.cityLbl.text = self.searchAps?[indexPath.section].city
            cell.ownerLbl.text = self.searchAps?[indexPath.section].owner.name
            cell.datePostedLbl.text = self.searchAps?[indexPath.section].datePosted
            cell.priceLbl.text = "\(self.searchAps?[indexPath.section].price ?? 0)₸"
            cell.roomsLbl.text = "\(self.searchAps?[indexPath.section].countrooms ?? 1) - комн.\(self.searchAps?[indexPath.section].type.lowercased() ?? "")"
            if(self.searchAps?[indexPath.section].isHot == false){
                cell.isHotImg.isHidden = true
            }
            
            let imageUrl = URL(string: (self.searchAps?[indexPath.section].img?[0].urlImg)!)
            cell.imgView.kf.indicatorType = .activity
            cell.imgView.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "Rectangle 12"),
            options: [
                .transition(.fade(0.5))
            ])
        
        }
        else{
            cell.addressLbl.text = self.aps?[indexPath.section].address
            cell.cityLbl.text = self.aps?[indexPath.section].city
            cell.ownerLbl.text = self.aps?[indexPath.section].owner.name
            cell.datePostedLbl.text = self.aps?[indexPath.section].datePosted
            cell.priceLbl.text = "\(self.aps?[indexPath.section].price ?? 0)₸"
            cell.roomsLbl.text = "\(self.aps?[indexPath.section].countrooms ?? 1) - комн.\(self.aps?[indexPath.section].type.lowercased() ?? "")"
            if(self.aps?[indexPath.section].isHot == false){
                cell.isHotImg.isHidden = true
            }
            
            let imageUrl = URL(string: (self.aps?[indexPath.section].img[0].urlImg)!)
            cell.imgView.kf.indicatorType = .activity
            cell.imgView.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "Rectangle 12"),
            options: [
                .transition(.fade(0.5))
            ])
        }
        cell.selectionStyle = .none
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
        nextViewController.apartment = self.aps?[indexPath.section]
        self.navigationController?.pushViewController(nextViewController, animated: false)
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
