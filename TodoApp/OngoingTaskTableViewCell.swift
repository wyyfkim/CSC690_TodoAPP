//
//  OngoingTaskTableViewCell.swift
//  TodoApp
//
//  Created by Kim Wang on 4/3/20.
//  Copyright © 2020 Kim Wang. All rights reserved.
//

import UIKit

class OngoingTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func generateCell(taskList: NSDictionary, indexPath: IndexPath) {
//        self.indexPath = indexPath
        self.taskTitle.text = taskList["taskTitle"] as? String
      
    }
}

//["taskTitle": 1, "taskDeadline": 1, "taskDes": 1, "complete": 0]
