//
//  TableViewCell.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 18/06/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellViewMain: UIView!
    @IBOutlet weak var cellViewTop: UIView!
    @IBOutlet weak var cellViewBottom: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Add corner radius to views
        cellViewMain.layer.cornerRadius = 25
        cellViewTop.layer.cornerRadius = 10
        cellViewBottom.layer.cornerRadius = 25
    }
    
}
