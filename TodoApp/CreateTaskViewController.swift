//
//  CreateTaskViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit
import Foundation

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var taskTitleText: UITextField!
    @IBOutlet weak var deadlineText: UITextField!
    @IBOutlet weak var taskDescriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Mark: IBAction
    @IBAction func doneButtonPressed(_ sender: Any) {
        if taskTitleText.text == "" && deadlineText.text == "" && taskDescriptionText.text == "" {
            return
        }
        if taskTitleText.text == "" {
            taskTitleText.text = "No title"
        }
        if deadlineText.text == "" {
            deadlineText.text = "N/A"
        }
        if taskDescriptionText.text == "" {
            taskDescriptionText.text = "-"
        }
        var tempDictionary : Dictionary = ["taskTitle" : taskTitleText.text, "taskDeadline" : deadlineText.text, "taskDes" : taskDescriptionText.text, "createTime" : NSDate().timeIntervalSince1970, "complete" : false] as [String: Any]
        CreateTaskInFirestore(withValues: tempDictionary) {(error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
        }
        print("Starting sending notification message back to ongoing view controller")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadTasks"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func markCompleteButtonPressed(_ sender: Any) {
    }
}
