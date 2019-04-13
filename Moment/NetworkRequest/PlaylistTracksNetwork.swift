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
    
    
    
    func downloadTrack(trackUrl: String, completionHandler: @escaping(URL?)->Void){
        
        // Create destination URL
        let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
        
        let destinationFileUrl = documentsUrl.appendingPathComponent("downloadedFile.mp3")
        
        //Deleting the file in case it exists
        do {
        try FileManager.default.removeItem(atPath: destinationFileUrl.path)
        } catch {
            print("No previous file downloaded")
        }
        
        
        let request = URLRequest(url: URL(string: trackUrl)!)
        let session = URLSession.shared
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                    completionHandler(destinationFileUrl)
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
                
            } else {
                print(error!.localizedDescription);
            }
        }
        task.resume()
        
    }
    
}
    
    
    

