//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by TORI on 2021/03/30.
//

import Foundation

// enum BinaryOperator: String{
//     case add = "+"
//     case subtract = "-"
//     case and = "&"
//     case nand = "~&"
//     case or = "|"
//     case nor = "~|"
//     case xor = "^"
//     case not = "~"
//     case leftShift = "<<"
//     case rightShift = ">>"
// }

class BinaryCalculator {
    
    
    // var operators = Stack<BinaryOperator>() 
    // var operands = Stack<String>()
    var firstNumber: String = "" 
    var secondNumber: String = ""
    var tempNumber = ""
    var screenNumber = "0"
    var lastOperator = ""
    
    func binaryToInt(inputText: String) -> UInt8 {
        if let binary = UInt8(inputText, radix: 2) {
            return binary
        } else {
            return UInt8(inputText)!
        }
    }
    
    func intToBinary(inputInt: UInt8) -> String {
        return String(inputInt, radix: 2)
    }
    
    func addCalculate(_ firstNumber: UInt8, _ secondNum: UInt8) -> UInt8 {
        return firstNumber + secondNum
    }
    
    func substractCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return firstNumber - secondNumber
    }
    
    func andCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return firstNumber & secondNumber
    }
    
    func orCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return firstNumber | secondNumber
    }
    
    func notCalculate(_ firstNumber: UInt8) -> UInt8 {
        return ~firstNumber
    }
    
    func xorCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return (firstNumber ^ secondNumber)
    }
    
    func nandCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return ~(firstNumber & secondNumber)
    }
    
    func norCalculate(_ firstNumber: UInt8, _ secondNumber: UInt8) -> UInt8 {
        return ~(firstNumber | secondNumber)
    }
    
    func leftShiftCalculate(_ number: UInt8) -> UInt8 {
        return number << 1 
    }
    
    func rightShiftCalculate(_ number: UInt8) -> UInt8 {
        return number >> 1 
    }

    func receiveInput(buttonType: String) {
        if (buttonType == "0" || buttonType == "1") {
            tempNumber += buttonType
            return
        }
        
//        switch self {
//            case "+", "-", "&", "~&", "|", "~|", "^", "~", "<<", ">>"
//                if firstNumber == "" {
//                    firstNumber = tempNumber
//                } else {
//                    secondNumber = tempNumber
//                }
//                lastOperator = buttonType
//        }
        
//        if buttonType == "=" {
//
//        }

        // switch buttonType {
        // case "+":
        //     lastOperator = "+"
        //     // if secondNumber == nil {
        //     //     return
        //     // } else if secondNumber != nil {
        //     // let intFirstNumber = binaryToInt(firstNumber)
        //     // let intSecondNumber = binaryToInt(secondNumber)
        //     // let calcResult = addCalculate(intFirstNumber, intSecondNumber)
        //     // let result = intToBinary(calcResult)
        //     // tempNumber = result
        //     // }
        // case "-":
        //     lastOperator = "-"
        // case "&":
        // case "~&":
        // case "|":
        // case "~|":
        // case "^":
            
        // case "~":
        //     // firstnum 연산
        // case "<<":
        //     // firstnum 연산
        // case ">>":
        //     // firstnum 연산
        
        // case "=":
        //     print(result)
        // }
    }
}
