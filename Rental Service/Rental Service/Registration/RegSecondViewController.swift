//
//  RegSecondViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/16/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Firebase
import Toast_Swift

class RegSecondViewController: UIViewController {

    @IBOutlet weak var SMS: UITextField!
    @IBOutlet weak var LabelSMS: UILabel!
    var nameUser:String!
    var phoneUser:String!
    
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LabelSMS.text = "Введите шестизначный код из смс, которое мы отправили на " + self.phoneUser
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
    @IBAction func SendAgain(_ sender: Any) {
        guard let phoneNumber = self.phoneUser else {return}
        print(phoneNumber)
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationId, error) in
            if error == nil{
                print(verificationId)
                guard let verifyID = verificationId else{return}
                self.userDefault.set(verifyID,forKey: "verificationID")
                self.userDefault.synchronize()
                
                
            }
            else{
                print("Unable to get SVC from firebase",error?.localizedDescription)
            }
        }
    }
    @IBAction func ContAction(_ sender: Any) {
        if(SMS.text?.isEmpty != true && SMS.text?.count == 6){
            guard let sms = SMS.text  else{return}
            
            guard let verificationID = userDefault.string(forKey: "verificationID") else{return}
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: sms)
            Auth.auth().signIn(with: credential) { (success, error) in
                if error == nil{
                    print("Успешно...")
                    print(success)
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegThirdViewController") as! RegThirdViewController
                    nextViewController.userPhone = self.phoneUser
                    nextViewController.userName = self.nameUser
                    let transition = CATransition()
                    transition.duration = 0.5
                    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                           transition.type = CATransitionType.fade
                    self.navigationController?.view.layer.add(transition, forKey: nil)
                    self.navigationController?.pushViewController(nextViewController, animated: false)
                }
                else{
                    print(error?.localizedDescription)
                    print("Неправильный код...")
                    self.view.makeToast("Извините,но СМС код неверен")
                }
            }
        }
        else{
            self.view.makeToast("Вы не ввели СМС код или ввели не 6 цифр")
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
