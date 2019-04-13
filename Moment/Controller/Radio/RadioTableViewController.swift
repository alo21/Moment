//
//  RadioTableViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 31/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class RadioTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("In table")
        
        RadioNetwork().getRadiosList(completionHandler: {self.updateTableView()})
        
    }
    
    func updateTableView(){
        
        print("Table View Updated")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(RadioData().getRadios())
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RadioData().getRadios().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell", for: indexPath)
        let radio = RadioData().getRadios()[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = radio.dispname
        cell.imageView?.image = UIImage(named: "placeholder")
                
        return cell
    }
    



}
