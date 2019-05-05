//
//  PlaylistTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        searchBar.placeholder = "Search for a playlist here..."


        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Maybe this time i'm ok")
        PlaylistNetwork().getPlaylist(term: searchBar.text!, completionHandler: {self.updateTableView()})
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func updateTableView(){
        print("recieved new results")
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
