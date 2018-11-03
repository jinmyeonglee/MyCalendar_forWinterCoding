//
//  MonthViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit
import FSCalendar

class MonthViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var Calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Calendar.delegate = self
        Calendar.dataSource = self
        scheds.append(ScheduleModel(content: "아 ios싫다....", date: Date()))
        scheds.append(ScheduleModel(content: "아 히로록히로록", date: Date().adding(day: -6)))
        scheds.append(ScheduleModel(content: "아 ios싫다..재미가 읍따", date: Date().adding(day: -5)))
        scheds.append(ScheduleModel(content: "아 사쿠라 넘무 예뻐요", date: Date().adding(day: -4)))
        scheds.append(ScheduleModel(content: "배고팡...힝구!", date: Date().adding(day: -3)))
        scheds.append(ScheduleModel(content: "와 진짜 하나도 안예쁘다..", date: Date().adding(day: 1)))
        scheds.append(ScheduleModel(content: "그치만,,,난 주말동안 놀거라궁!!", date: Date().adding(day: 2)))
        scheds.append(ScheduleModel(content: "뀨... 난 기여워..", date: Date().adding(day: 3)))
        scheds.append(ScheduleModel(content: "끼루룩...", date: Date().adding(day: 3)))
        scheds.append(ScheduleModel(content: "대구가고싶다!!!!!!!", date: Date().adding(day: -1)))
        scheds.append(ScheduleModel(content: "이제 할말이 없는뎅...히히", date: Date().adding(day: 4)))
        scheds.append(ScheduleModel(content: "딘몽,,,ㅠㅜㅠㅜ배고파여...ㅠㅜㅠㅜㅠㅜ", date: Date().adding(day: 1)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Calendar.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        var cnt: Int = 0
        
        for shced in scheds {
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
