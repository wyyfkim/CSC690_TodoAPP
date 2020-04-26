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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func generateCell(taskList: Dictionary<String, Any>, indexPath: IndexPath) {
        self.taskTitle.text = taskList["taskTitle"] as? String
      
    }
}
