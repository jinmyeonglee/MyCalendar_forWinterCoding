//
//  RegisterViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var contentTxt: UITextField!
    
    private var realm: Realm!
    
    var date: String = ""
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.hideKeyboardWhenTappedAround()
        datePicker.timeZone = TimeZone(identifier: "Asia/Seoul")
        // Realm init
        realm = try! Realm()
        
    }
    
    @IBAction func back_click(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addSchedule(_ sender: Any) {
        content = contentTxt.text ?? ""
        
        if(content != "") {
            let newScehd = ScheduleModel(content: content, date: datePicker.date)
            // scheds.append(newScehd)
            try! realm.write {
                realm.add(newScehd)
            }
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
