//
//  WeightConverter.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2015-03-11 - 2017-09-18.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import Foundation

struct WeightConverter {
    
    // WEIGHT (IN G)
    
    static let LbInG : Float = 453.59237;			// Wikipedia
    static let OzInG : Float = 28.3495231;			// Wikipedia
    static let MgInG : Float =	0.001;				// Wikipedia
    static let KgInG : Float = 1000;				// Wikipedia
    static let StInG : Float = 6350.29318;			// Wikipedia = 14 pounds
    
    // Convert to g
    static func lbToG(lb : Float) -> Float {
        let result = lb * LbInG
        return result
    }
    static func ozToG(oz : Float) -> Float {
        let result = oz * OzInG
        return result
    }
    static func mgToG(mg : Float) -> Float {
        let result = mg * MgInG
        return result
    }
    static func kgToG(kg : Float) -> Float {
        let result = kg * KgInG
        return result
    }
    static func stToG(st : Float) -> Float {
        let result = st * StInG
        return result
    }
    
    // Convert from g
    static func gToLb(g : Float) -> Float {
        let result = g / LbInG
        return result
    }
    static func gToOz(g : Float) -> Float {
        let result = g / OzInG
        return result
    }
    static func gToMg(g : Float) -> Float {
        let result = g / MgInG
        return result
    }
    static func gToKg(g : Float) -> Float {
        let result = g / KgInG
        return result
    }
    static func gToSt(g : Float) -> Float {
        let result = g / StInG
        return result
    }
}
