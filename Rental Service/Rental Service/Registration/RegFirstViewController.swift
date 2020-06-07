//
//  RegFirstViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/16/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Toast_Swift
import Firebase

class RegFirstViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Phone: UITextField!
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formattedNumber(number: newString)
        return false
    }
    
    
    @IBAction func ContAction(_ sender: Any) {
        if(self.Name.text?.isEmpty != true && self.Phone.text?.isEmpty != true && self.Name.text!.count >= 2 && self.Phone.text?.count == 12){
            guard let phoneNumber = Phone.text else {return}
            print(phoneNumber)
            print(phoneNumber.count)
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationId, error) in
                if error == nil{
                    print(verificationId)
                    guard let verifyID = verificationId else{return}
                    self.userDefault.set(verifyID,forKey: "verificationID")
                    self.userDefault.synchronize()
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegSecondViewController") as! RegSecondViewController
                    nextViewController.phoneUser = phoneNumber
                    nextViewController.nameUser = self.Name.text
                    let transition = CATransition()
                    transition.duration = 0.5
                    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                    transition.type = CATransitionType.fade
                    self.navigationController?.view.layer.add(transition, forKey: nil)
                    self.navigationController?.pushViewController(nextViewController, animated: false)
                }
                else{
                    print("Unable to get SVC from firebase",error?.localizedDescription)
                }
            }
            
        }
        else{
            self.view.makeToast("Имя должно быть минимум из 2 букв,телефон должен быть формата +\(77005981609)")
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
