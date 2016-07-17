//
//  ViewController.swift
//  Calculator
//
//  Created by Vincent Tran on 7/11/16.
//  Copyright © 2016 Vincent Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var inMiddleOfTyping = false
    
    @IBOutlet private weak var display: UILabel!
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if inMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        inMiddleOfTyping = true
        
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
        
    }
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(sender: UIButton) {
        
        if inMiddleOfTyping {
            brain.setOperand(displayValue)
            inMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(mathSymbol)
        }
        displayValue = brain.result
        
        
    }
    
}

