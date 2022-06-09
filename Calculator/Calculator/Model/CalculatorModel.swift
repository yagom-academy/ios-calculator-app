//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 허건 on 2022/06/08.
//

import Foundation
import UIKit

struct CalculatorModel {
    
    var inputValue = ""
    var presentValue = ""
    var presentOperator = ""
    var operatorStorage: [String] = []
    var beforePresentValueStore: [String] = []
    var userIsInTheAfterTabAnswerButton = false
    var userIsInTheMiddleOfTyping = false
    
    mutating func addOperand(to buttonTitle: String) -> String {
        if presentValue.contains(".") && buttonTitle == "." {
            return presentValue
        }
        
        if userIsInTheMiddleOfTyping {
            inputValue += presentValue
            inputValue += " \(operatorStorage.removeLast()) "
            
            presentValue = ""
            operatorStorage = []
            
            presentValue += buttonTitle
            return buttonTitle
        }
        presentValue += buttonTitle
        userIsInTheMiddleOfTyping = false
        return presentValue
    }
    
    mutating func addOperatorStorage(to buttonTitle: String) -> String {
        if userIsInTheMiddleOfTyping {
            presentOperator = buttonTitle
            
            operatorStorage.append(" \(buttonTitle) ")
            return presentOperator
        }
        
        presentOperator = buttonTitle
        operatorStorage.append(" \(buttonTitle) ")
        
        userIsInTheMiddleOfTyping = true
        userIsInTheAfterTabAnswerButton = false
        return presentOperator
    }
    
    mutating func checkHyphen(to presentValue: String) -> String {
        var checkHypenWord = presentValue
        
        if checkHypenWord.contains("-") {
            let filterHypenWord = filterHypen(to: checkHypenWord)
            return filterHypenWord
        }
        checkHypenWord = "-" + presentValue
        return checkHypenWord
    }
    
    private mutating func filterHypen(to checkHypenWord: String) -> String {
        var filterHypenWord = checkHypenWord
        
        filterHypenWord = filterHypenWord.filter { (word: Character) in
            if word == "-" {
                return false
            }
            return true
        }
        return filterHypenWord
    }
}
