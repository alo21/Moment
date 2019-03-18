//
//  Radio.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

struct radioResponse: Codable {
    let headers: headers
    let results: [radio]
}




struct radio: Codable {
    let id: Int
    let name: String
    let dispname: String
    let type: String
    let image: String
}
