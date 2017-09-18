//
//  InfoViewController.swift
//  CookulatorFull
//
//  Created by Petra Dueck on 2017-09-17.
//  Copyright © 2017 Petra Dueck. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    // Support URL
    let cookulatorUrl = URL(string: "http://www.cookulator.net")!
    
    // Weblink button to go to cookulator.net
    @IBAction func openUrl_Support(_ sender: Any) {
        if UIApplication.shared.canOpenURL(cookulatorUrl) {
            // added if statement for backward compatibility
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(cookulatorUrl, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(cookulatorUrl)
            }
        }
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
