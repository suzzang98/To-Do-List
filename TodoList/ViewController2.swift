//
//  ViewController2.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/10.
//

import UIKit

class ViewController2: UIViewController{
    @IBOutlet weak var done_table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        done_table.delegate = self
        done_table.dataSource = self
        done_table.reloadData()
        
        // Do any additional setup after loading the view.
    }
    

}

extension ViewController2: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.completeList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell2 = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath) as! CustomCell2
        customCell2.setTask(TaskList.completeList()[indexPath.row])
        return customCell2
    }
    
}
