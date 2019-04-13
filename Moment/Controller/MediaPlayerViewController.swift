//
//  MediaPlayerViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 06/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import AVFoundation


class MediaPlayerViewController: UIViewController {
    
    
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var backwardButton: UIButton!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var albumImage: UIImageView!

    var AudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Media player up and running")
        

    }
    
    func playTrack(filePath: URL){
        
        print("Playing track")
        
        print(filePath)
        
        do {
            print("Yeee")
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            AudioPlayer = try AVAudioPlayer(contentsOf: filePath)
            print(filePath)
            AudioPlayer.play()
            print("lol")
            
        } catch {
            print("Something went wrong")
        }
        
        
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
        
        print("Play pressed")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("##############")
        print("Disappearing")
    }
    
    
    


}
