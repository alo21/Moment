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
    
    var AudioPlayer = AVAudioPlayer()

    
    var playlist: playlist!

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
        
        //cell.imageView?.image = meme.finalImage
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let track = PlaylistTracksData().getPlaylistsTracks()[(indexPath as NSIndexPath).row]
        
        PlaylistTracksNetwork().downloadTrack(trackUrl: track.audio, completionHandler: playTrack)

        }
    
    
    func playTrack(filePath: URL){
        
        print(filePath)
        
        do {
            AudioPlayer = try AVAudioPlayer(contentsOf: filePath)
            AudioPlayer.play()
            
        } catch {
            print("Something went wrong")
        }
        
        
    }
    
    

    
    
    }
    
    

