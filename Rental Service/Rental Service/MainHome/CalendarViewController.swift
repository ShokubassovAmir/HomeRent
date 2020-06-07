//
//  CalendarViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 5/2/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import FSCalendar
import Moya
import Toast_Swift

class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {

    @IBOutlet weak var calendarFS: FSCalendar!
    @IBOutlet weak var nextBtn: UIButton!
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    var datesWithOrdersDate = [Date]()
    var apartment:Apartments!
    var orders:[Orders]?
    private var firstDate: Date?
    private var lastDate: Date?
    private var datesRange: [Date]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendarFS.firstWeekday = 2

        self.nextBtn.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextGo(_ sender: Any) {
        if(firstDate != nil && lastDate != nil){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReserveViewController") as! ReserveViewController
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            nextViewController.apartment = self.apartment
            nextViewController.datesRange = self.datesRange
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(nextViewController, animated: false)
        }
        else{
            self.view.makeToast("Пожалуйста выберите дату ОТ и ДО")
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(true, animated: animated)
        getOrders()

        
         

     }
    
    func getOrders(){
        let endpointClosure = { (target: RestApi) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target {
            case .getOrderForAp(apartmentId: self.apartment.id):
                return defaultEndpoint
            default:
                return defaultEndpoint
            }
        }
        
        let provider = MoyaProvider<RestApi>(endpointClosure:endpointClosure, plugins: [NetworkLoggerPlugin()])
        
        provider.request(.getOrderForAp(apartmentId: self.apartment.id)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.mapJSON()
                    print(data)
                    if (moyaResponse.statusCode == 200){
                       self.orders = try moyaResponse.mapArray(Orders.self)
                        if(self.orders?.count != nil && self.orders?.isEmpty != true){
                            for i in 0 ..< self.orders!.count{
                                let begin = self.dateFormatter.date(from: (self.orders?[i].dateFrom)!)
                                let finish = self.dateFormatter.date(from: (self.orders?[i].dateTo)!)
                                let range = self.OrdersdatesRange(from: begin!, to: finish!)
                                for i in 0 ..< range.count{
                                    self.datesWithOrdersDate.append(range[i])
                                    self.calendarFS.select(range[i])
                                }
                                
                                
                            }
                            self.calendarFS.reloadData()
                        }
                        
                        
                    }
                    
                    
                    
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
    
    func printdates(){
        for i in 0 ..< self.datesWithOrdersDate.count{
            print(datesWithOrdersDate[i])
        }
    }
    
   
     override func viewWillDisappear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       //  self.navigationItem.title = " "
     }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        let date = Date()
        let result = self.dateFormatter.string(from: date)
        return self.dateFormatter.date(from: result)!
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        
        if(self.datesWithOrdersDate.isEmpty != true){
            if self.datesWithOrdersDate.contains(date) {
                return UIColor.red
            }
            
        }
        return UIColor(rgb: 0x2EA3E4)
        
    }
    
  
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return true
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        if(self.datesWithOrdersDate.isEmpty != true){
            if self.datesWithOrdersDate.contains(date) {
                    print("date is not unselectable")
                    return false
            }
        }
        
        return true
    }
    
    
    
    
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // nothing selected:
        if firstDate == nil {
            firstDate = date
            datesRange = [firstDate!]

            print("datesRange contains: \(datesRange!)")
            return
        }

        // only first date is selected:
        if firstDate != nil && lastDate == nil {
            // handle the case of if the last date is less than the first date:
            if date < firstDate! {
                calendar.deselect(firstDate!)
                firstDate = date
                datesRange = [firstDate!]

                print("datesRange contains: \(datesRange!)")

                return
            }

            let range = datesRange(from: firstDate!, to: date)

            lastDate = range.last

            for d in range {
                if(self.datesWithOrdersDate.isEmpty != true){
                    if(self.datesWithOrdersDate.contains(d) == false)  {
                        calendar.select(d)
                    }
                }
                else{
                    calendar.select(d)
                }
            }

            datesRange = range

            print("datesRange contains: \(datesRange!)")

            return
        }

        // both are selected:
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                if(self.datesWithOrdersDate.isEmpty != true){
                    if(self.datesWithOrdersDate.contains(d) == false)  {
                        calendar.deselect(d)
                    }
                }
                else{
                    calendar.deselect(d)
                }
                
                //calendar.deselect(d)
            }

            lastDate = nil
            firstDate = nil

            datesRange = []

            print("datesRange contains: \(datesRange!)")
        }
    }

    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        if firstDate != nil && lastDate == nil{
            if date == firstDate! {
                calendar.deselect(firstDate!)
                firstDate = nil
                datesRange = []

                print("datesRange contains: \(datesRange!)")

                return
            }
        }
        // both are selected:

        // NOTE: the is a REDUANDENT CODE:
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                if(self.datesWithOrdersDate.isEmpty != true){
                    if(self.datesWithOrdersDate.contains(d) == false)  {
                        calendar.deselect(d)
                    }
                }
                else{
                    calendar.deselect(d)
                }
            }

            lastDate = nil
            firstDate = nil

            datesRange = []
            print("datesRange contains: \(datesRange!)")
        }
    }
    func datesRange(from: Date, to: Date) -> [Date] {
        // in case of the "from" date is more than "to" date,
        // it should returns an empty array:
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
    
    func OrdersdatesRange(from: Date, to: Date) -> [Date] {
        // in case of the "from" date is more than "to" date,
        // it should returns an empty array:
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
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
