//
//  RadioData.swift
//  Moment
//
//  Created by Alessandro Losavio on 31/03/2019.
//  Copyright © 2019 Losavio. All rights reserved.
//

import Foundation

var radioDataGlobal: [radio] = []

class RadioData {
    
    func getRadios() -> [radio] {
        
        return radioDataGlobal
        
    }
    
    func addRadio(radio: radio) {
        
        radioDataGlobal.append(radio)
        print("Added radio")
    }
       
    
}
