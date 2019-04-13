//
//  RadioTableViewCell.swift
//  Moment
//
//  Created by Alessandro Losavio on 31/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class RadioTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var myLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
