//
//  TempConverter.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2015-03-11 - 2017-09-18.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import Foundation

struct TempConverter {
    
    // Convert Temperature
    static func cToF(c : Float) -> Float {
        let result = (9.00 / 5.00) * c + 32.00;
        return result
    }
    static func fToC(f : Float) -> Float {
        let result = (5.00 / 9.00) * (f - 32.00);
        return result
    }
}
