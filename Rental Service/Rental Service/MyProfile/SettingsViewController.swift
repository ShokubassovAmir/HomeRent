//
//  SettingsViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/21/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import Moya
import Toast_Swift
import Firebase
import ImagePicker
import Kingfisher


class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate,ImagePickerDelegate {
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    var user:User!
    var imageUrl = "noImg"
    var checkImage = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.imageAvatar.isUserInteractionEnabled = true
        self.imageAvatar.addGestureRecognizer(tapGestureRecognizer)
        self.imageAvatar.layer.cornerRadius = imageAvatar.frame.width / 2
        
        
       
        // Do any additional setup after loading the view.
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        self.imageAvatar.image = images[0]
        self.imageAvatar.layer.borderWidth = 1
        self.imageAvatar.layer.borderColor = UIColor.init(rgb: 0x00E2D6).cgColor
        
        let uploadRef = Storage.storage().reference(withPath: "images/\(UIApplication.shared.user?.id ?? 0).jpg")
        
        guard let imageData = imageAvatar.image?.jpegData(compressionQuality: 0.75) else {return}
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"
        uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let error = error{
                print("Неудалось загрузить \(error.localizedDescription)")
                return
            }
            print("Загружено \(downloadMetadata)")
            uploadRef.downloadURL { (url, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                if let url = url{
                    print(url.absoluteString)
                    self.imageUrl = url.absoluteString
                    self.checkImage = true
                }
                
            }
        
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        self.checkImage = false
        if(self.imageUrl == "noImg"){

            let indexpath = IndexPath(row: 1, section: 0)
            let cellOne = tableView.cellForRow(at: indexpath) as! SettingsTableViewCell

            let indexpathTwo = IndexPath(row: 2, section: 0)
            let cellTwo = tableView.cellForRow(at: indexpathTwo) as! SettingsTableViewCell


            if(cellOne.textField.text!.count >= 2 && cellTwo.textField.text?.count == 12){
                let endpointClosure = { (target: RestApi) -> Endpoint in
                    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

                    switch target {
                    case .patchInfo(id: UIApplication.shared.user?.id, name: cellOne.textField.text, phone: cellTwo.textField.text, img:self.imageUrl):
                        return defaultEndpoint
                    default:
                        return defaultEndpoint
                    }
                }

                let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])

                provider.request(.patchInfo(id: (UIApplication.shared.user?.id)!, name: cellOne.textField.text!, phone: cellTwo.textField.text!, img: self.imageUrl)){ result in
                    switch result {
                    case let .success(moyaResponse):
                        do {
                            self.user = try moyaResponse.mapObject(User.self)
                            let data = try moyaResponse.mapJSON()
                            print(data)
                            if(moyaResponse.statusCode == 200){
                                self.view.makeToast("Изменения сохранены")
                                UIApplication.shared.updateUser(profile:self.user )
                            }

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
            else{
                self.view.makeToast("Имя должно быть минимум из 2 букв,телефон должен состоять из 12 символов, включая +")
            }


        }
        else{
            let indexpath = IndexPath(row: 1, section: 0)
            let cellOne = tableView.cellForRow(at: indexpath) as! SettingsTableViewCell

            let indexpathTwo = IndexPath(row: 2, section: 0)
            let cellTwo = tableView.cellForRow(at: indexpathTwo) as! SettingsTableViewCell


            if(cellOne.textField.text!.count >= 2 && cellTwo.textField.text?.count == 12){
                let endpointClosure = { (target: RestApi) -> Endpoint in
                    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

                    switch target {
                    case .patchInfo(id: UIApplication.shared.user?.id, name: cellOne.textField.text, phone: cellTwo.textField.text,img:self.imageUrl):
                        return defaultEndpoint
                    default:
                        return defaultEndpoint
                    }
                }

                let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])

                provider.request(.patchInfo(id: (UIApplication.shared.user?.id)!, name: cellOne.textField.text!, phone: cellTwo.textField.text!, img: self.imageUrl)){ result in
                    switch result {
                    case let .success(moyaResponse):
                        do {
                            self.user = try moyaResponse.mapObject(User.self)
                            let data = try moyaResponse.mapJSON()
                            print(data)
                            if(moyaResponse.statusCode == 200){
                                self.view.makeToast("Изменения сохранены")
                                UIApplication.shared.updateUser(profile:self.user )
                            }

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
            else{
                self.view.makeToast("Имя должно быть минимум из 2 букв,телефон должен состоять из 12 символов, включая +")
            }
        }
        
    
        
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "Настройка"
        if(UIApplication.shared.user?.imageUrl != "noImg"){
            let imageUrl = URL(string: (UIApplication.shared.user?.imageUrl)!)
            imageAvatar.kf.indicatorType = .activity
            imageAvatar.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "image 5"),
            options: [
                .transition(.fade(0.5))
            ])
            self.imageAvatar.layer.borderWidth = 1
            self.imageAvatar.layer.borderColor = UIColor.init(rgb: 0x00E2D6).cgColor
        }
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.title = " "
        if self.isMovingFromParent {
            if(self.checkImage == true){
                let uploadRef = Storage.storage().reference(withPath: "images/\(UIApplication.shared.user?.id ?? 0).jpg")
                uploadRef.delete { (error) in
                    if let error = error{
                        print(error.localizedDescription)
                        return
                    }
                    print("Удалено")
                }
            }
            
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formattedNumber(number: newString)
        return false
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            var config = Configuration()
            config.doneButtonTitle = "Загрузить"
            config.noImagesTitle = "Извините! Здесь нет фотографий!"
            config.recordLocation = false
            config.allowVideoSelection = false

            let imagePicker = ImagePickerController(configuration: config)
            imagePicker.imageLimit = 1
            imagePicker.delegate = self
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.isModalInPresentation = true
            imagePicker.modalTransitionStyle = .crossDissolve
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          var config = Configuration()
          config.doneButtonTitle = "Загрузить"
          config.noImagesTitle = "Извините! Здесь нет фотографий!"
          config.recordLocation = false
          config.allowVideoSelection = false

          let imagePicker = ImagePickerController(configuration: config)
          imagePicker.imageLimit = 1
          imagePicker.delegate = self
          imagePicker.modalPresentationStyle = .fullScreen
          imagePicker.isModalInPresentation = true
          imagePicker.modalTransitionStyle = .crossDissolve
          present(imagePicker, animated: true, completion: nil)
       }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        switch indexPath.row {
        case 0:
            cell.textField.text = "Добавьте фото"
            cell.textField.isEnabled = false
        case 1:
            cell.textField.text = UIApplication.shared.user?.name
        case 2:
            cell.textField.text = UIApplication.shared.user?.phone
            cell.textField.delegate = self
        default:
            break
        }
        return cell
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
