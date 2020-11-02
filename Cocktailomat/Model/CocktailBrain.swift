//
//  CocktailBrain.swift
//  Cocktailomat
//
//  Created by Christian Schuck on 30.10.20.
//  Copyright © 2020 Oliver Sperling. All rights reserved.
//

import UIKit

struct Cocktailbrain {
    var behaelter = ["","","",""];
    var fuellung = [0.0,0.0,0.0,0.0]
    var fuellungInML=[0,0,0,0]
    var glas = 0;
    var connection = false;
    
    mutating func setGlas(glas: Int){
        self.glas = glas
    }
    
    mutating func setFuellung(behaelter:[String]){
        self.behaelter = behaelter
    }
    mutating func setFuellung(fuellung:[Double]){
        self.fuellung = fuellung
    }
    
    mutating func calcML(){
        var i = 0;
        for f in fuellung {
           fuellungInML[0] = Int(f*Double(glas))
            i += 1;
        }
    }
    mutating func makeCocktail() -> String{
        calcML()
        let res = "http://192.168.4.1/pump?p1=\(fuellungInML[0])&p2=\(fuellungInML[1])&p3=\(fuellungInML[2])&p4=\(fuellungInML[3])"
        print(res)
        return urlRequest(URL(string: res)!)
    }
    
    func urlRequest(_ url: URL) -> String{
        var re = ""
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            re = String(data: data, encoding: .utf8)!
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
            }
        task.resume()
        return re
    }
    
    mutating func establishConnection(){
        //Baut die Verbindung auf mit WLAN und dann Connection setzen auf true
    }
}
