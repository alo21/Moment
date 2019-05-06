//
//  PlaylistTracksTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit


class PlaylistTracksTableViewController: UITableViewController {
    

    var playlist: playlist!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

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
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        let track = PlaylistTracksData().getPlaylistsTracks()[(indexPath as NSIndexPath).row]
                
        PlaylistTracksNetwork().downloadTrack(trackUrl: track.audio, completionHandler: {
            (myURL) in
            
            ImageNetwork().downloadImage(url: track.image, completionHandler: {
                
                (myImg) in
                    
                let song = ["songName": track.name, "songURL": myURL!, "songImage": myImg as Any, "totalTime": track.duration] as [String : Any]
                    
                    NotificationCenter.default.post(name: Notification.Name(songSelectedKey), object: song)
                    
                })
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
                
            })

        }

    }
    
    

