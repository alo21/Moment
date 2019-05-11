//
//  PlaylistTracksTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit


class PlaylistTracksTableViewController: UITableViewController{


    var playlist: playlist!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let dataController = (UIApplication.shared.delegate as! AppDelegate).dataController


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaylistTracksNetwork().getPlaylistTracks(playlistCode: playlist.id, completionHandler: updateTableView, errorHandler: {
            error in
            DispatchQueue.main.async {
                self.alertError(message: error.localizedDescription)
            }
            
        })
    }
    

    
    @IBAction func addToLibrary(_ sender: UIButton) {
        
        print(sender)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updateTableView(){
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistTracksData().getPlaylistsTracks().count
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Detail disclouser")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTrackCell", for: indexPath) as! PlaylistTracksTableViewCell
        let track = PlaylistTracksData().getPlaylistsTracks()[(indexPath as NSIndexPath).row]
        
        cell.setSong(track: track)
        
        //cell.imageView?.image = meme.finalImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = addAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [add])
    }
    
    func addAction(at: IndexPath) -> UIContextualAction{
        
        let action = UIContextualAction(style: .normal, title: "Add") {action, view, completion in
            
            print("Add to playlist")
            
             let unw_track = PlaylistTracksData().getPlaylistsTracks()[(at as NSIndexPath).row]
                
                
                
            let artistToAdd = Artist(context: self.dataController.viewContext)
            let albumToAdd = Album(context: self.dataController.viewContext)
            let trackToAdd = Track(context: self.dataController.viewContext)
                
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
                trackToAdd.duration = unw_track.duration
                
                
            try? self.dataController.viewContext.save()
                print("Added to library")
                
            
    
            completion(true)
            
        }
        
        action.backgroundColor = .blue
        return action
        
        
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
                    
            }, errorHandler: {
                
                error in
                
                DispatchQueue.main.async {
                    self.alertError(message: error.localizedDescription)
                }
                
                
            })
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
                
        }, errorHandler: {
            error in
            
            DispatchQueue.main.async {
                self.alertError(message: error.localizedDescription)
            }
            
        })

        }
    
    
    func alertError(message: String) {
        
        print("Show error alert")
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    

    }

