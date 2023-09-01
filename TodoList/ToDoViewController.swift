//
//  ViewController.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/08.
//

import UIKit

class ToDoViewController: UIViewController {
    
    
    @IBOutlet weak var ToDoTableView: UITableView!
    let cellName: String = "customCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        ToDoTableView.reloadData()
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "할일 추가", message: "새로운 할 일을 추가해주세요.", preferredStyle: .alert)
        alert.addTextField{textField in textField.placeholder = "입력하세요"}
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .destructive) {[weak self] _ in guard let self else {return}
            if let title = alert.textFields?.first?.text, !title.isEmpty{
                let dafaultCategory = TaskCategory.none
                let newItem = Task(id: (TaskList.taskList().count - 1) + 1, title: title, isCompleted: false, category: dafaultCategory)
                TaskList.addTask(newItem)
                self.ToDoTableView?.insertRows(at: [IndexPath(row: TaskList.taskList().count - 1, section: 0)], with: .automatic)
            }
        }
        alert.addAction(cancle)
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
    }


}

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == TaskCategory.none.toIndex() {
            return TaskList.filerCategory(category: .none).count
        } else if section == TaskCategory.work.toIndex() {
            return TaskList.filerCategory(category: .work).count
        } else if section == TaskCategory.life.toIndex() {
            return TaskList.filerCategory(category: .life).count
        } else {
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDoTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ToDoTableViewCell
        if indexPath.section == TaskCategory.none.toIndex() {
            cell.setTask(TaskList.filerCategory(category: .none)[indexPath.row])
        } else if indexPath.section == TaskCategory.work.toIndex() {
            cell.setTask(TaskList.filerCategory(category: .work)[indexPath.row])
        } else if indexPath.section == TaskCategory.life.toIndex() {
            cell.setTask(TaskList.filerCategory(category: .life)[indexPath.row])
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TaskCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard TaskList.taskList().count != 0 else {return nil}
        guard let category = TaskCategory.category(from: section) else {return nil}
        let titleHeader = category.rawValue
        return TaskList.filerCategory(category: category).isEmpty ? nil: titleHeader
    }
    
    
    
}
