//
//  LoginViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/16/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Toast_Swift
import Moya

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Phone: UITextField!
    
    var getUser:User!
    var getUserArray:[User]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formattedNumber(number: newString)
        return false
    }
    
  
    @IBAction func Login(_ sender: Any) {
        if(self.Phone.text?.isEmpty != true && self.Password.text?.isEmpty != true && self.Phone.text?.count == 12 && self.Password.text!.count >= 6){
            
            
            
            let endpointClosure = { (target: RestApi) -> Endpoint in
                let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                
                
                switch target {
                case .getUser(phone: self.Phone.text, password: self.Password.text):
                    return defaultEndpoint
                default:
                    return defaultEndpoint
                }
            }
            
            
            let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
            
            provider.request(.getUser(phone: self.Phone.text!, password: self.Password.text!)){ result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        if(moyaResponse.statusCode == 200){
                            let response = try moyaResponse.mapJSON()
                            print(response)
                            
                            self.getUserArray = try moyaResponse.mapArray(User.self)
                            if(self.getUserArray?.isEmpty != true){
                                self.getUser = self.getUserArray![0]
                                
                                UIApplication.shared.updateUser(profile: self.getUser)
                                
                                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                var rootViewController:UITabBarController

                                rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainTabBar") as! UITabBarController

                                rootViewController.isModalInPresentation = true
                                rootViewController.modalPresentationStyle = .fullScreen
                                rootViewController.modalTransitionStyle = .crossDissolve

                                self.present(rootViewController, animated: true)
                            }
                            
                        }
                        
                        else{
                            self.view.makeToast("Неверный телефон или пароль")
                        }
                        
                        
                        
                         
                    }
                    catch let error {
                        print(error)
                    }
                // do something in your app
                case let .failure(error):
                    self.view.makeToast("Не удалось авторизоваться")
                    print(error)
                    break
                    // TODO: handle the error == best. comment. ever.
                }
            }
            
            
        }
        else{
            self.view.makeToast("Вы не ввели номер телефона или пароль")
        }
    }
    @IBAction func Register(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegFirstViewController") as! RegFirstViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    @IBAction func ForgotPassword(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RestorePassViewController") as! RestorePassViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+XXXXXXXXXXX"

        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
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

