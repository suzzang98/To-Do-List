//
//  CustomCell.swift
//  TodoList
//
//  Created by 이수현 on 2023/08/08.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var button_custom: UIButton!
    @IBOutlet weak var label_custom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
