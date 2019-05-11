//
//  PlaylistTracksTableViewCell.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class PlaylistTracksTableViewCell: UITableViewCell {
    
    
    @IBOutlet var myLabel: UILabel!
    var track: track?
    let dataController = (UIApplication.shared.delegate as! AppDelegate).dataController

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSong(track: track){
        self.track = track
        myLabel.text = track.name
        
    }
    
    
}
