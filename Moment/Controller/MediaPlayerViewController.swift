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
    var totalTime:String!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    
    let songSelected = Notification.Name(rawValue: songSelectedKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.songNameLabel?.text = "Not Playing"
        self.totalTime = "0"
        albumImage.image = UIImage(named: "placeholder")
        print("Media player up and running")
        
        tapGesture.isEnabled = false
        playButton.isEnabled = false
        
        createObserver()
        
       
    }
    
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.OnSongSelected), name: songSelected, object: nil)
        
    }
    
    @objc func OnSongSelected(notification: Notification){
        
        print("Song selected")
        let song = notification.object as! NSDictionary

        totalTime = song["totalTime"]! as! String
        setSongTitle(songName: song["songName"]! as! String)
        playTrack(filePath: song["songURL"]! as! URL)
        DispatchQueue.main.async {
            self.albumImage.image =  UIImage(data:song["songImage"]! as! Data,scale:1.0)
            self.playButton.isEnabled = true
        }
        
        tapGesture.isEnabled = true
        

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
        
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "SongModalViewController") as! SongModalViewController
        VC1.modalTransitionStyle = .crossDissolve
        VC1.modalPresentationStyle = .overCurrentContext
        
        VC1.songNamePassed = songNameLabel
        VC1.albumImagePassed = albumImage
        VC1.totalTimePassed = self.totalTime
        
        self.present(VC1, animated: true, completion: nil)

    }
    

    override func viewDidDisappear(_ animated: Bool) {
        print("##############")
        print("Disappearing")
    }


}

