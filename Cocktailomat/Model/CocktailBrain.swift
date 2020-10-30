//
//  CocktailBrain.swift
//  Cocktailomat
//
//  Created by Christian Schuck on 30.10.20.
//  Copyright © 2020 Oliver Sperling. All rights reserved.
//

import Foundation

struct Cocktailbrain {
    var behaelter = ["","",""];
    var fuellung = [0.0,0.0,0.0,0.0]
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
    
    func makeCocktail(){
        //ruft den richtigen URL auf
    }
    
    mutating func establishConnection(){
        //Baut die Verbindung auf mit WLAN und dann Connection setzen auf true
    }
}
