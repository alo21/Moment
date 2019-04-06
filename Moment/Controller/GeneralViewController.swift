//
//  GeneralViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralViewController: UITabBarController {
    
    
    var AudioPlayer = AVAudioPlayer()
    @IBOutlet var myTabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == (self.tabBar.items as! [UITabBarItem])[0] {
            
            print("First Tab selectd")
            
        } else if item == (self.tabBar.items as! [UITabBarItem])[1] {
            
            print("Second Tab selected")
            
            
        }
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
