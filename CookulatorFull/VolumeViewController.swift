//
//  VolumeViewController.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2011 - 2017-09-16.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var free_messageLabel: UILabel!
    @IBOutlet weak var free_mlTextField: UITextField!
    @IBOutlet weak var free_usCupTextField: UITextField!
    @IBOutlet weak var free_usFlOzTextField: UITextField!
    @IBOutlet weak var free_usTbspTextField: UITextField!
    @IBOutlet weak var free_usTspTextField: UITextField!
    @IBOutlet weak var free_ukCupTextField: UITextField!
    @IBOutlet weak var free_canAusCupTextField: UITextField!
    @IBOutlet weak var free_ukCanAusFlOzTextField: UITextField!
    @IBOutlet weak var free_ukCanTbspTextField: UITextField!
    @IBOutlet weak var free_ausTbspTextField: UITextField!
    @IBOutlet weak var free_ukCanAusTspTextField: UITextField!
    
    var mlFloat : Float?
    var convertedFromString : String?
    
    // MAIN CALCULATE FUNCTION
    @IBAction func calculate(_ sender: AnyObject) {
        // 1. determine which field changed
        // 2. convert other fields
        
        // check that sender is a UITextField
        if sender is UITextField {
            
            let senderTextField = sender as! UITextField
            
            // convert input to ml
            (self.mlFloat, convertedFromString) = convertInputToMl(senderTextField)
            
            // convert ml to rest of units
            // and update text fields
            if self.mlFloat != nil && convertedFromString != nil {
                if convertMlToRest(self.mlFloat!, convertedFrom: convertedFromString!) {
                    print("Convertion complete")
                } else {
                    print("Conversion failed - could not convert from ml to others")
                }
            } else {
                print("mlFloat is nil - the text field's value was not converted to ml")
            }
            
            // dismiss keyboard
            senderTextField.resignFirstResponder()
            
        } else {
            print("sender is not a UITextField as expected")
        }
        
        /*
         // Google Analytics Code - send calculate event
         let tracker = GAI.sharedInstance().defaultTracker
         tracker?.send(GAIDictionaryBuilder.createEvent(withCategory: "process_action", action: "calculate_volume",label:"volume calculated",value:nil).build() as! [AnyHashable : Any]!)
         */
    }
    
    // Converts the value from the given text field to an optional Float of ML
    // Will return a float or nil
    func convertInputToMl(_ senderTextField : UITextField) -> (ml : Float?, convertedFrom : String?) {
        
        var returnMlFloat : Float?
        var returnConvertedFromString : String?
        
        // Check if string can be a float
        if checkStringCanConvertToFloat(senderTextField.text!) {
            
            // text CAN convert to float
            
            // get sender float value
            let senderFloatValue : Float = (senderTextField.text! as NSString).floatValue
            
            // CONVERT SENDER VALUE TO ML
            switch senderTextField {
                
            // free version
            case free_mlTextField:
                returnMlFloat = senderFloatValue
                returnConvertedFromString = "ml"
            case free_usCupTextField:
                returnMlFloat = VolumeConverter.usCupToMl(senderFloatValue)
                returnConvertedFromString = "US cups"
            case free_usFlOzTextField:
                returnMlFloat = VolumeConverter.usFlOzToMl(senderFloatValue)
                returnConvertedFromString = "US fluid oz"
            case free_usTbspTextField:
                returnMlFloat = VolumeConverter.usTbspToMl(senderFloatValue)
                returnConvertedFromString = "US tbsp"
            case free_usTspTextField:
                returnMlFloat = VolumeConverter.usTspToMl(senderFloatValue)
                returnConvertedFromString = "US tsp"
            case free_ukCupTextField:
                returnMlFloat = VolumeConverter.ukCupToMl(senderFloatValue)
                returnConvertedFromString = "UK cups"
            case free_canAusCupTextField:
                returnMlFloat = VolumeConverter.metricCupsToMl(senderFloatValue)
                returnConvertedFromString = "Can/Aus cups"
            case free_ukCanAusFlOzTextField:
                returnMlFloat = VolumeConverter.ukFlOzToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can/Aus fluid oz"
            case free_ukCanTbspTextField:
                returnMlFloat = VolumeConverter.ukTbspToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can tbsp"
            case free_ausTbspTextField:
                returnMlFloat = VolumeConverter.ausTbspToMl(senderFloatValue)
                returnConvertedFromString = "Aus tbsp"
            case free_ukCanAusTspTextField:
                returnMlFloat = VolumeConverter.ukTspToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can/Aus tsp"
                
            default:
                print("don't know what text field this is")
                break
            }
            
        } else {
            // text cannot convert to float
            print("String to be converted to float does not contain the required characters (numbers and decimal)")
            return (nil, nil)
        }
        
        return (returnMlFloat, returnConvertedFromString)
    }
    
    // Convert the ml value of input to the rest of the units
    // And update all the fields on the interface
    func convertMlToRest(_ mlToConvert : Float, convertedFrom : String) -> Bool {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        // CONVERT
        
        // free version
        
        self.free_mlTextField.text = NSString(format: "%.0f", mlToConvert) as String
        self.free_usCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsCups(mlToConvert)) as String
        self.free_usFlOzTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsFlOz(mlToConvert)) as String
        self.free_usTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsTbsp(mlToConvert)) as String
        self.free_usTspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsTsp(mlToConvert)) as String
        self.free_ukCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkCups(mlToConvert)) as String
        self.free_canAusCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToMetricCups(mlToConvert)) as String
        self.free_ukCanAusFlOzTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkFlOz(mlToConvert)) as String
        self.free_ukCanTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkTbsp(mlToConvert)) as String
        self.free_ausTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToAusTbsp(mlToConvert)) as String
        self.free_ukCanAusTspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkTsp(mlToConvert)) as String
        
        self.free_messageLabel.text = "Converted from \(convertedFrom)"
        
        return true
        
    }
    
    // HELPER - checks if a string has necessary characters to convert to float
    func checkStringCanConvertToFloat(_ theStringToCheck : String) -> Bool {
        let floatRegex = "^[+-]?\\d*?\\.?\\d*?$"
        if theStringToCheck.range(of: floatRegex, options: .regularExpression) != nil{
            return true
        } else {
            return false
        }
    }
    
    
    // dismiss keyboard when touch return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // dismiss keyboard when touch background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

