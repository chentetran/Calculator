//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Vincent Tran on 7/16/16.
//  Copyright © 2016 Vincent Tran. All rights reserved.
//

import Foundation

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "sin": Operation.UnaryOperation(sin),
        "C": Operation.Constant(0.0),
        "×": Operation.BinaryOperation(multiply),
        "=": Operation.Equals
        
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let calculate):
                accumulator = calculate(accumulator)
            case .BinaryOperation(let calculate):
                pending = PendingBinaryOperationInfo(binaryFunction: calculate, firstOperand: accumulator)
                
                
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
        pending = nil
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    // Read-only; cannot be set
    var result: Double {
        get {
            return accumulator
        }
    }
}
