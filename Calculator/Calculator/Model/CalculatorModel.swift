//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 허건 on 2022/06/08.
//

import Foundation

struct CalculatorModel {
    
    mutating func checkHyphen(to presentValue: String) -> String {
        var checkHypenWord = presentValue
        if checkHypenWord.contains("-") {
            let filterHypenWord = filterHypen(to: checkHypenWord)
            return filterHypenWord
        }
        checkHypenWord = "-" + presentValue
        return checkHypenWord
    }
    
    private mutating func filterHypen(to checkHypenWord: String) -> String{
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
