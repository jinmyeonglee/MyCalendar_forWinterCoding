//
//  Models.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import Foundation
import RealmSwift

class ScheduleModel: Object {
    @objc dynamic var content: String! = ""
    @objc dynamic var date: Date? = Date()
    
    convenience init(content: String, date: Date) {
        self.init()
        self.content = content
        self.date = date
    }
    
//    init(content: String, date: Date) {
//        self.content = content
//        self.date = date
//    }
    
}
