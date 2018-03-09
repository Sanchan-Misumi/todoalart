//
//  ViewController.swift
//  Calender
//
//  Created by Maho Misumi on 2018/02/24.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class ViewController: UIViewController,FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
    @IBOutlet var calendar: FSCalendar!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var todoItem: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.calendar.dataSource = self
        self.calendar.delegate = self
        print(todoItem)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    //    fileprivate lazy var dateFormatter: DateFormatter = {
    //        let formatter = DateFormatter)
    //        formatter.dateFormat = "yyyy-MM-dd"
    //        return formatter
    //    }()
    
    let tmpCalendar = Calendar(identifier: .gregorian)
    
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }

    struct Constants {
        enum User : String {
            case selectDay
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let selectDay = getDay(date)
        performSegueToDetails()
//        saveData.set(getDay, forKey: constantsdate
        print(selectDay)
        // 保存
        saveData.set(todoItem, forKey: Constants.User.selectDay.rawValue)
//        // 読み込み
//        UserDefaults.standard.string(todoItem, forKey: Constants.User.selectDay.rawValue)
        
    }
    
    func performSegueToDetails(){
        performSegue(withIdentifier: "toDetailsView", sender: nil)
    }
    //セグエを準備するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let DetailsViewController = segue.destination as! DetailsViewController
        if segue.identifier == "toDetailsView"{
            let DetailsViewController = segue.destination as! DetailsViewController
            DetailsViewController.todoItem = self.todoItem
        }
        
    }
    
}

