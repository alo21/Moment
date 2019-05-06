//
//  SongModalViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 06/05/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class SongModalViewController: UIViewController {
    
    
    var songNamePassed:UILabel!
    var albumImagePassed:UIImageView!
    var totalTimePassed:String!
    var FloatTotalTime:Float!
    
    @IBOutlet var gestureRec: UISwipeGestureRecognizer!
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var totalTime: UILabel!
    
    @IBOutlet var albumImage: UIImageView!

    @IBOutlet var songName: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FloatTotalTime = Float(totalTimePassed)
        progressBar.setProgress(0, animated: false)
        albumImage.image = albumImagePassed.image
        songName.text = songNamePassed.text
        currentTime.text = String(Int(Player.shared.AudioPlayer.currentTime))
        gestureRec.direction = .down
        totalTime.text = totalTimePassed
        startTimer()

    }
    
    func startTimer() {

        _ = Timer.scheduledTimer(timeInterval: 1.000, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerUpdate(){
        
        currentTime.text = String(Int(Player.shared.AudioPlayer.currentTime))
        progressBar.setProgress((Float(Player.shared.AudioPlayer.currentTime)/FloatTotalTime), animated: true)
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        
        if (sender as! UISwipeGestureRecognizer).direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe down gesture")
            dismiss(animated: true, completion: nil)
        }
        
    }
    

}
