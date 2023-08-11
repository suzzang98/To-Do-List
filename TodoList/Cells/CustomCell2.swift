//
//  CustomCell2.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/11.
//

import UIKit

class CustomCell2: UITableViewCell {
    var task:Task?

    @IBOutlet weak var redoButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func undoButt(_ sender: UIButton) {
        guard let task else{return}
        if task.isCompleted == true{
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            TaskList.completeTask(task: task, isCompleted: false)
            print(TaskList.completeList())

        }
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
