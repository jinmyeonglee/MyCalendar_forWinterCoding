//
//  Models.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import Foundation
import RealmSwift

class ScheduleModel {
    var content: String! = ""
    var date: Date?
    
    init(content: String, date:Date) {
        self.content = content
        self.date = date
    }
}
