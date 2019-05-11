//
//  LibraryTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 11/05/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import CoreData

class LibraryTableViewController: UITableViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let dataController = (UIApplication.shared.delegate as! AppDelegate).dataController
    var tracks : [Track] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadLibrary()
    }
    
    
    func reloadLibrary(){
        loadDataCoreTracks()
        self.tableView.reloadData()
    }
    
    func deleteArow(){
        //self.tableView.deleteRows(at: [1 as IndexPath], with: .fade)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            dataController.viewContext.delete(tracks[indexPath.row])
            try? dataController.viewContext.save()
            tracks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
    
    
    
    func loadDataCoreTracks(){
        
        //Fetching locations from CoreData
        let fetchRequest:NSFetchRequest<Track> = Track.fetchRequest()
        if let result = try? dataController.viewContext.fetch(fetchRequest) {
            tracks  = result
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "libraryTrackCell", for: indexPath) as! LibraryTableViewCell
        
        let track = tracks[(indexPath as NSIndexPath).row]
        
        cell.setSong(song: track)
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        let track = tracks[(indexPath as NSIndexPath).row]
        
        PlaylistTracksNetwork().downloadTrack(trackUrl: track.audio!, completionHandler: {
            (myURL) in
            
            ImageNetwork().downloadImage(url: track.album!.image!, completionHandler: {
                
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
