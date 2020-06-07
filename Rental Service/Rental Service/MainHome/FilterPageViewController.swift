//
//  FilterPageViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 5/4/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift

class FilterPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,returnDataProtocol {
    var aps:[Apartments]?
    @IBOutlet weak var fromtextfield: UITextField!
    @IBOutlet weak var totextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var byDate:Bool!
    var byPrice:Bool!
    var order:String!
    var city:String!
    var type:String!
    var rooms:UInt64!
    var isHot:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FilterCellTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterCellTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Фильтр"
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.reset))//Change your function name and image name here
        self.navigationItem.rightBarButtonItems = [rightBtn]
       
    }
    
    @objc func reset(){
        self.city = nil
        self.isHot = nil
        self.order = nil
        self.rooms = nil
        self.type = nil
        self.fromtextfield.text = ""
        self.totextfield.text = ""
        
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FilterCellTableViewCell {
        cell.actionLbl.setTitle("По дате добавления", for: UIControl.State.normal)
        }
        
        for n in 0...3{
            if let cell = self.tableView.cellForRow(at: IndexPath(row: n, section: 0)) as? FilterCellTableViewCell {
            cell.actionLbl.setTitle("Все", for: UIControl.State.normal)
            }
        }
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = " "
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func returnStringData(myData: String) {
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? FilterCellTableViewCell {
            cell.actionLbl.setTitle(myData, for: UIControl.State.normal)
            self.city = myData
        }
    }
    
    
    func getFilterAps(){
        let a = UInt64(self.fromtextfield.text!)
        let b = UInt64(self.totextfield.text!)
        if(self.byPrice == true){
            let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                switch target {
                case .filter(sort: "price", fromPrice: a, toPrice: b, rooms: self.rooms, order: self.order, type: self.type, city: self.city, isHot: self.isHot):
                    return defaultEndpoint
                default:
                    return defaultEndpoint
                    }
                }
                    
                let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
            provider.request(.filter(sort: "price", fromPrice: a!, toPrice: b!, rooms: self.rooms, order: self.order, type: self.type, city: self.city, isHot: self.isHot)){ result in
                        switch result {
                        case let .success(moyaResponse):
                            do {
                                self.aps = try moyaResponse.mapArray(Apartments.self)
                                let data = try moyaResponse.mapJSON()
                                print(data)
                                if(try moyaResponse.mapArray(Apartments.self).isEmpty != true){
//                                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                                    nextViewController.aps = self.aps
//                                    nextViewController.filtering = true
//                                    nextViewController.hidesBottomBarWhenPushed = false
//                                    let transition = CATransition()
//                                    transition.duration = 0.5
//                                    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//                                    transition.type = CATransitionType.fade
//                                    self.navigationController?.view.layer.add(transition, forKey: nil)
//                                    self.navigationController?.pushViewController(nextViewController, animated: false)
                                    
                                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    var rootViewController:UITabBarController

                                    rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBar") as! UITabBarController
                                     
                                    let navVC = rootViewController.viewControllers![0] as! UINavigationController//
                                    let hv = navVC.topViewController as! HomeViewController
                                    hv.aps = self.aps
                                    hv.filtering = true
                                    rootViewController.isModalInPresentation = true
                                    rootViewController.modalPresentationStyle = .fullScreen
                                    rootViewController.modalTransitionStyle = .crossDissolve

                                    self.present(rootViewController, animated: true,completion: nil)
                                }
                                else{
                                    self.view.makeToast("По вашему запросу ничего не найдено")
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
            
            if(self.byDate == true){
                let endpointClosure = { (target: RestApi) -> Endpoint in
                let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                
                    switch target {
                    case .filter(sort: "datePosted", fromPrice: a, toPrice: b, rooms: self.rooms, order: self.order, type: self.type, city: self.city, isHot: self.isHot):
                               return defaultEndpoint
                        default:
                               return defaultEndpoint
                    }
                }
                       
                    let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
                       
                provider.request(.filter(sort: "datePosted", fromPrice: a!, toPrice: b!, rooms: self.rooms, order: self.order, type: self.type, city: self.city, isHot: self.isHot)){ result in
                        switch result {
                        case let .success(moyaResponse):
                            do {
                                self.aps = try moyaResponse.mapArray(Apartments.self)
                                let data = try moyaResponse.mapJSON()
                                print(data)
                                if(try moyaResponse.mapArray(Apartments.self).isEmpty != true){
                                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    var rootViewController:UITabBarController

                                    rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBar") as! UITabBarController
                                     
                                    let navVC = rootViewController.viewControllers![0] as! UINavigationController//
                                    let hv = navVC.topViewController as! HomeViewController
                                    hv.aps = self.aps
                                    hv.filtering = true
                                    rootViewController.isModalInPresentation = true
                                    rootViewController.modalPresentationStyle = .fullScreen
                                    rootViewController.modalTransitionStyle = .crossDissolve

                                    self.present(rootViewController, animated: true,completion: nil)
                                }
                                else{
                                    self.view.makeToast("По вашему запросу ничего не найдено")
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

    }

    
    @IBAction func showResults(_ sender: Any) {
        if(self.city != nil && self.isHot != nil && self.order != nil && self.rooms != nil && self.type != nil && self.fromtextfield.text?.isEmpty != true && self.totextfield.text?.isEmpty != true){
            getFilterAps()
        }
        else{
            self.view.makeToast("Выберите весь набор фильтров")
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCellTableViewCell", for: indexPath) as! FilterCellTableViewCell
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
        cell.nameLbl.text = "Показать сначала"
        cell.actionLbl.setTitle("По дате добавления", for: UIControl.State.normal)
        case 1:
        cell.nameLbl.text = "Город"
        cell.actionLbl.setTitle("Все", for: UIControl.State.normal)
        case 2:
        cell.nameLbl.text = "Тип"
        cell.actionLbl.setTitle("Все", for: UIControl.State.normal)
        case 3:
        cell.nameLbl.text = "Количество комнат"
        cell.actionLbl.setTitle("Все", for: UIControl.State.normal)
        case 4:
        cell.nameLbl.text = "Срочно сдается"
        cell.actionLbl.setTitle("Все", for: UIControl.State.normal)
        default:
            break
        }
        cell.actionLbl.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.actionLbl.tag = indexPath.row
        return cell
    }
    
    @objc func buttonAction(sender: UIButton!){
        let indexRow = sender.tag
        
        switch indexRow {
        case 0:
        let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
               
           // 2
        let new = UIAlertAction(title: "Сначала новые", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.byDate = true
            self.byPrice = false
            self.order = "desc"
           if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("Сначала новые", for: UIControl.State.normal)
            }
            //delete my object and remove from the table
        })
        let rich = UIAlertAction(title: "Сначала дорогие", style: .default,handler:{ (action: UIAlertAction!) -> Void in
            self.byPrice = true
            self.byDate = false
            self.order = "desc"
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("Сначала дорогие", for: UIControl.State.normal)
            }
            //delete my object and remove from the table
        })
        let poor = UIAlertAction(title: "Сначала дешевые", style: .default,handler:{ (action: UIAlertAction!) -> Void in
            self.byPrice = true
            self.byDate = false
            self.order = "asc"
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("Сначала дешевые", for: UIControl.State.normal)
            }
            //delete my object and remove from the table
        })
               
           // 3
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
           // 4
        optionMenu.addAction(new)
        optionMenu.addAction(rich)
        optionMenu.addAction(poor)
        optionMenu.addAction(cancelAction)

               
           // 5
        self.present(optionMenu, animated: true, completion: nil)
            
        case 1:
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CitiesTableViewController") as! CitiesTableViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        nextViewController.delegate = self
        self.navigationController?.pushViewController(nextViewController, animated: false)
        case 2:
        let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
               
           // 2
        let new = UIAlertAction(title: "Квартира", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.type = "Квартира"
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("Квартира", for: UIControl.State.normal)
            }
            //delete my object and remove from the table
        })
        let rich = UIAlertAction(title: "Дом", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
            self.type = "Дом"
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("Дом", for: UIControl.State.normal)
            }
            //delete my object and remove from the table
        })

           // 3
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
               
           // 4
        optionMenu.addAction(new)
        optionMenu.addAction(rich)
        optionMenu.addAction(cancelAction)
               
           // 5
        self.present(optionMenu, animated: true, completion: nil)
        case 3:
        let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
               
           // 2
        let new = UIAlertAction(title: "1", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.rooms = 1
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("1", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
        let rich = UIAlertAction(title: "2", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.rooms = 2
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("2", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
        let poor = UIAlertAction(title: "3", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.rooms = 3
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("3", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
        let four = UIAlertAction(title: "4", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.rooms = 4
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                
                cell.actionLbl.setTitle("4", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
        let five = UIAlertAction(title: "5+", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.rooms = 5
            if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("5+", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
            
           // 3
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
               
           // 4
        optionMenu.addAction(new)
        optionMenu.addAction(rich)
        optionMenu.addAction(poor)
        optionMenu.addAction(four)
        optionMenu.addAction(five)
        optionMenu.addAction(cancelAction)
               
           // 5
        self.present(optionMenu, animated: true, completion: nil)
        case 4:
        let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
               
           // 2
        let new = UIAlertAction(title: "Да", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.isHot = "true"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("Да", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })
        let rich = UIAlertAction(title: "Нет", style: .default,handler: { (action: UIAlertAction!) -> Void in
            
            self.isHot = "false"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexRow, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("Нет", for: UIControl.State.normal)
            }

            //delete my object and remove from the table
        })


           // 3
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
               
           // 4
        optionMenu.addAction(new)
        optionMenu.addAction(rich)
        optionMenu.addAction(cancelAction)
               
           // 5
        self.present(optionMenu, animated: true, completion: nil)
        default:
            break
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
       case 0:
       let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
              
          // 2
       let new = UIAlertAction(title: "Сначала новые", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.byDate = true
           self.byPrice = false
           self.order = "desc"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
               cell.actionLbl.setTitle("Сначала новые", for: UIControl.State.normal)
           }
           //delete my object and remove from the table
       })
       let rich = UIAlertAction(title: "Сначала дорогие", style: .default,handler:{ (action: UIAlertAction!) -> Void in
           self.byPrice = true
           self.byDate = false
           self.order = "desc"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
               cell.actionLbl.setTitle("Сначала дорогие", for: UIControl.State.normal)
           }
           //delete my object and remove from the table
       })
       let poor = UIAlertAction(title: "Сначала дешевые", style: .default,handler:{ (action: UIAlertAction!) -> Void in
           self.byPrice = true
           self.byDate = false
           self.order = "asc"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
               cell.actionLbl.setTitle("Сначала дешевые", for: UIControl.State.normal)
           }
           //delete my object and remove from the table
       })
              
          // 3
       let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
          // 4
       optionMenu.addAction(new)
       optionMenu.addAction(rich)
       optionMenu.addAction(poor)
       optionMenu.addAction(cancelAction)

              
          // 5
       self.present(optionMenu, animated: true, completion: nil)
           
       case 1:
       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CitiesTableViewController") as! CitiesTableViewController
       let transition = CATransition()
       transition.duration = 0.5
       transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
       transition.type = CATransitionType.fade
       nextViewController.delegate = self
       self.navigationController?.view.layer.add(transition, forKey: nil)
       self.navigationController?.pushViewController(nextViewController, animated: false)
       case 2:
       let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
              
          // 2
       let new = UIAlertAction(title: "Квартира", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.type = "Квартира"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("Квартира", for: UIControl.State.normal)
           }
           //delete my object and remove from the table
       })
       let rich = UIAlertAction(title: "Дом", style: .default,handler: { (action: UIAlertAction!) -> Void in
          
           self.type = "Дом"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("Дом", for: UIControl.State.normal)
           }
           //delete my object and remove from the table
       })

          // 3
       let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
              
          // 4
       optionMenu.addAction(new)
       optionMenu.addAction(rich)
       optionMenu.addAction(cancelAction)
              
          // 5
       self.present(optionMenu, animated: true, completion: nil)
       case 3:
       let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
              
          // 2
       let new = UIAlertAction(title: "1", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.rooms = 1
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("1", for: UIControl.State.normal)
           }

           //delete my object and remove from the table
       })
       let rich = UIAlertAction(title: "2", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.rooms = 2
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("2", for: UIControl.State.normal)
           }

           //delete my object and remove from the table
       })
       let poor = UIAlertAction(title: "3", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.rooms = 3
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
               cell.actionLbl.setTitle("3", for: UIControl.State.normal)
           }

           //delete my object and remove from the table
       })
       let four = UIAlertAction(title: "4", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.rooms = 4
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
               
               cell.actionLbl.setTitle("4", for: UIControl.State.normal)
           }

           //delete my object and remove from the table
       })
       let five = UIAlertAction(title: "5+", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.rooms = 5
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                cell.actionLbl.setTitle("5+", for: UIControl.State.normal)
           }

           //delete my object and remove from the table
       })
           
          // 3
       let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
              
          // 4
       optionMenu.addAction(new)
       optionMenu.addAction(rich)
       optionMenu.addAction(poor)
       optionMenu.addAction(four)
       optionMenu.addAction(five)
       optionMenu.addAction(cancelAction)
              
          // 5
       self.present(optionMenu, animated: true, completion: nil)
       case 4:
       let optionMenu = UIAlertController(title: nil, message: "Выберите опцию", preferredStyle: .actionSheet)
              
          // 2
       let new = UIAlertAction(title: "Да", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.isHot = "true"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
             cell.actionLbl.setTitle("Да", for: UIControl.State.normal)
        }

           //delete my object and remove from the table
       })
       let rich = UIAlertAction(title: "Нет", style: .default,handler: { (action: UIAlertAction!) -> Void in
           
           self.isHot = "false"
        if let cell = self.tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as? FilterCellTableViewCell {
                 cell.actionLbl.setTitle("Нет", for: UIControl.State.normal)
            }
           //delete my object and remove from the table
       })


          // 3
       let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
              
          // 4
       optionMenu.addAction(new)
       optionMenu.addAction(rich)
       optionMenu.addAction(cancelAction)
              
          // 5
       self.present(optionMenu, animated: true, completion: nil)
       default:
           break
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
