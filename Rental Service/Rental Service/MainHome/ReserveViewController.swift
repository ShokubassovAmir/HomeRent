//
//  ReserveViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/19/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift
import Braintree
import BraintreeDropIn

class ReserveViewController: UIViewController,SecondViewControllerDelegate,URLSessionDelegate{

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var totalPrice: UILabel!
  
    @IBOutlet weak var guestLbl: UIButton!
    @IBOutlet weak var nightLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameAps: UILabel!
    @IBOutlet weak var dateTo: UILabel!
    @IBOutlet weak var dateFrom: UILabel!
    var apartment:Apartments!
    var datesRange: [Date]?
    
    let tokenizationKey = "sandbox_9q2m9xwt_99qqsyw3sjgqn8j2"
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func PayGo(_ sender: Any) {
        
        let request = BTDropInRequest()
        let dropIn = BTDropInController(authorization: tokenizationKey, request: request)
        {
            [unowned self ] (controller, result, error) in
            if let error = error {
                self.show(message: error.localizedDescription)
            } else if ( result?.isCancelled == true) {
                self.show(message: "Операция отменена")
            } else if let nonce = result?.paymentMethod?.nonce, let amount = self.totalPrice.text{
                self.sendrequest(nonce: nonce, amount: amount)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        
        self.present(dropIn!, animated: true, completion: nil)
        
        
    }
    
    
    func book(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
                   let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                       switch target {
                           case .postOrder(apartmentId:self.apartment.id , userId: (UIApplication.shared.user?.id)!, dateFrom: self.dateFrom.text!, dateTo: self.dateTo.text!):
                               return defaultEndpoint
                           default:
                               return defaultEndpoint
                       }
               }
                          
                          
               let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
                   
               provider.request(.postOrder(apartmentId:self.apartment.id , userId: (UIApplication.shared.user?.id)!, dateFrom: self.dateFrom.text!, dateTo: self.dateTo.text!)){ result in
                   switch result {
                       case let .success(moyaResponse):
                           do {
                               if(moyaResponse.statusCode == 201){
                                   let response = try moyaResponse.mapJSON()
                                   print(response)
                                   self.sendNotif()
                                   
                                   let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    var rootViewController:UITabBarController

                                    rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBar") as! UITabBarController
                                    rootViewController.selectedIndex = 2
                                     
                                    let navVC = rootViewController.viewControllers![2] as! UINavigationController//
                                    let hv = navVC.topViewController as! MyApsViewController
                                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                                        hv.view.makeToast("Успешно забронировано",duration: 4.0)
                                    }
                                    
                                    rootViewController.isModalInPresentation = true
                                    rootViewController.modalPresentationStyle = .fullScreen
                                    rootViewController.modalTransitionStyle = .crossDissolve

                                    self.present(rootViewController, animated: true,completion: nil)
                               }
                                       
                           }
                           catch let error {
                               print(error)
                           }
                              // do something in your app
                       case let .failure(error):
                           self.view.makeToast("Не удалось сделать бронь")
                           print(error)
                           break
                                  // TODO: handle the error == best. comment. ever.
                   }
               }
        
        
        
    }
    @IBAction func CondRent(_ sender: Any) {
    }
    func sendrequest(nonce:String,amount:String){
        let paymentURL = URL(string: "http://192.168.64.2/BookPay/pay.php")!
            var request = URLRequest(url: paymentURL)
            request.httpBody = "payment_method_nonce=\(nonce)&amount=\(amount)".data(using: String.Encoding.utf8)
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) -> Void in
                guard let data = data else {
                    self?.show(message: error!.localizedDescription)
                    return
                }
        
                guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = result["success"] as? Bool, success == true else {
                    self?.show(message: "Операция не прошла успешно,повторите еще раз")
                    return
                }
               // self?.show(message: "Оплата прошла успешно!")
                DispatchQueue.main.async {
                    self?.book()
                }
            }.resume()
    }
    
    func show (message: String) {
           DispatchQueue.main.async {
               let alertController = UIAlertController(title: "HomeRent", message: message, preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present(alertController, animated: true, completion: nil)
           }
       }
    
    func submitButtonPushedWithText(_ text: String) {
        guestLbl.setTitle("Число гостей: \(text)", for: UIControl.State.normal)
    }
    
    func sendNotif(){
        let notification = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Заказ"
        content.body = "Ваш заказ был успешно оформлен,с вами скоро свяжутся"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "ident", content: content, trigger: trigger)
        
        notification.add(request) { (error) in
            print(error?.localizedDescription)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Бронирование"
        let begin = self.dateFormatter.string(from: self.datesRange![0])
        let last = self.dateFormatter.string(from: self.datesRange![self.datesRange!.count-1])
        let start = self.datesRange![0]
        let end = self.datesRange![self.datesRange!.count-1]

        let diff = Date.daysBetween(start: start, end: end) + 1
        self.nightLbl.text = "\(diff)"
        self.dateTo.text = last
        self.dateFrom.text = begin
        self.nameAps.text = self.apartment.name
        self.priceLbl.text = "\(self.apartment.price ?? 0)₸"
        let total = diff * Int(self.apartment.price)
        self.totalPrice.text = "\(total)"
        let imageUrl = URL(string: (self.apartment.img[0].urlImg))
        self.imgView.kf.indicatorType = .activity
        self.imgView.kf.setImage(
        with: imageUrl,
        placeholder: UIImage(named: "Rectangle 12"),
        options: [
            .transition(.fade(0.5))
        ])
        self.imgView.layer.cornerRadius = 10
        

    }
    @IBAction func guestNumber(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Login = storyboard.instantiateViewController(withIdentifier: "GuestsViewController") as! GuestsViewController
        
        Login.isModalInPresentation = true
        Login.modalPresentationStyle = .popover
        Login.modalTransitionStyle = .crossDissolve
        Login.bedPlaces = Int(self.apartment.bedPlaces)
        Login.delegate = self
        self.present(Login, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
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

extension Date {

    func daysBetween(date: Date) -> Int {
        return Date.daysBetween(start: self, end: date)
    }

    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)

        let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!
    }
}
