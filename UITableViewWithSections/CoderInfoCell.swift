//
//  CoderInfoCell.swift
//  UITableViewWithSections
//
//  Created by Aman Aggarwal on 10/10/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import UIKit

class CoderInfoCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- setCoderName
    func setCoderName(_ name: String) {
        self.lblName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
