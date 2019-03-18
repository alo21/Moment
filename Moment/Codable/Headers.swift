//
//  Headers.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation


struct headers: Codable{
    let status: String
    let code: Int
    let error_message: String
    let warnings: String
    let results_count: Int
}
