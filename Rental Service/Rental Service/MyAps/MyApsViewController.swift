//
//  MyApsViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya

class MyApsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var noFound: UIImageView!
    @IBOutlet weak var segmentCont: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var myAps:[Orders]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MyApsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyApsTableViewCell")
        segmentCont.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        // color of other options
        segmentCont.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x08B0E8)], for: .normal)
        
        segmentCont.layer.borderWidth = 0.5
        segmentCont.layer.borderColor = UIColor(rgb: 0x08B0E8).cgColor
        segmentCont.selectedSegmentTintColor = UIColor(rgb: 0x08B0E8)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Мои апартаменты"
        self.getMyAps()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       if(self.myAps?.count != nil){
           if(section == self.myAps!.count-1){
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = UIColor(rgb: 0xEBF9FD)

           return view
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if(segmentCont.selectedSegmentIndex == 0){
            if(self.myAps?.count != nil && self.myAps?.isEmpty != true){
                self.noLbl.isHidden = true
                self.noFound.isHidden = true
                return myAps!.count
            }
            else{
                self.noLbl.text = "У вас нет бронированных апартаментов, чтобы забронировать апартаменты, выберите апартаменты и нажмите кнопку забронировать."
                self.noFound.isHidden = false
                self.noLbl.isHidden = false
                self.tableView.backgroundColor = .clear
                return 0
            }
        }
        else{
           if(self.myAps?.count != nil && self.myAps?.isEmpty != true){
                self.noLbl.isHidden = true
                self.noFound.isHidden = true
                return myAps!.count
            }
            else{
                self.noLbl.text = "Ваш архив пуст,история бронирования будет автоматически здесь появляться."
                self.noFound.isHidden = false
                self.noLbl.isHidden = false
                self.tableView.backgroundColor = .clear
                return 0
            }

        }
        

    }
    
    func getMyAps(){
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        let now = df.string(from: Date())
        
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getMyAps(apartment: "apartment", userId: UIApplication
                .shared.user?.id, dateFrom: now):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getMyAps(apartment: "apartment", userId: (UIApplication.shared.user?.id)!, dateFrom: now)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.myAps = try moyaResponse.mapArray(Orders.self)
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
    
    
    func getMyArchive(){
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        let now = df.string(from: Date())
        
        
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getMyArchive(apartment: "apartment", userId: UIApplication.shared.user?.id, dateTo: now):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getMyArchive(apartment: "apartment", userId: (UIApplication.shared.user?.id)!, dateTo: now)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.myAps = try moyaResponse.mapArray(Orders.self)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyApsTableViewCell", for: indexPath) as! MyApsTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.addressLbl.text = self.myAps?[indexPath.section].apartment.address
        cell.cityLbl.text = self.myAps?[indexPath.section].apartment.city
        cell.ownerLbl.text = self.myAps?[indexPath.section].apartment.owner.name
        cell.datePosted.text = self.myAps?[indexPath.section].apartment.datePosted
        cell.priceLbl.text = "\(self.myAps?[indexPath.section].apartment.price ?? 0)₸"
        cell.roomLbl.text = "\(self.myAps?[indexPath.section].apartment.countrooms ?? 1) - комн.\(self.myAps?[indexPath.section].apartment.type.lowercased() ?? "")"
        if(self.myAps?[indexPath.section].apartment.isHot == false){
            cell.imgIsHot.isHidden = true
        }
        if(self.segmentCont.selectedSegmentIndex == 1){
            cell.manageBtn.setTitle("Подробнее", for: UIControl.State.normal)
        }
        else{
            cell.manageBtn.setTitle("Управление апартаментами", for: UIControl.State.normal)
        }
        
        cell.manageBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.manageBtn.tag = indexPath.section
        
        let imageUrl = URL(string: (self.myAps?[indexPath.section].apartment.img[0].urlImg)!)
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(
        with: imageUrl,
        placeholder: UIImage(named: "Rectangle 12"),
        options: [
            .transition(.fade(0.5))
        ])
        cell.imgView.layer.cornerRadius = 10
        cell.imgView.layer.borderWidth = 1
        cell.imgView.layer.borderColor = UIColor(rgb: 0x08B0E8).cgColor
        return cell
    }
    @objc func buttonAction(sender: UIButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewMyApsViewController") as! ViewMyApsViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        nextViewController.hidesBottomBarWhenPushed = true
        nextViewController.check = self.segmentCont.selectedSegmentIndex
        nextViewController.apartment = self.myAps?[sender.tag].apartment
        nextViewController.StrdateFrom = self.myAps?[sender.tag].dateFrom
        nextViewController.StrdateTo = self.myAps?[sender.tag].dateTo
        nextViewController.idOrder = (self.myAps?[sender.tag].id)
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewMyApsViewController") as! ViewMyApsViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        nextViewController.hidesBottomBarWhenPushed = true
        nextViewController.check = self.segmentCont.selectedSegmentIndex
        nextViewController.StrdateFrom = self.myAps?[indexPath.section].dateFrom
        nextViewController.StrdateTo = self.myAps?[indexPath.section].dateTo
        nextViewController.apartment = self.myAps?[indexPath.section].apartment
        nextViewController.idOrder =  (self.myAps?[indexPath.section].id)
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    @IBAction func segmAction(_ sender: Any) {
        if(self.segmentCont.selectedSegmentIndex == 0){
           getMyAps()
        }
        else{
           getMyArchive()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       navigationController?.setNavigationBarHidden(true, animated: animated)
       self.navigationItem.title = " "
        self.segmentCont.selectedSegmentIndex = 0
     //  navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Rectangle 63")?.withRenderingMode(.alwaysOriginal)
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Rectangle 63")?.withRenderingMode(.alwaysOriginal)
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
