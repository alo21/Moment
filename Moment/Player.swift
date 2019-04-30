//
//  Player.swift
//  Moment
//
//  Created by Alessandro Losavio on 14/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation
import AVFoundation

class Player{
    
    private init(){}
    static let shared = Player()
    
    
    var playinSongName = ""
    var AudioPlayer = AVAudioPlayer()
}
