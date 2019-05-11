//
//  PlaylistTracksTableViewCell.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class PlaylistTracksTableViewCell: UITableViewCell {
    
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var downloadImage: UIImageView!
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
    
    @IBAction func addToLibrary(_ sender: Any) {
        
        if let unw_track = track {
            
        
        
            let artistToAdd = Artist(context: dataController.viewContext)
            let albumToAdd = Album(context: dataController.viewContext)
            let trackToAdd = Track(context: dataController.viewContext)
            
            artistToAdd.id = unw_track.artist_id
            artistToAdd.album_id = unw_track.album_id
            artistToAdd.name = unw_track.artist_name
            
            albumToAdd.id = unw_track.album_id
            albumToAdd.image = unw_track.album_image
            albumToAdd.artist = artistToAdd
            
            trackToAdd.album = albumToAdd
            trackToAdd.album_id = albumToAdd.id
            trackToAdd.id = unw_track.id
            trackToAdd.artist_id = artistToAdd.id
            trackToAdd.audio = unw_track.audio
            trackToAdd.name = unw_track.name
            
            
            try? dataController.viewContext.save()
            print("Added to library")
            
            }
    }
    
}
