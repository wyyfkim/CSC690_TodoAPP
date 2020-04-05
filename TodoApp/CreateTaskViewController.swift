//
//  CreateTaskViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var taskTitleText: UITextField!
    @IBOutlet weak var deadlineText: UITextField!
    @IBOutlet weak var taskDescriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Mark: IBAction
    @IBAction func doneButtonPressed(_ sender: Any) {
        if taskTitleText.text == "" {
            taskTitleText.text = "No title"
        }
        if deadlineText.text == "" {
            deadlineText.text = "N/A"
        }
        if taskDescriptionText.text == "" {
            taskDescriptionText.text = "-"
        }
        var tempDictionary : Dictionary = ["taskTitle" : taskTitleText.text, "taskDeadline" : deadlineText.text, "taskDes" : taskDescriptionText.text, "complete" : false] as [String: Any]
        CreateTaskInFirestore(withValues: tempDictionary) {(error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
        
//        self.present(mainView, animated: true, completion: nil)
        
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func markCompleteButtonPressed(_ sender: Any) {
        
        
    }
    

}
