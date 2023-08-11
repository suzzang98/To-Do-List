//
//  ViewController.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView_custom: UITableView!
    let cellName: String = "customCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView_custom.delegate = self
        tableView_custom.dataSource = self
        tableView_custom.reloadData()
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        addingToDoList(status: "To Do")
    }
    
    func addingToDoList (status: String){
        let alert = UIAlertController(title: status, message: "새로운 할 일을 추가해주세요.", preferredStyle: .alert)
        alert.addTextField{textField in textField.placeholder = "입력하세요"}
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .destructive) {[weak self] _ in guard let self else {return}
            if let title = alert.textFields?.first?.text, !title.isEmpty{
                let newItem = Task(id: (TaskList.list.count - 1) + 1, title: title, isCompleted: false)
                TaskList.list.append(newItem)
                self.tableView_custom?.insertRows(at: [IndexPath(row: TaskList.list.count - 1, section: 0)], with: .automatic)
            }
        }
        alert.addAction(cancle)
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView_custom.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        customCell.setTask(TaskList.list[indexPath.row])
        
        return customCell
    }
    
    
}
