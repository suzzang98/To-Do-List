//
//  CustomCell2.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/11.
//

import UIKit

class DoneTableViewCell: UITableViewCell {
    var task:Task?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTask(_ _task: Task){
        task = _task
        guard let task else {return}
        if task.isCompleted {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
        } else {
            textLabel?.text = nil
        }
    }

}
