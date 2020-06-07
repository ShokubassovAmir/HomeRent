//
//  RegThirdViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/16/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Toast_Swift
import Moya

class RegThirdViewController: UIViewController {
    

    @IBOutlet weak var condandpay: UITextView!
    @IBOutlet weak var Password: UITextField!
    var userName:String!
    var userPhone:String!
    let userDefault = UserDefaults.standard
    var newUser:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedString = NSMutableAttributedString(string: "Нажимая “Создать аккаунт”, я соглашаюсь принять эти правила: Условия предоставления услуг, Условия обработки платежей и Политика конфиденциальности")
        let url = URL(string: "https://www.apple.com")!
             
        let urlsec = URL(string: "https://www.google.com")!


             // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: url], range: NSMakeRange(60, 57))
        attributedString.setAttributes([.link: urlsec], range: NSMakeRange(119, 28))
         attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, 59))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: NSMakeRange(60, 57))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: NSMakeRange(119, 28))
             
        self.condandpay.attributedText = attributedString
        self.condandpay.isUserInteractionEnabled = true
        self.condandpay.isEditable = false
        self.condandpay.textColor = UIColor.darkGray
        
        let color = UIColor(rgb: 0x27BAEB)
        
        self.condandpay.linkTextAttributes = [
            .foregroundColor: color]
             

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
    
    @IBAction func CreateAction(_ sender: Any) {
        if(self.Password.text?.isEmpty != true && self.Password.text!.count >= 6){
            
            let verificationID = userDefault.string(forKey: "verificationID")!
            
            let endpointClosure = { (target: RestApi) -> Endpoint in
                let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                
                switch target {
                case .postUser(name: self.userName, phone: self.userPhone, password: self.Password.text, verificationID: verificationID):
                    return defaultEndpoint
                default:
                    return defaultEndpoint
                }
            }
            
            
            let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
            
            provider.request(.postUser(name: self.userName, phone: self.userPhone, password: self.Password.text!, verificationID: verificationID)){ result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        if(moyaResponse.statusCode == 201){
                            let response = try moyaResponse.mapJSON()
                            print(response)
                            
                            self.newUser = try moyaResponse.mapObject(User.self)
                            
                            UIApplication.shared.updateUser(profile: self.newUser)
                        }
                        
                        
                        
                         
                    }
                    catch let error {
                        print(error)
                    }
                // do something in your app
                case let .failure(error):
                    self.view.makeToast("Не удалось cоздать аккаунт")
                    print(error)
                    break
                    // TODO: handle the error == best. comment. ever.
                }
            }
            
            
            
            
            
        }
        else{
            self.view.makeToast("Пароль меньше 6 символов")
        }
    }
    @IBAction func AlreadyLog(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
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


