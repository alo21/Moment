//
//  PlaylistTracksTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import AVFoundation


class PlaylistTracksTableViewController: UITableViewController {
    
    struct trackData {
        var songName: String
        var songURL: URL
    }
    

    var playlist: playlist!
    var AudioPlayer = AVAudioPlayer()
    var lol: URL? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaylistTracksNetwork().getPlaylistTracks(playlistCode: playlist.id, completionHandler: updateTableView)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updateTableView(){
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistTracksData().getPlaylistsTracks().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTrackCell", for: indexPath)
        let playlist = PlaylistTracksData().getPlaylistsTracks()[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = playlist.name
        cell.imageView?.image = UIImage(named: "Download")
        
        //cell.imageView?.image = meme.finalImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let track = PlaylistTracksData().getPlaylistsTracks()[(indexPath as NSIndexPath).row]
                
        PlaylistTracksNetwork().downloadTrack(trackUrl: track.audio, completionHandler: {
            (myURL) in
            
            ImageNetwork().downloadImage(url: track.image, completionHandler: {
                
                (myImg) in
                    
                let song = ["songName": track.name, "songURL": myURL!, "songImage": myImg] as [String : Any]
                    
                    NotificationCenter.default.post(name: Notification.Name(songSelectedKey), object: song)
                    
                })
                
            })
        
            
            
        
        

        }

    
//    func playTrack(filePath: URL){
//
//        print(filePath)
//
//        do {
//            print("Yeee")
//            AudioPlayer = try AVAudioPlayer(contentsOf: filePath)
//            AudioPlayer.play()
//            print("lol")
//
//        } catch {
//            print("Something went wrong")
//        }
//
//
//    }
    
    

    
    

    
    
    }
    
    

