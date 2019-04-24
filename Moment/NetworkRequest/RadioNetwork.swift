//
//  Radio.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation
import UIKit


class RadioNetwork{
    
    //let finalURL = baseAPIUrl + radio + clientIDUrl + clientID + format + limit
    
    func getRadiosList(completionHandler: @escaping()->Void) -> Void {
        
        let request = URLRequest(url: URL(string: "https://api.jamendo.com/v3.0/radios/?client_id=7a746963&format=jsonpretty&limit=25")!)
        let session = URLSession.shared
        

        
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
                
                //var myData = String(data: data, encoding: .utf8)!
                let radioList = try JSONDecoder().decode(radioResponse.self, from: data)
                //self.radioArray = radioList.results.map({$0})
                                
                if RadioData().getRadios().count == 0 {
                
                    radioList.results.forEach{ station in
                    
                        RadioData().addRadio(radio: station)
                    }
                    
                }
                
                DispatchQueue.main.async {
                    
                    print("Done getting data")
                    
                    completionHandler()
                    
                }
                
                
                
                
            } catch {
                let myError = error as NSError
                print("Qualcosa non va")
                print(myError)
                
            }
            
        }
        task.resume()
        
        return
        
    }
    
    
    func getRadioStation(idRadio: Int){
        
        let idRadio = String(idRadio)
        
        let request = URLRequest(url: URL(string: "https://api.jamendo.com/v3.0/radios/stream/?client_id=7a746963&format=jsonpretty&id=" + idRadio)!)
        let session = URLSession.shared
        
        
        
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
                
                //var myData = String(data: data, encoding: .utf8)!
                let radioList = try JSONDecoder().decode(radioResponse.self, from: data)
                //self.radioArray = radioList.results.map({$0})
                
                //print(radioList)
                
                if RadioData().getRadios().count == 0 {
                    
                    radioList.results.forEach{ station in
                        
                        
                        RadioData().addRadio(radio: station)
                    }
                    
                }
                
                DispatchQueue.main.async {
                    
                    print("Done getting data")
                    
                    //completionHandler()
                    
                }
                
                
                
                
            } catch {
                let myError = error as NSError
                print("Qualcosa non va")
                print(myError)
                
            }
            
        }
        task.resume()
        
        return
        
        
        
        
        
        
    }
    
    
    
    
}
