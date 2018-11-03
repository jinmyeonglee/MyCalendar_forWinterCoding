//
//  Models.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import Foundation

class ScheduleModel {
    var dateString: String! = ""
    var content: String! = ""
    var date: Date?
    
    
    init(dateString: String, content: String, date:Date) {
        self.dateString = dateString
        self.content = content
        self.date = date
    }
}
