//
//  WeightViewController.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2017-09-16.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var lbTextField: UITextField!
    @IBOutlet weak var ozTextField: UITextField!
    @IBOutlet weak var kgTextField: UITextField!
    @IBOutlet weak var gTextField: UITextField!
    @IBOutlet weak var stTextField: UITextField!
    @IBOutlet weak var lbOzTextField_lb: UITextField!
    @IBOutlet weak var lbOzTextField_oz: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var lbOzButton: UIButton!
    
    var gFloat : Float?
    var convertedFromString : String?
    
    // MAIN CALCULATE FUNCTION
    @IBAction func calculate(sender: AnyObject) {
        
        // check that sender is a UITextField
        if sender is UITextField {
            
            let senderTextField = sender as! UITextField
            
            // convert text field to grams
            (self.gFloat, convertedFromString) = convertInputToG(senderTextField: senderTextField)
            
            // convert g to rest of units
            // and update text fields
            if self.gFloat != nil && convertedFromString != nil {
                if convertGToRest(gToConvert: self.gFloat!, convertedFrom: convertedFromString!) {
                    print("Convertion complete")
                } else {
                    print("Conversion failed - could not convert from ml to others")
                }
            } else {
                print("input was not converted to g")
            }
            
        } else if sender is UIButton {
            
            // get button
            let senderButton : UIButton = sender as! UIButton
            
            if senderButton == self.lbOzButton {
                
                let lbOzFloat_lb = (self.lbOzTextField_lb.text! as NSString).floatValue
                let lbOzFloat_oz = (self.lbOzTextField_oz.text! as NSString).floatValue
                
                self.gFloat = WeightConverter.lbToG(lb: lbOzFloat_lb) + WeightConverter.ozToG(oz: lbOzFloat_oz)
                
                if convertGToRest(gToConvert: self.gFloat!, convertedFrom: "pounds and ounces") {
                    print("Convertion complete")
                } else {
                    print("Conversion failed - could not convert from ml to others")
                }
                
            } else {
                print("Sender is not a known button")
            }
            
        } else {
            print("Sender is not a text field or button")
        }
        
        // Google Analytics Code - send calculate event
        /*let tracker = GAI.sharedInstance().defaultTracker
    tracker.send(GAIDictionaryBuilder.createEventWithCategory("process_action", action: "calculate_weight",label:"weight calculated",value:nil).build())
        */
    }
    
    // CONVERTS TEXT FIELD INPUT TO G FLOAT AND "CONVERTED FROM" STRING
    func convertInputToG(senderTextField : UITextField) -> (g : Float?, convertedFrom : String?) {
        
        var returnGFloat : Float?
        var returnConvertedFromString : String?
        
        if checkStringCanConvertToFloat(senderTextField.text!) {
            
            // text CAN convert to float
            
            // get sender float value
            let senderFloatValue : Float = (senderTextField.text! as NSString).floatValue
            
            // CONVERT SENDER VALUE TO G
            switch senderTextField {
                
            case gTextField:
                returnGFloat = senderFloatValue
                returnConvertedFromString = "g"
            case lbTextField:
                returnGFloat = WeightConverter.lbToG(lb: senderFloatValue)
                returnConvertedFromString = "lb"
            case ozTextField:
                returnGFloat = WeightConverter.ozToG(oz: senderFloatValue)
                returnConvertedFromString = "oz"
            case kgTextField:
                returnGFloat = WeightConverter.kgToG(kg: senderFloatValue)
                returnConvertedFromString = "kg"
            case stTextField:
                returnGFloat = WeightConverter.stToG(st: senderFloatValue)
                returnConvertedFromString = "stones"
                
            default:
                returnGFloat = nil
                returnConvertedFromString = nil
                print("don't know what text field this is")
                break
            }
            
        } else {
            // text cannot convert to float
            print("String to be converted to float does not contain the required characters (numbers and decimal)")
            returnGFloat = nil
            returnConvertedFromString = nil
        }
        
        return (returnGFloat, returnConvertedFromString)
    }
    
    // Convert the g value of input to the rest of the units
    // And update all the fields on the interface
    func convertGToRest(gToConvert : Float, convertedFrom : String) -> Bool {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        // convert from g to all numbers
        self.gFloat = gToConvert
        let lbFloat : Float = WeightConverter.gToLb(g: self.gFloat!)
        let ozFloat : Float = WeightConverter.gToOz(g: self.gFloat!)
        let kgFloat : Float = WeightConverter.gToKg(g: self.gFloat!)
        let stFloat : Float = WeightConverter.gToSt(g: self.gFloat!)
        
        // convert g to lb, oz
        var lbOzFloat_oz = fmod(ozFloat, 16)                // (lb,oz)oz
        var lbOzFloat_lb = (ozFloat - lbOzFloat_oz) / 16    // (lb,oz)lb
        
        // if (lb,oz)oz rounded up to 2 dec. = 16 then set it to 0 and add 1 to (lb,oz)lb
        let rounded_lbOz_oz : Float = floorf(lbOzFloat_oz * 100 + 0.5) / 100    // rounded (lb,oz)oz
        if rounded_lbOz_oz == 16 {
            lbOzFloat_oz = 0
            lbOzFloat_lb += 1
        }
        
        // update text fields with converted floats
        self.lbTextField.text = NSString(format: "%.2f", lbFloat) as String
        self.ozTextField.text = NSString(format: "%.2f", ozFloat) as String
        self.kgTextField.text = NSString(format: "%.2f", kgFloat) as String
        self.gTextField.text = NSString(format: "%.0f", self.gFloat!) as String
        self.stTextField.text = NSString(format: "%.2f", stFloat) as String
        self.lbOzTextField_lb.text = NSString(format: "%.0f", lbOzFloat_lb) as String
        self.lbOzTextField_oz.text = NSString(format: "%.2f", lbOzFloat_oz) as String
        
        self.messageLabel.text = "Converted from \(convertedFrom)"
        
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
    
    // change status bar to white text
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

