//
//  GuestsViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 5/2/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Toast_Swift

class GuestsViewController: UIViewController {
    @IBOutlet weak var btnOutletSave: UIButton!
     
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var countLbl: UILabel!
    
    var delegate: SecondViewControllerDelegate?
    var bedPlaces: Int!
    var someValue: Int = 1 {
           didSet {
               countLbl.text = "\(someValue)"
           }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alertView.layer.cornerRadius = 15
        self.btnOutletSave.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        delegate?.submitButtonPushedWithText(self.countLbl.text!)
        self.dismiss(animated: true, completion: nil)
       
        
    }
    

    
    @IBAction func btnReset(_ sender: Any) {
        someValue = 1
    }
    @IBAction func btnPlus(_ sender: Any) {
        if(countLbl.text != "\(bedPlaces ?? 0)"){
            someValue += 1
        }
        else{
            self.view.makeToast("Максимальное количество гостей \(bedPlaces ?? 0)")
        }
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        if(countLbl.text != "1"){
           someValue -= 1
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

protocol SecondViewControllerDelegate {

    func submitButtonPushedWithText(_ text: String)
}
