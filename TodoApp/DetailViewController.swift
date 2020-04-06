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
    var task : Dictionary<String, Any>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        if task != nil {
//            print(task)
            taskTitle.text = task!["taskTitle"] as! String
            taskDeadline.text = task!["taskDeadline"] as! String
            taskDescription.text = task!["taskDes"] as! String
            if task!["complete"] as! Bool {
                markCompleteButton.isHidden = true
            }
//            print(taskTitle.text)
        }
    }
    //MARK: IBAction
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        var tempDict : Dictionary<String, Any> = ["taskTitle" : taskTitle.text, "taskDeadline" : taskDeadline.text, "taskDes" : taskDescription.text, "complete" : task!["complete"]] as [String : Any]
        
        var documentID : String = task!["ID"] as! String
        UpdateTaskInFirestore(taskID: documentID, withValues: tempDict) {(error) in
           if error != nil {
               print(error?.localizedDescription)
               return
           }
        }
        
//        let ongoingTasks = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ongoingTask") as! OngoingTaskOverviewViewController
//        ongoingTasks.modalPresentationStyle = .fullScreen
//        self.present(ongoingTasks, animated: true, completion: nil)
//
        
        self.dismiss(animated: true)
    }
    
    @IBAction func markCompleteButtonPressed(_ sender: Any) {
        if task != nil {
            var tempDict : Dictionary<String, Any> = ["taskTitle" : taskTitle.text, "taskDeadline" : taskDeadline.text, "taskDes" : taskDescription.text, "complete" : true] as [String : Any]
            
            var documentID : String = task!["ID"] as! String
            UpdateTaskInFirestore(taskID: documentID, withValues: tempDict) {(error) in
               if error != nil {
                   print(error?.localizedDescription)
                   return
               }
            }
            
//            let completedTasks = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "completedTask") as! CompletedTaskOverviewViewController
//            completedTasks.modalPresentationStyle = .fullScreen
//            self.present(completedTasks, animated: true, completion: nil)
            self.dismiss(animated: true)
            
//            task!["complete"] = true
        }
    }
    
    

}
