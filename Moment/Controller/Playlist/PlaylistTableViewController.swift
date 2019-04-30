//
//  PlaylistTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaylistNetwork().getPlaylist(completionHandler: {self.updateTableView()})


        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updateTableView(){
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistData().getPlaylists().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        let playlist = PlaylistData().getPlaylists()[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = playlist.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "PlaylistTracksTableViewController") as! PlaylistTracksTableViewController
        
        detailController.playlist = PlaylistData().getPlaylists()[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
 

}
