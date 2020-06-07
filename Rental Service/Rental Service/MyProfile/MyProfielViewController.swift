//
//  MyProfielViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/21/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit

class MyProfielViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Мой профиль"
        self.nameLbl.text = UIApplication.shared.user?.name
        self.phoneLbl.text = UIApplication.shared.user?.phone
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        switch indexPath.row {
        case 0:
            cell.lblText.text = "Изменить личные данные"
        case 1:
            cell.lblText.text = "Помощь"
        case 2:
            cell.lblText.text = "Условия предоставления услуг"
        case 3:
            cell.lblText.text = "Обратная связь"
        case 4:
            cell.lblText.text = "Удалить аккаунт"
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            nextViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(nextViewController, animated: false)
        case 1:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            nextViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.view.layer.add(transition, forKey: nil)
            
            self.navigationController?.pushViewController(nextViewController, animated: false)
        
        case 2:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ConditionViewController") as! ConditionViewController
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            nextViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(nextViewController, animated: false)
            
        case 3:
           let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            nextViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(nextViewController, animated: false)
            
        case 4:
            let alert = UIAlertController(title: "Удаление аккаунта", message: "Вы действительно хотите удалить аккаунт? ", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Удалить", style: UIAlertAction.Style.destructive, handler: {action in
                self.deleteAcc()
            }))
            alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
        default:
            break
        }
        
        
    }
    
    func deleteAcc(){
        let storyboard = UIStoryboard(name: "Reg", bundle: nil)
        let Login = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.clearUser()
        Login.isModalInPresentation = true
        Login.modalPresentationStyle = .fullScreen
        Login.modalTransitionStyle = .flipHorizontal
        self.present(Login, animated: true)
        print("Acc deleted")
    }
    
    
    @IBAction func Logout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Reg", bundle: nil)
        let Login = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.clearUser()
        Login.isModalInPresentation = true
        Login.modalPresentationStyle = .fullScreen
        Login.modalTransitionStyle = .flipHorizontal
        self.present(Login, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.title = " "
 //       navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Rectangle 63")
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Rectangle 63")
        
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
