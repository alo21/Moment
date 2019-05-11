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
    
    let dataController = (UIApplication.shared.delegate as! AppDelegate).dataController
    var tracks : [Track] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDataCoreTracks()
        self.tableView.reloadData()
    
    }
    
    
    func loadDataCoreTracks(){
        
        //Fetching locations from CoreData
        let fetchRequest:NSFetchRequest<Track> = Track.fetchRequest()
        if let result = try? dataController.viewContext.fetch(fetchRequest) {
            tracks  = result
            //displayData()
            print("Songs in your library: \(tracks.count)")
            
        }
    }
    
    
    func displayData(){
        
        for track in tracks {
            
            print(track.name!)
            
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
        
        //cell.imageView?.image = meme.finalImage
        
        return cell
    }

}
