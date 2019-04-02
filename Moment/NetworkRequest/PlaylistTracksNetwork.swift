//
//  PlaylistTracksNetwork.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation


class PlaylistTracksNetwork{
    
    
    func getPlaylistTracks(playlistCode: String, completionHandler: @escaping()->Void){
        
        
        let request = URLRequest(url: URL(string: "https://api.jamendo.com/v3.0/playlists/tracks/?client_id=7a746963&format=jsonpretty&limit=20&id=" + playlistCode)!)
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error...
                
                //errorHandler(error!)
                print(error?.localizedDescription ?? "Unknow error")
                
                return
            }
            
            guard let data = data else {
                
                print("No data")
                return
            }
            
            do {
                
                //var myData = String(data: data, encoding: .utf8)!
                let playlistTracks = try JSONDecoder().decode(playlistTracksResponse.self, from: data)
                //self.radioArray = radioList.results.map({$0})
                
                if(playlistTracks.results.count != 0) {
                    print(playlistTracks.results[0].tracks.count)
    
                    playlistTracks.results[0].tracks.forEach{ track in
                        PlaylistTracksData().addPlaylistTrack(track: track)
                    }
                }
                
                DispatchQueue.main.async {
                    
                    print("Done getting data")
                    
                    completionHandler()
                    
                }
                
                
                
                
            } catch {
                let myError = error as NSError
                print("Qualcosa non va")
                print(myError)
                
            }
            
        }
        task.resume()
        
        return
        
        
        
        
    }
    
    
    
}
