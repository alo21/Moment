//
//  AppDelegate.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let dataController = DataController(modelName: "myLibrary")

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        dataController.load()
        
        return true
    }


}

