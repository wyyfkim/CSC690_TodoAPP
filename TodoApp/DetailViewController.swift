//
//  DetailViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/4/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskDeadline: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var markCompleteButton: UIButton!
    var task : NSDictionary?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        if task != nil {
            taskTitle.text = task!["taskTitle"] as! String
            taskDeadline.text = task!["taskDeadline"] as! String
            taskDescription.text = task!["taskDes"] as! String
            if task!["complete"] as! Bool {
                markCompleteButton.isHidden = true
            }
            print(taskTitle.text)
        }
    }
    //MARK: IBAction
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
    

}
