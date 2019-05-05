//
//  PlaylistNetwork.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation


class PlaylistNetwork{
    
    let baseAPIUrl = "https://api.jamendo.com/v3.0"
    let playlists = "/playlists"
    let clientIDUrl = "/?client_id="
    let clientID = "7a746963"
    let format = "&format=jsonpretty"
    let namesearch = "&namesearch=cool"
    
    func getPlaylist(term: String, completionHandler: @escaping()->Void) -> Void{
        
        let request = URLRequest(url: URL(string: "https://api.jamendo.com/v3.0/playlists/?client_id=7a746963&format=jsonpretty&limit=20&name=" + term)!)
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
                let playListList = try JSONDecoder().decode(playlistResponse.self, from: data)
                //self.radioArray = radioList.results.map({$0})
                
                print(playListList.results.count)
                print(playListList.results)
                
                if PlaylistData().getPlaylists().count != 0 {
                    print("ereasing previous playlist")
                    PlaylistData().deleteItems()
                }
                
                    playListList.results.forEach{ playlist in
                        
                        
                        PlaylistData().addPlaylist(playlist: playlist)
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
