//
//  TableViewCell.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 2/8/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblAccountUsername: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
