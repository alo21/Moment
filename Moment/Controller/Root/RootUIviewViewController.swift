//
//  RootUIviewViewController.swift
//  Moment
//
//  Created by Alessandro Losavio on 30/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit

class RootUIviewViewController: UIViewController {
    
    
    @IBOutlet var navigationContainer: UIView!
    @IBOutlet var mediaPlayerContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "GeneralViewController") as! GeneralViewController
    
                
        // Do any additional setup after loading the view.
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
