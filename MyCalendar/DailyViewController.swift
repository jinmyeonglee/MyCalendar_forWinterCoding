//
//  DailyViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 02/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var nextDate: UIImageView!
    @IBOutlet weak var previousDate: UIImageView!
    @IBOutlet weak var todayDate: UILabel!
    
    
    @IBOutlet weak var dailySchedTableView: UITableView!
    
    var todaySchedule: [ScheduleModel]! = []
    var currentDate = Date()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todaySchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayCell", for: indexPath) as! SchedCell
        cell.sched = todaySchedule[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTodaySchedule()
       todayDate.text = self.dateFormatter.string(from: currentDate)
       
        nextDate.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(DailyViewController.clickNextDate)))
        nextDate.isUserInteractionEnabled = true
        previousDate.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(DailyViewController.clickPreviousDate)))
        previousDate.isUserInteractionEnabled = true
        
        todaySchedule.append(ScheduleModel(dateString: "2018/11/05", content: "testtest", date: Date()))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadTodaySchedule()
        dailySchedTableView.reloadData()
    }
    
    func loadTodaySchedule() {
        todaySchedule.removeAll()
        for sched in scheds {
            if(sched.date?.getYearName() == currentDate.getYearName() && sched.date?.getMonthName() == currentDate.getMonthName() && sched.date?.getDayName() == currentDate.getDayName()) {
                todaySchedule.append(sched)
            }
        }
    }
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    @objc func clickNextDate(gesture: UIGestureRecognizer) {
        self.currentDate = self.currentDate.adding(day: 1)
        todayDate.text = self.dateFormatter.string(from: currentDate)
        loadTodaySchedule()
        dailySchedTableView.reloadData()
    }
    
    @objc func clickPreviousDate(gesture: UIGestureRecognizer) {
        self.currentDate = self.currentDate.adding(day: -1)
        todayDate.text = self.dateFormatter.string(from: currentDate)
        loadTodaySchedule()
        dailySchedTableView.reloadData()
    }

}
