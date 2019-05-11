//
//  LibraryCollectionViewCell.swift
//  Moment
//
//  Created by Alessandro Losavio on 11/05/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet var myLabel: UILabel!
    var track: Track?
    
    
    func setSong(song: Track){
        myLabel.text = song.name
        self.track = song
    }
    
}
