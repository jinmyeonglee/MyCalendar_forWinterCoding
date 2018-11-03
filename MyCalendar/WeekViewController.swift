//
//  WeekViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit
import FSCalendar

var scheds: [ScheduleModel]! = []
var currentScheds: [ScheduleModel]! = []
var currentPage: Date = Date()


class WeekViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var schedTableView: UITableView!
    @IBOutlet weak var calendarHeightConstraints: NSLayoutConstraint!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentScheds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeekCell", for: indexPath) as! SchedCell
        cell.sched = currentScheds[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.scope = .week
        scheds.sort(by: {$0.date! < $1.date!})
        //calendar.currentPage = calendar.currentPage.adding(day: -3)
        currentScheds.removeAll()
        let cal = Calendar(identifier: .gregorian)
        let comps = cal.dateComponents([.weekday], from:currentPage)
        
        for sched in scheds {
            if(currentPage.adding(day: -1 * comps.weekday! + 1) < sched.date! && currentPage.adding(day: 7 - comps.weekday!) > sched.date!) {
                currentScheds.append(sched)
            }
        }
        //schedTableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        scheds.sort(by: { $0.date! < $1.date! })
        
        let cal = Calendar(identifier: .gregorian)
        let comps = cal.dateComponents([.weekday], from:currentPage)
        
        currentScheds.removeAll()
        for sched in scheds {
            if(currentPage.adding(day: -1 * comps.weekday!) < sched.date! && currentPage.adding(day: 7 - comps.weekday!) > sched.date!) {
                currentScheds.append(sched)
            }
        }
        schedTableView.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraints.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        currentScheds.removeAll()
        
        for sched in scheds {
            if(calendar.currentPage < sched.date! && calendar.currentPage.adding(day: 7) > sched.date!) {
                currentScheds.append(sched)
            }
        }
        
        schedTableView.reloadData()
        calendar.reloadData()
    }
}



class SchedCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    var sched: ScheduleModel? { didSet {
        setSchedCell()
        }
    }
    
    func setSchedCell() {
        if let sched = sched {
            var dayString: String = sched.date!.getDayName()
            if(dayString.first == "0") {
                dayString.removeFirst()
            }
            self.dateLabel.text = String(describing: sched.date!.getDayName())
            self.dateLabel.text?.append("일")
            self.contentLabel.text = sched.content
        }
    }
}