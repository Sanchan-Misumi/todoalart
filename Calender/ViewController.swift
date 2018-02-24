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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.calendar.dataSource = self
        self.calendar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){}

    let selectDay = getDay(date)

}

