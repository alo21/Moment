//
//  Radio.swift
//  Moment
//
//  Created by Alessandro Losavio on 18/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation
import UIKit


class Radio{
    
    let baseAPIUrl = "https://api.jamendo.com/v3.0"
    let radio = "/radios"
    let clientIDUrl = "/?client_id="
    let clientID = "7a746963"
    let format = "&format=jsonpretty"
    let limit = "&limit=10"
    
    //let finalURL = baseAPIUrl + radio + clientIDUrl + clientID + format + limit
    
    func getRadiosList() -> Void {
        
        let request = URLRequest(url: URL(string: "https://api.jamendo.com/v3.0/radios/?client_id=7a746963&format=jsonpretty&limit=3")!)
        let session = URLSession.shared
        

        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error...
                
                //errorHandler(error!)
                print("#############à")
                print(error?.localizedDescription)
                
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
                
                print(radioList)
                
                DispatchQueue.main.async {
                    
                    let object = UIApplication.shared.delegate
                    let appDelegate = object as! AppDelegate
                    //var studentsArray: [StudentInformation] = []
                    
                    //Loop thrhough to save in shared
//                    for student in self.StudentsArray {
//
//                        if(student.latitude != nil || student.longitude != nil){
//
//                            appDelegate.Students.append(student)
//                            studentsArray.append(student)
//
//                        }
//                    }
                    
//                    StudentsInformationClass().saveStudentsInformationArray(studentsArray: studentsArray)
                    print("Done getting data")
                    
//                    completionHandler()
                    return
                    
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
