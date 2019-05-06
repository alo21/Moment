//
//  MediaPlayerViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 06/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import AVFoundation

let songSelectedKey = "it.aleLos.songSelected"


class MediaPlayerViewController: UIViewController {

    
    
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var backwardButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var songNameLabel: UILabel?
    @IBOutlet var albumImage: UIImageView!
    
    let songSelecred = Notification.Name(rawValue: songSelectedKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.shared.playinSongName = "asd"
        self.songNameLabel?.text = Player.shared.playinSongName
        
        albumImage.image = UIImage(named: "placeholder")
        print("Media player up and running")
        
        createObserver()
        
       
    }
    
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(MediaPlayerViewController.foo), name: songSelecred, object: nil)
        
    
    }
    
    @objc func foo(notification: Notification){
        
        print("Song selected")
        let song = notification.object as! NSDictionary

        print(song["songName"]!)
        setSongTitle(songName: song["songName"]! as! String)
        playTrack(filePath: song["songURL"]! as! URL)
        DispatchQueue.main.async {
            self.albumImage.image =  UIImage(data:song["songImage"]! as! Data,scale:1.0)
        }

    }
    
    func playTrack(filePath: URL){
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            Player.shared.AudioPlayer = try AVAudioPlayer(contentsOf: filePath)
            Player.shared.AudioPlayer.play()
            
            DispatchQueue.main.async {
                self.playButton.setImage(UIImage(named: "Pause"), for: .normal)
            }
            
        } catch {
            print("Couldn't play the song")
        }
        
        
    }
    
    
    
    func setSongTitle(songName: String){
        if let label = songNameLabel{
            DispatchQueue.main.async {
                label.text = songName
            }
        } else {
            print("The label doesn't exsist")
        }
        
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        
        if Player.shared.AudioPlayer.isPlaying {
            Player.shared.AudioPlayer.pause()
            DispatchQueue.main.async {
                sender.setImage(UIImage(named: "Play"), for: .normal)
            }
        } else {
            Player.shared.AudioPlayer.play()
                DispatchQueue.main.async {
                    sender.setImage(UIImage(named: "Pause"), for: .normal)
                    }

        }
        
    }
    
    @IBAction func openModal(_ sender: Any) {
        print("I tapped on the controller")
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        print("##############")
        print("Disappearing")
    }


}

