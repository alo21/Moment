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
    @IBOutlet var playButton: UIButton!
    @IBOutlet var songNameLabel: UILabel?
    @IBOutlet var albumImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.shared.playinSongName = "asd"
        self.songNameLabel?.text = Player.shared.playinSongName
        
        albumImage.image = UIImage(named: "placeholder")
        print("Media player up and running")
    
    }
    
    func playTrack(filePath: URL, track: track){
        
        do {
            
            //print(track)
            print(songNameLabel?.text)
            //setSongTitle(songName: track.name)
            
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            Player.shared.AudioPlayer = try AVAudioPlayer(contentsOf: filePath)
            print(filePath)
            Player.shared.AudioPlayer.play()
            //playPressed(playButton)
            
        } catch {
            print("Couldn't play the song")
        }
        
        
    }
    
    
    
    func setSongTitle(songName: String){
        if let label = songNameLabel{
            label.text = songName
        } else {
            print("The label doesn't exsist")
        }
        
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        
        if Player.shared.AudioPlayer.isPlaying {
            Player.shared.AudioPlayer.pause()
            sender.setImage(UIImage(named: "Play"), for: .normal)
        } else {
            Player.shared.AudioPlayer.play()
            sender.setImage(UIImage(named: "Pause"), for: .normal)

        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("##############")
        print("Disappearing")
    }
    
    
    


}
