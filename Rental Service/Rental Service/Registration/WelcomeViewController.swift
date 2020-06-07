//
//  WelcomeViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 3/10/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var HideBtn: UIButton!
    @IBOutlet weak var ContBtn: UIButton!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var SkipBtn: UIButton!
    
  
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var SecTitleLbl: UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideBtn.isHidden = true
        self.HideBtn.layer.cornerRadius = 10
        self.ContBtn.layer.borderWidth = 2
        self.ContBtn.layer.borderColor = UIColor.white.cgColor
        self.ContBtn.layer.cornerRadius = 20
        self.ContBtn.semanticContentAttribute = UIApplication.shared
        .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        self.backImage.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width + 100, height: self.view.frame.size.height);

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ContBtnAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear, animations: {
            
             self.backImage.center.x -= 50
             self.count += 1
             
             if(self.count == 1){
                 self.TitleLbl.text = "Lectus urna, aliquam sed justo"
                 self.SecTitleLbl.text = "Auctor interdum gravida at nisl scelerisque molestie mauris lorem."
             }
             if(self.count == 2){
                self.TitleLbl.text = "Tincidunt id turpis"
                 self.SecTitleLbl.text = "Morbi nascetur nisl magna sed tortor lorem amet"
                 
                 self.HideBtn.isHidden = false
                 self.SkipBtn.isHidden = true
                 self.ContBtn.isHidden = true

                 
             }
             
            
        }, completion: nil)
    }
    
    @IBAction func FinalCont(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Reg", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    @IBAction func SkipBtn(_ sender: Any) {
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
