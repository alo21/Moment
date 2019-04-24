//
//  ImageNetwork.swift
//  Moment
//
//  Created by Alessandro Losavio on 01/04/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

func downloadImage(url: String) {
    
    let request = URLRequest(url: URL(string: url)!)
    let session = URLSession.shared
    //var image = Data()
    
    
    let task = session.dataTask(with: request) { data, response, error in
        if error != nil { // Handle error...
            
            //errorHandler(error!)
            print(error?.localizedDescription ?? "Unknow error")
            
            return
        }
        
        guard let data = data else {
            
            print("No data")
            return
        }
        
        do {
            
            print(data)
            print("Obtained image")
            //completionHandler()
            return
                
            }
        
        
    }
    task.resume()
    
    return
    
}

