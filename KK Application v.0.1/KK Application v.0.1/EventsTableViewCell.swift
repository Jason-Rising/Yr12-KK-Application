//
//  EventsTableViewCell.swift
//  KK Application v.0.1
//
//  Created by Jason Rising on 24/7/18.
//  Copyright © 2018 Jason Rising. All rights reserved.
//

import UIKit

var EventIndex = 0

class EventsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblEventName: UILabel!

    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
