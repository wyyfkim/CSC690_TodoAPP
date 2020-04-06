//
//  CompletedTaskOverviewViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/5/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit

class CompletedTaskOverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    

    var ongoingTasks : [Dictionary<String, Any>]!
        override func viewWillAppear(_ animated: Bool) {
            loadOngoingTask()
            tableview.reloadData()
        }
    //    override func viewDidAppear(_ animated: Bool) {
    //        ongoingTasks = []
    //        loadOngoingTask()
    //        tableview.reloadData()
    //    }
        override func viewDidLoad() {
            super.viewDidLoad()
    //        loadOngoingTask()
            tableview.delegate = self
            tableview.dataSource = self
            // Do any additional setup after loading the view.
        }
    
    
    @IBAction func viewDetailButtonPressed(_ sender: Any) {
        print("View detail button pressed")
        
        guard let cell = (sender as AnyObject).superview?.superview as? CompletedTaskTableViewCell else {
            return // or fatalError() or whatever
        }
        let indexPath = tableview.indexPath(for: cell)
        let taskDetail = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "taskDetail") as! DetailViewController
        taskDetail.task = ongoingTasks[indexPath!.row] as Dictionary
        self.present(taskDetail, animated: true, completion: nil)
    }
    
    
    //MARK: helpers:
        func loadOngoingTask() {
            ongoingTasks = []
            GetTasksInFirestore(compelte: true){(documents) in
                for document in documents {
                    var tempDict : Dictionary = document.data() as Dictionary as Dictionary
                    tempDict["ID"] = document.documentID
                    self.ongoingTasks.append(tempDict)
    //                print(document.data())
    //                print(type(of: document.data()))
                }
                self.tableview.reloadData()
            }
        }

        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(ongoingTasks.count)
            return ongoingTasks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath) as! CompletedTaskTableViewCell
            
    //        cell.delegate = self
            
            var recentOngoingTasks: [Dictionary]! = ongoingTasks
            
            
            cell.generateCell(taskList: recentOngoingTasks[indexPath.row], indexPath: indexPath)
            print(indexPath.row)
            return cell
        }
}
