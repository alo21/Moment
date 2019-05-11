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
    @IBOutlet var myButton: UIButton!
    
    
    func setSong(song: Track){
        myLabel.text = song.name
    }
    
    
    @IBAction func onDelete(_ sender: Any) {
        
        print("Song deleted")
        
    }
    
    
    
}
