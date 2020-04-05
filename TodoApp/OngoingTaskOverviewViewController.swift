//
//  OngoingTaskOverviewViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit
import FirebaseFirestore

class OngoingTaskOverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableview: UITableView!
    
    
    var ongoingTasks : [NSDictionary] = []
//    override func viewWillAppear(_ animated: Bool) {
//        loadOngoingTask()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOngoingTask()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func loadOngoingTask() {
        GetTasksInFirestore(compelte: false){(documents) in
            for document in documents {
                self.ongoingTasks.append(document.data() as NSDictionary)
                print(document.data())
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OngoingTaskTableViewCell
        
//        cell.delegate = self
        
        var recentOngoingTasks: [NSDictionary]! = ongoingTasks
        
        
        cell.generateCell(taskList: recentOngoingTasks[indexPath.row], indexPath: indexPath)
        print("!!!!!!!!!!!!!!!!")
        print(indexPath.row)
        return cell
    }
}
