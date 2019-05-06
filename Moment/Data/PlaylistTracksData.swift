//
//  PlaylistTracksData.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation



var playlistTracksDataGlobal: [track] = []

class PlaylistTracksData{
    
    func setPlaylistTracks(playlistTracks: [track]){
        playlistTracksDataGlobal = playlistTracks
    }
    
    func getPlaylistsTracks() -> [track] {
        return playlistTracksDataGlobal
    }
    
    func addPlaylistTrack(track: track) {
        playlistTracksDataGlobal.append(track)
        print("Added track")
    }
    
    func ereasePlaylistTracks(){
        setPlaylistTracks(playlistTracks: [])
    }
    
}
