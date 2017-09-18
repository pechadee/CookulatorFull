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
    
    //@IBOutlet weak var mlTextField: UITextField!
    //@IBOutlet weak var usCupTextField: UITextField!
    //@IBOutlet weak var usFlOzTextField: UITextField!
    //@IBOutlet weak var usTbspTextField: UITextField!
    //@IBOutlet weak var usTspTextField: UITextField!
    //@IBOutlet weak var ukCupTextField: UITextField!
    //@IBOutlet weak var canAusCupTextField: UITextField!
    //@IBOutlet weak var ukCanAusFlOzTextField: UITextField!
    //@IBOutlet weak var ukCanTbspTextField: UITextField!
    //@IBOutlet weak var ausTbspTextField: UITextField!
    //@IBOutlet weak var ukCanAusTspTextField: UITextField!
    
    @IBOutlet weak var literTextField: UITextField!
    @IBOutlet weak var metricDropTextField: UITextField!
    
    @IBOutlet weak var ukDspTextField: UITextField!
    @IBOutlet weak var usDramTextField: UITextField!
    @IBOutlet weak var ukDramTextField: UITextField!
    @IBOutlet weak var usDashTextField: UITextField!
    @IBOutlet weak var ukDashTextField: UITextField!
    @IBOutlet weak var usPinchTextField: UITextField!
    @IBOutlet weak var ukPinchTextField: UITextField!
    @IBOutlet weak var usSmidgenTextField: UITextField!
    @IBOutlet weak var ukSmidgenTextField: UITextField!
    @IBOutlet weak var usDropTextField: UITextField!
    @IBOutlet weak var ukDropTextField: UITextField!
    
    @IBOutlet weak var usFlGallonTextField: UITextField!
    @IBOutlet weak var usDrGallonTextField: UITextField!
    @IBOutlet weak var ukGallonTextField: UITextField!
    @IBOutlet weak var usFlQuartTextField: UITextField!
    @IBOutlet weak var usDrQuartTextField: UITextField!
    @IBOutlet weak var ukQuartTextField: UITextField!
    @IBOutlet weak var usFlPintTextField: UITextField!
    @IBOutlet weak var usDrPintTextField: UITextField!
    @IBOutlet weak var ukPintTextField: UITextField!
    @IBOutlet weak var usGillTextField: UITextField!
    @IBOutlet weak var ukGillTextField: UITextField!
    
    @IBOutlet weak var usLegalCupTextField: UITextField!
    @IBOutlet weak var usLegalFlOzTextField: UITextField!
    @IBOutlet weak var usLegalTspTextField: UITextField!
    
    @IBOutlet weak var japCupTextField: UITextField!
    
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
                
                
            // pay version
            /*
            case usCupTextField:
                returnMlFloat = VolumeConverter.usCupToMl(senderFloatValue)
                returnConvertedFromString = "US cups"
            case usFlOzTextField:
                returnMlFloat = VolumeConverter.usFlOzToMl(senderFloatValue)
                returnConvertedFromString = "US fluid oz"
            case usTbspTextField:
                returnMlFloat = VolumeConverter.usTbspToMl(senderFloatValue)
                returnConvertedFromString = "US tbsp"
            case usTspTextField:
                returnMlFloat = VolumeConverter.usTspToMl(senderFloatValue)
                returnConvertedFromString = "US tsp"
            case ukCupTextField:
                returnMlFloat = VolumeConverter.ukCupToMl(senderFloatValue)
                returnConvertedFromString = "UK cups"
            case canAusCupTextField:
                returnMlFloat = VolumeConverter.metricCupsToMl(senderFloatValue)
                returnConvertedFromString = "Can/Aus cups"
            case ukCanAusFlOzTextField:
                returnMlFloat = VolumeConverter.ukFlOzToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can/Aus fluid oz"
            case ukCanTbspTextField:
                returnMlFloat = VolumeConverter.ukTbspToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can tbsp"
            case ausTbspTextField:
                returnMlFloat = VolumeConverter.ausTbspToMl(senderFloatValue)
                returnConvertedFromString = "Aus tbsp"
            case ukCanAusTspTextField:
                returnMlFloat = VolumeConverter.ukTspToMl(senderFloatValue)
                returnConvertedFromString = "UK/Can/Aus tsp"
            */
                
            case literTextField:
                returnMlFloat = VolumeConverter.metricLiterToMl(senderFloatValue)
                returnConvertedFromString = "metric liter"
            case metricDropTextField:
                returnMlFloat = VolumeConverter.metricDropToMl(senderFloatValue)
                returnConvertedFromString = "metric drop"
            case ukDspTextField:
                returnMlFloat = VolumeConverter.ukDspToMl(senderFloatValue)
                returnConvertedFromString = "UK dsp"
            case usDramTextField:
                returnMlFloat = VolumeConverter.usDramToMl(senderFloatValue)
                returnConvertedFromString = "US dram"
            case ukDramTextField:
                returnMlFloat = VolumeConverter.ukDramToMl(senderFloatValue)
                returnConvertedFromString = "UK dram"
            case usDashTextField:
                returnMlFloat = VolumeConverter.usDashToMl(senderFloatValue)
                returnConvertedFromString = "US dash"
            case ukDashTextField:
                returnMlFloat = VolumeConverter.ukDashToMl(senderFloatValue)
                returnConvertedFromString = "UK dash"
            case usPinchTextField:
                returnMlFloat = VolumeConverter.usPinchToMl(senderFloatValue)
                returnConvertedFromString = "US pinch"
            case ukPinchTextField:
                returnMlFloat = VolumeConverter.ukPinchToMl(senderFloatValue)
                returnConvertedFromString = "UK pinch"
            case usSmidgenTextField:
                returnMlFloat = VolumeConverter.usSmidgenToMl(senderFloatValue)
                returnConvertedFromString = "US smidgen"
            case ukSmidgenTextField:
                returnMlFloat = VolumeConverter.ukSmidgenToMl(senderFloatValue)
                returnConvertedFromString = "UK smidgen"
            case usDropTextField:
                returnMlFloat = VolumeConverter.usDropToMl(senderFloatValue)
                returnConvertedFromString = "US drop"
            case ukDropTextField:
                returnMlFloat = VolumeConverter.ukDropToMl(senderFloatValue)
                returnConvertedFromString = "UK drop"
                
            case usFlGallonTextField:
                returnMlFloat = VolumeConverter.usFlGallonToMl(senderFloatValue)
                returnConvertedFromString = "US fluid gallon"
            case usDrGallonTextField:
                returnMlFloat = VolumeConverter.usDryGallonToMl(senderFloatValue)
                returnConvertedFromString = "US dry gallon"
            case ukGallonTextField:
                returnMlFloat = VolumeConverter.ukGallonToMl(senderFloatValue)
                returnConvertedFromString = "UK gallon"
            case usFlQuartTextField:
                returnMlFloat = VolumeConverter.usFlQuartToMl(senderFloatValue)
                returnConvertedFromString = "US fluid quart"
            case usDrQuartTextField:
                returnMlFloat = VolumeConverter.usDryQuartToMl(senderFloatValue)
                returnConvertedFromString = "US dry quart"
            case ukQuartTextField:
                returnMlFloat = VolumeConverter.ukQuartToMl(senderFloatValue)
                returnConvertedFromString = "UK quart"
            case usFlPintTextField:
                returnMlFloat = VolumeConverter.usFlPintToMl(senderFloatValue)
                returnConvertedFromString = "US fluid pint"
            case usDrPintTextField:
                returnMlFloat = VolumeConverter.usDryPintToMl(senderFloatValue)
                returnConvertedFromString = "US dry pint"
            case ukPintTextField:
                returnMlFloat = VolumeConverter.ukPintToMl(senderFloatValue)
                returnConvertedFromString = "UK pint"
            case usGillTextField:
                returnMlFloat = VolumeConverter.usGillToMl(senderFloatValue)
                returnConvertedFromString = "US gill"
            case ukGillTextField:
                returnMlFloat = VolumeConverter.ukGillToMl(senderFloatValue)
                returnConvertedFromString = "UK gill"
                
            case usLegalCupTextField:
                returnMlFloat = VolumeConverter.usLegalCupsToMl(senderFloatValue)
                returnConvertedFromString = "US legal cups"
            case usLegalFlOzTextField:
                returnMlFloat = VolumeConverter.usLegalFlOzToMl(senderFloatValue)
                returnConvertedFromString = "US legal fluid oz"
            case usLegalTspTextField:
                returnMlFloat = VolumeConverter.usLegalTspToMl(senderFloatValue)
                returnConvertedFromString = "US legal tsp"
                
            case japCupTextField:
                returnMlFloat = VolumeConverter.japCupsToMl(senderFloatValue)
                returnConvertedFromString = "Japanese cups"
                
                
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
        
        
        // pay version
        /*
        self.mlTextField.text = NSString(format: "%.0f", mlToConvert) as String
        self.usCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsCups(mlToConvert)) as String
        self.usFlOzTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsFlOz(mlToConvert)) as String
        self.usTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsTbsp(mlToConvert)) as String
        self.usTspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsTsp(mlToConvert)) as String
        self.ukCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkCups(mlToConvert)) as String
        self.canAusCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToMetricCups(mlToConvert)) as String
        self.ukCanAusFlOzTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkFlOz(mlToConvert)) as String
        self.ukCanTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkTbsp(mlToConvert)) as String
        self.ausTbspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToAusTbsp(mlToConvert)) as String
        self.ukCanAusTspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkTsp(mlToConvert)) as String
        
        self.messageLabel.text = "Converted from \(convertedFrom)"
        */
        
        self.literTextField.text = NSString(format: "%.2f", VolumeConverter.mlToMetricLiter(mlToConvert)) as String
        self.metricDropTextField.text = NSString(format: "%.2f", VolumeConverter.mlToMetricDrop(mlToConvert)) as String
        self.ukDspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkDsp(mlToConvert)) as String
        self.usDramTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDram(mlToConvert)) as String
        self.ukDramTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkDram(mlToConvert)) as String
        self.usDashTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDash(mlToConvert)) as String
        self.ukDashTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkDash(mlToConvert)) as String
        self.usPinchTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsPinch(mlToConvert)) as String
        self.ukPinchTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkPinch(mlToConvert)) as String
        self.usSmidgenTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsSmidgen(mlToConvert)) as String
        self.ukSmidgenTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkSmidgen(mlToConvert)) as String
        self.usDropTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDrop(mlToConvert)) as String
        self.ukDropTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkDrop(mlToConvert)) as String
        
        self.usFlGallonTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsFlGallon(mlToConvert)) as String
        self.usDrGallonTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDryGallon(mlToConvert)) as String
        self.ukGallonTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkGallon(mlToConvert)) as String
        self.usFlQuartTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsFlQuart(mlToConvert)) as String
        self.usDrQuartTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDryQuart(mlToConvert)) as String
        self.ukQuartTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkQuart(mlToConvert)) as String
        self.usFlPintTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsFlPint(mlToConvert)) as String
        self.usDrPintTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsDryPint(mlToConvert)) as String
        self.ukPintTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkPint(mlToConvert)) as String
        self.usGillTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsGill(mlToConvert)) as String
        self.ukGillTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUkGill(mlToConvert)) as String
        
        self.usLegalCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsLegalCups(mlToConvert)) as String
        self.usLegalFlOzTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsLegalFlOz(mlToConvert)) as String
        self.usLegalTspTextField.text = NSString(format: "%.2f", VolumeConverter.mlToUsLegalTsp(mlToConvert)) as String
        
        self.japCupTextField.text = NSString(format: "%.2f", VolumeConverter.mlToJapCups(mlToConvert)) as String
        
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

