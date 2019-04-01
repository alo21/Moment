//
//  PlaylistData.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

var playlistDataGlobal: [playlist] = []

class PlaylistData{
    
    func getPlaylists() -> [playlist] {
        
        return playlistDataGlobal
        
    }
    
    func addPlaylist(playlist: playlist) {
        
        playlistDataGlobal.append(playlist)
        print("Added playlist")
    }
    
    
    
    
    
}
