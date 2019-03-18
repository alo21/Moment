//
//  Playlist.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation


struct playlistResponse: Codable {
    
    let headers: headers
    let results: [playlist]
    
}

struct playlist: Codable{
    let id: String
    let name: String
    let creationdate: Date
    let user_id: String
    let user_name: String
    let zip: String
    let shorturl: String
    let shareurl: String
    
}
