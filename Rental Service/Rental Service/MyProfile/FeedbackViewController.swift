//
//  FeedbackViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/21/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift
class FeedbackViewController: UIViewController {

    @IBOutlet weak var textArea: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textArea.layer.borderWidth = 0.5
        self.textArea.layer.borderColor = UIColor(rgb: 0x08B0E8).cgColor

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           navigationController?.setNavigationBarHidden(false, animated: animated)
           let color = UIColor(rgb: 0xEBF9FD)
           let titlecolor = UIColor(rgb: 0x00E2D6)
           self.navigationController?.navigationBar.barTintColor = color
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
           self.navigationItem.title = "Обратная связь"
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.title = " "
       
    }
    
    @IBAction func submitFeedback(_ sender: Any) {
        postFeed()
    }
    
    func postFeed(){
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .postFeedback(id: UIApplication.shared.user?.id, message: self.textArea.text, date: formattedDate):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.postFeedback(id: (UIApplication.shared.user?.id)!, message: self.textArea.text, date: formattedDate)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    if(moyaResponse.statusCode == 201){
                        let response = try moyaResponse.mapJSON()
                        print(response)
                        let transition = CATransition()
                        transition.duration = 0.5
                        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                        transition.type = CATransitionType.fade
                        self.navigationController?.view.layer.add(transition, forKey: nil)
                        self.navigationController?.parent!.view.makeToast("Ваш отзыв успешно отправлен,спасибо!")
                        self.navigationController?.popViewController(animated:false)
                        
                    }
                    
                     
                }
                catch let error {
                    print(error)
                }
            // do something in your app
            case let .failure(error):
                self.view.makeToast("Не удалось отправить отзыв")
                print(error)
                break
                // TODO: handle the error == best. comment. ever.
            }
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
