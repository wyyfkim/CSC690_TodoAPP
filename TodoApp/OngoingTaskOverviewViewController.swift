//
//  OngoingTaskOverviewViewController.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit

class OngoingTaskOverviewViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        loadOngoingTask()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadOngoingTask() {
        GetTasksInFirestore(compelte: false){(documents) in
            for document in documents {
                print(document.data())
            }
            
        }
//        Get
//
//        GetTaskInFirestore{ (docments) in
//            for document in docments {
//                print(document.data())
//            }
//
//        }
    }

}
