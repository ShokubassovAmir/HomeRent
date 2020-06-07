//
//  NewsViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/21/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var noImageLbl: UIImageView!
    @IBOutlet weak var noNewsLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var news:[News]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if(self.news?.count != nil && self.news?.isEmpty != true){
            self.noNewsLbl.isHidden = true
            self.noImageLbl.isHidden = true
            return news!.count
        }
        else{
            self.noNewsLbl.isHidden = false
            self.noImageLbl.isHidden = false
            self.tableView.backgroundColor = .clear
            return 0
        }
    }
    
    func getNews(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getNews:
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getNews){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.news = try moyaResponse.mapArray(News.self)
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    
                    
                    self.tableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        cell.contentLbl.text = self.news?[indexPath.section].content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(self.news?.count != nil){
            if(section == self.news!.count-1){
                return 0
            }
            else{
                return 10
            }
        }
        else{
            return 10
        }
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: "https://stackoverflow.com") else { return }
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = UIColor(rgb: 0xEBF9FD)

        return view
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(false, animated: animated)
         self.getNews()
         let color = UIColor(rgb: 0xEBF9FD)
         let titlecolor = UIColor(rgb: 0x00E2D6)
         self.navigationController?.navigationBar.barTintColor = color
         self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
         self.navigationItem.title = "Новости"
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
