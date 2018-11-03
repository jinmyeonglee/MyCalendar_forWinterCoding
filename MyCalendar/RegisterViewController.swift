//
//  RegisterViewController.swift
//  MyCalendar
//
//  Created by 이진명 on 01/11/2018.
//  Copyright © 2018 이진명. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var contentTxt: UITextField!
    
    var date: String = ""
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.hideKeyboardWhenTappedAround()
        datePicker.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        
    }
    
    @IBAction func back_click(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addSchedule(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        content = contentTxt.text ?? ""
        date = formatter.string(from: datePicker.date)
        
        if(content != "") {
            let newScehd = ScheduleModel(dateString: date, content: content, date: datePicker.date)
            scheds.append(newScehd)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
