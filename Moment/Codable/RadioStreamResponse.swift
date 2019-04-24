//
//  RadioStreamResponse.swift
//  Moment
//
//  Created by Alessandro Losavio on 14/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

struct RadioStreamResponse: Codable{
    
    let headers: headers
    let results: [RadioStation]
    
}

struct RadioStation: Codable{
    
    let id: Int
    let name: String
    let dispname: String
    let type: String
    let image: String
    let stream: String
    let playingnow: playingnow
    let callmeback: String

}

struct playingnow: Codable {
    let track_id: Int
    let artist_id: Int
    let album_id: Int
    let album_name: String
    let track_name: String
    let track_image: String
    let artist_name: String
}
