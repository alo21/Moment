//
//  PlaylistTracksResponse.swift
//  Moment
//
//  Created by Alessandro Losavio on 02/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

struct playlistTracksResponse: Codable {
    let headers: headers
    let results: [trackResults]
}

struct trackResults: Codable {
    let id: String
    let name: String
    let creationdate: String
    let user_id: String
    let user_name: String
    let zip: String
    let tracks: [track]
}

struct track: Codable{
    let id: String
    let name: String
    let album_id: String
    let artist_id: String
    let duration: String
    let artist_name: String
    let playlistadddate: String
    let position: String
    let license_ccurl: String
    let album_image: String
    let image: String
    let audio: String
    let audiodownload: String
}
