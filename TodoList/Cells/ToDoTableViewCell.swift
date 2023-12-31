//
//  CustomCell.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/08.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    var task: Task?

    @IBOutlet weak var taskSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        guard let task else{return}
        if taskSwitch.isOn{
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            TaskList.completeTask(task: task, isCompleted: true)
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            TaskList.completeTask(task: task, isCompleted: false)
        }
        print(TaskList.completeList())

    }
    
    
    func setTask(_ _task: Task){
        task = _task
        guard let task else {return}
        if task.isCompleted {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            
        }
        TaskList.completeTask(task: task, isCompleted: false)
            }
    

    
}

extension String{
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
