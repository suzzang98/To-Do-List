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
    var cellTitle: [String] = ["A", "BBB", "CCC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView_custom.delegate = self
        tableView_custom.dataSource = self
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        addElement()
    }
    func addElement() {
        let newIndexPath = IndexPath(row: cellTitle.count , section: 0)
        self.cellTitle.append("element")
        self.tableView_custom.insertRows(at: [newIndexPath], with: .fade)
        tableView_custom.reloadData()
        print(cellTitle)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView_custom.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        customCell.label_custom.text = cellTitle[indexPath.row]
        
        return customCell
    }
    
    
}
