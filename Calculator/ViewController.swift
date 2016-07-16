//
//  ViewController.swift
//  Calculator
//
//  Created by Vincent Tran on 7/11/16.
//  Copyright © 2016 Vincent Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inMiddleOfTyping = false

    @IBOutlet weak var display: UILabel!

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if inMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        inMiddleOfTyping = true
        
    }
    
    @IBAction func performOperation(sender: UIButton) {
        inMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                display.text = String(M_PI)
            } else if mathSymbol == "C" {
                display.text = "0"
            }
        }
        
        
    }

}

