//
//  VolumeConverter.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2011-02-27 - 2017-09-17.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import Foundation

class VolumeConverter {
    
    // CONSTANTS
    // ref FPSi: http://www.france-property-and-information.com/cooking_converter.htm
    // ref OUC: http://www.onlineunitconversion.com/
    
    // VOLUME IN ML
    
    static let UsCupInMl : Float = 236.5882365              // Wikipedia
    static let UsGillInMl : Float = 118.29411825;			// Wikipedia - gill
    static let UsFlOzInMl : Float = 29.5735295625;			// Wikipedia
    static let UsTbspInMl : Float = 14.7867648;             // Wikipedia - tbsp = 1/2 fl.oz
    static let UsTspInMl : Float = 4.92892159;				// Wikipedia - tsp = 1/6 fl.oz
    static let UsDramInMl : Float = 3.6966911953125;		// OUC and Wikipedia
    static let UsFlPintInMl : Float = 473.176473;			// Wikipedia
    static let UsFlQuartInMl : Float = 946.352946;			// Wikipedia
    static let UsFlGallonInMl : Float = 3785.411784;		// Wikipedia
    static let UsDryPintInMl : Float = 550.6104713575;		// Wikipedia
    static let UsDryQuartInMl : Float = 1101.220942715;     // Wikipedia
    static let UsDryGallonInMl : Float = 4404.88377086;     // Wikipedia
    
    static let UsLegalCupInMl : Float = 240;				// Wikipedia - cup
    static let UsLegalFlOzInMl : Float = 30;				// Wikipedia - fluid oz (food labeling only)
    static let UsLegalTspInMl : Float = 5;					// Wikipedia
    
    // UK pre-metric measurement constants
    static let UkQuartInMl : Float = 1136.5225;             // Wikipedia - quart
    static let UkCupInMl : Float = 284;                     // Wikipedia
    static let UkGillInMl : Float = 142.0653125;			// Wikipedia - gill
    static let UkFlOzInMl : Float = 28.4130625;             // Wikipedia
    static let UkTbspInMl : Float = 15;                     // Wikipedia - 3 tsp
    static let UkDspInMl : Float = 10;						// Wikipedia
    static let UkTspInMl : Float = 5;						// Wikipedia - cooking measures
    static let UkDramInMl : Float = 3.5516328125;			// OUC and Wikipedia
    static let UkPintInMl : Float = 568.26125;				// Wikipedia
    static let UkGallonInMl : Float = 4546.09;				// Wikipedia
    
    // Metric measurement constants
    // Canadian/Australian Cup measure
    static let MetricCupInMl : Float = 250;                 // Wikipedia
    static let MetricDropInMl : Float = 0.05;				// Wikipedia (1/20th ml)
    static let MetricLiterInMl : Float = 1000;				// Wikipedia
    
    // Australia pre-metric measurement constants
    static let AusTbspInMl : Float = 20;					// Wikipedia - cooking measures
    static let AusPintInMl : Float = 568.26;				// Wikipedia - cooking measures
    
    // Japanese
    static let JapCupInMl : Float = 200;					// Wikipedia - cup
    
    
    // CONVERT TO ML
    
    // US to ml
    static func usCupToMl(_ amt : Float) -> Float {
        var ml : Float
        ml = amt * UsCupInMl
        return ml
    }
    static func usGillToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsGillInMl
        return ml
    }
    static func usFlOzToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsFlOzInMl
        return ml
    }
    static func usTbspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsTbspInMl
        return ml
    }
    static func usTspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsTspInMl
        return ml
    }
    static func usDramToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsDramInMl
        return ml
    }
    static func usPinchToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UsTspInMl / 16); // Wikipedia
        return ml
    }
    static func usSmidgenToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UsTspInMl / 32); // Wikipedia
        return ml
    }
    static func usDashToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UsTspInMl / 8); // Wikipedia
        return ml
    }
    static func usDropToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UsTspInMl / 80); // Wikipedia 1/80th of a tsp
        return ml
    }
    static func usFlPintToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsFlPintInMl
        return ml
    }
    static func usFlQuartToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsFlQuartInMl
        return ml
    }
    static func usFlGallonToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsFlGallonInMl
        return ml
    }
    static func usDryPintToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsDryPintInMl
        return ml
    }
    static func usDryQuartToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsDryQuartInMl
        return ml
    }
    static func usDryGallonToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsDryGallonInMl
        return ml
    }
    
    static func usLegalCupsToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsLegalCupInMl
        return ml
    }
    static func usLegalFlOzToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsLegalFlOzInMl
        return ml
    }
    static func usLegalTspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UsLegalTspInMl
        return ml
    }
    
    
    
    // UK to ml
    static func ukCupToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkCupInMl
        return ml
    }
    static func ukFlOzToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkFlOzInMl
        return ml
    }
    static func ukTbspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkTbspInMl
        return ml
    }
    static func ukTspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkTspInMl
        return ml
    }
    static func ukQuartToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkQuartInMl
        return ml
    }
    static func ukGillToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkGillInMl
        return ml
    }
    static func ukDspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkDramInMl
        return ml
    }
    static func ukDramToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkDspInMl
        return ml
    }
    static func ukPinchToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UkTspInMl / 16); // Wikipedia
        return ml
    }
    static func ukSmidgenToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UkTspInMl / 32);  // Wikipedia
        return ml
    }
    static func ukDashToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UkTspInMl / 8); // Wikipedia
        return ml
    }
    static func ukDropToMl(_ amt : Float) -> Float {
        let ml : Float = amt * (UkFlOzInMl / 288); // Wikipedia 1/288th of fl.oz
        return ml
    }
    static func ukPintToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkPintInMl
        return ml
    }
    static func ukGallonToMl(_ amt : Float) -> Float {
        let ml : Float = amt * UkGallonInMl
        return ml
    }
    
    
    // metric to ml
    static func metricCupsToMl(_ amt : Float) -> Float {
        let ml : Float = amt * MetricCupInMl
        return ml
    }
    static func metricDropToMl(_ amt : Float) -> Float {
        let ml : Float = amt * MetricDropInMl
        return ml
    }
    static func metricLiterToMl(_ amt : Float) -> Float {
        let ml : Float = amt * MetricLiterInMl
        return ml
    }
    
    
    // Aus to ml
    static func ausTbspToMl(_ amt : Float) -> Float {
        let ml : Float = amt * AusTbspInMl
        return ml
    }
    static func ausPintToMl(_ amt : Float) -> Float {
        let ml : Float = amt * AusPintInMl
        return ml
    }
    
    // Jp to ml
    static func japCupsToMl(_ amt : Float) -> Float {
        let ml : Float = amt * JapCupInMl
        return ml
    }
    
    
    // CONVERT FROM ML
    
    // ml to US
    static func mlToUsCups(_ ml : Float) -> Float {
        let result = ml / UsCupInMl
        return result
    }
    static func mlToUsGill(_ ml : Float) -> Float {
        let result = ml / UsGillInMl
        return result
    }
    static func mlToUsFlOz(_ ml : Float) -> Float {
        let result = ml / UsFlOzInMl
        return result
    }
    static func mlToUsTbsp(_ ml : Float) -> Float {
        let result = ml / UsTbspInMl
        return result
    }
    static func mlToUsTsp(_ ml : Float) -> Float {
        let result = ml / UsTspInMl
        return result
    }
    static func mlToUsDram(_ ml : Float) -> Float {
        let result = ml / UsDramInMl
        return result
    }
    static func mlToUsPinch(_ ml : Float) -> Float {
        let result = ml / (UsTspInMl / 16); // Wikipedia
        return result
    }
    static func mlToUsSmidgen(_ ml : Float) -> Float {
        let result = ml / (UsTspInMl / 32); // Wikipedia
        return result
    }
    static func mlToUsDash(_ ml : Float) -> Float {
        let result = ml / (UsTspInMl / 8); // Wikipedia
        return result
    }
    static func mlToUsDrop(_ ml : Float) -> Float {
        let result = ml / (UsTspInMl / 80); // Wikipedia (1/80th tsp)
        return result
    }
    static func mlToUsFlPint(_ ml : Float) -> Float {
        let result = ml / UsFlPintInMl
        return result
    }
    static func mlToUsFlQuart(_ ml : Float) -> Float {
        let result = ml / UsFlQuartInMl
        return result
    }
    static func mlToUsFlGallon(_ ml : Float) -> Float {
        let result = ml / UsFlGallonInMl
        return result
    }
    static func mlToUsDryPint(_ ml : Float) -> Float {
        let result = ml / UsDryPintInMl
        return result
    }
    static func mlToUsDryQuart(_ ml : Float) -> Float {
        let result = ml / UsDryQuartInMl
        return result
    }
    static func mlToUsDryGallon(_ ml : Float) -> Float {
        let result = ml / UsDryGallonInMl
        return result
    }
    
    static func mlToUsLegalCups(_ ml : Float) -> Float {
        let result = ml / UsLegalCupInMl
        return result
    }
    static func mlToUsLegalFlOz(_ ml : Float) -> Float {
        let result = ml / UsLegalFlOzInMl
        return result
    }
    static func mlToUsLegalTsp(_ ml : Float) -> Float {
        let result = ml / UsLegalTspInMl
        return result
    }
    
    
    // ml to UK
    static func mlToUkCups(_ ml : Float) -> Float {
        let result = ml / UkCupInMl
        return result
    }
    static func mlToUkFlOz(_ ml : Float) -> Float {
        let result = ml / UkFlOzInMl
        return result
    }
    static func mlToUkTbsp(_ ml : Float) -> Float {
        let result = ml / UkTbspInMl
        return result
    }
    static func mlToUkTsp(_ ml : Float) -> Float {
        let result = ml / UkTspInMl
        return result
    }
    static func mlToUkQuart(_ ml : Float) -> Float {
        let result = ml / UkQuartInMl
        return result
    }
    static func mlToUkGill(_ ml : Float) -> Float {
        let result = ml / UkGillInMl
        return result
    }
    static func mlToUkDsp(_ ml : Float) -> Float {
        let result = ml / UkDspInMl
        return result
    }
    static func mlToUkDram(_ ml : Float) -> Float {
        let result = ml / UkDramInMl
        return result
    }
    static func mlToUkPinch(_ ml : Float) -> Float {
        let result = ml / (UkTspInMl / 16); // Wikipedia
        return result
    }
    static func mlToUkSmidgen(_ ml : Float) -> Float {
        let result = ml / (UkTspInMl / 32); // Wikipedia
        return result
    }
    static func mlToUkDash(_ ml : Float) -> Float {
        let result = ml / (UkTspInMl / 8); // Wikipedia
        return result
    }
    static func mlToUkDrop(_ ml : Float) -> Float {
        let result = ml / (UkFlOzInMl / 288); // Wikipedia (1/288 fl.oz)
        return result
    }
    static func mlToUkPint(_ ml : Float) -> Float {
        let result = ml / UkPintInMl
        return result
    }
    static func mlToUkGallon(_ ml : Float) -> Float {
        let result = ml / UkGallonInMl
        return result
    }
    
    // ml to Metric
    static func mlToMetricCups(_ ml : Float) -> Float {
        let result = ml / MetricCupInMl
        return result
    }
    static func mlToMetricDrop(_ ml : Float) -> Float {
        let result = ml / MetricDropInMl
        return result
    }
    static func mlToMetricLiter(_ ml : Float) -> Float {
        let result = ml / MetricLiterInMl
        return result
    }
    
    // ml to Aus
    static func mlToAusTbsp(_ ml : Float) -> Float {
        let result = ml / AusTbspInMl
        return result
    }
    static func mlToAusPint(_ ml : Float) -> Float {
        let result = ml / AusPintInMl
        return result
    }
    
    // ml to Jap
    static func mlToJapCups(_ ml : Float) -> Float {
        let result = ml / JapCupInMl
        return result
    }
    
}
