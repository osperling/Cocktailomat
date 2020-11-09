//
//  CocktailBrain.swift
//  Cocktailomat
//
//  Created by Christian Schuck on 30.10.20.
//  Copyright © 2020 Oliver Sperling. All rights reserved.
//

import UIKit
import Just

struct Cocktailbrain {
    var behaelter = ["","","",""]
    var fuellung = [0,0,0,0]
    var fuellungInML=[0,0,0,0]
    var pos = [0,0,0,0]
    var glas = 0
    var connection = false
        
    mutating func setGlas(glas: Int){
        self.glas = glas
    }
    
    mutating func setFuellung(behaelter:[String]){
        self.behaelter = behaelter
    }
    mutating func setFuellung(fuellung:[Int]){
        self.fuellung = fuellung
    }
    
    mutating func calcML(){
        for i in 0..<fuellung.count {
           fuellungInML[i] = Int(Double(fuellung[i])/100*Double(glas))
        }
    }
    mutating func makeCocktail() -> Bool{
        calcML()
        let url = "http://192.168.4.1/pump?p1=\(fuellungInML[0])&p2=\(fuellungInML[1])&p3=\(fuellungInML[2])&p4=\(fuellungInML[3])&p1_pos=\(pos[0])&p2_pos=\(pos[1])&p3_pos=\(pos[2])&p4_pos=\(pos[3])"
        return urlRequest(URL(string: url)!)
    }
    
    func urlRequest(_ url: URL) -> Bool{
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
        return true
    }
    
    mutating func establishConnection() -> Bool{
        let url = "http://192.168.4.1/connect"
        if(Just.get(url, timeout: 0.5).statusCode == 200){
            return true
        }else{
            return false
        }
    }
}
