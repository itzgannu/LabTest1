//
//  TableViewCell.swift
//  GANESH_MYORDER
//
//  Created by admin on 5/17/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var OrderDate: UILabel!
    @IBOutlet weak var CoffeeSizeLbl: UILabel!
    @IBOutlet weak var CoffeeTypeLbl: UILabel!
    @IBOutlet weak var NoOfCoffeeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
