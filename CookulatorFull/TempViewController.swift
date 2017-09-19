//
//  TempViewController.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2017-09-17.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import UIKit

class TempViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBAction func calculate(sender: AnyObject) {
        
        var fFloat : Float?
        var cFloat : Float?
        var _ : String?
        
        if sender is UITextField {
            
            let senderTextField = sender as! UITextField
            
            // convert and update fields
            if checkStringCanConvertToFloat(senderTextField.text!) {
                
                switch senderTextField {
                case fTextField:
                    fFloat = (senderTextField.text! as NSString).floatValue
                    cFloat = TempConverter.fToC(f: fFloat!)
                    self.fTextField.text = NSString(format: "%.0f", fFloat!) as String
                    self.cTextField.text = NSString(format: "%.0f", cFloat!) as String
                    messageLabel.text = "Converted from fahrenheit"
                case cTextField:
                    cFloat = (senderTextField.text! as NSString).floatValue
                    fFloat = TempConverter.cToF(c: cFloat!)
                    self.fTextField.text = NSString(format: "%.0f", fFloat!) as String
                    self.cTextField.text = NSString(format: "%.0f", cFloat!) as String
                    messageLabel.text = "Converted from celsius"
                default:
                    messageLabel.text = "Cannot convert - Not sure what text field used"
                    print("don't know what text field this is")
                    break
                }
                
            } else {
                // text cannot convert to float
                messageLabel.text = "Cannot convert - Input is not a valid decimal number"
                print("String to be converted to float does not contain the required characters (numbers and decimal)")
            }
            
            /*
            // Google Analytics Code - send calculate event
            let tracker = GAI.sharedInstance().defaultTracker
            tracker.send(GAIDictionaryBuilder.createEventWithCategory("process_action", action: "calculate_temperature",label:"temperature calculated",value:nil).build())
            */
            
            // dismiss keyboard
            senderTextField.resignFirstResponder()
            
        } else {
            print("Sender is not a text field")
        }
        
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
