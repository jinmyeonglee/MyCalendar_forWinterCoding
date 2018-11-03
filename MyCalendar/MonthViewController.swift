//
//  MonthViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class MonthViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var Calendar: FSCalendar!
    
    private var realm: Realm!
    private var allSchedule: Results<ScheduleModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Calendar.delegate = self
        Calendar.dataSource = self
        
        // Realm init
        realm = try! Realm()
        
        allSchedule = realm.objects(ScheduleModel.self).sorted(byKeyPath: "date", ascending: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Calendar.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UserDefaults.standard.set(self.tabBarController?.selectedIndex, forKey: "tabIndex")
        UserDefaults.standard.synchronize()
//        print(self.tabBarController?.selectedIndex)
//        print(UserDefaults.standard.integer(forKey: "tabIndex"))
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        var cnt: Int = 0
        
        for shced in allSchedule {
            if(date.getMonthName() == shced.date?.getMonthName() && date.getDayName() == shced.date?.getDayName() && date.getYearName() == shced.date?.getYearName()) {
                cnt += 1
            }
        }

        return cnt
    }

}

extension Date {
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getDayName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let strDay = dateFormatter.string(from: self)
        return strDay
    }
    
    func getYearName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        let strYear = dateFormatter.string(from: self)
        return strYear
    }
    
    func adding(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: self)!
    }
}
