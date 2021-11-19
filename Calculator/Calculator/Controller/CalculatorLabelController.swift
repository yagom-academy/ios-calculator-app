//
//  CalculatorLabelController.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import Foundation

class CurrentLabelValue {
    
    var operand: String
    var `operator`: String
    
    static var shared: CurrentLabelValue = {
        let instance = CurrentLabelValue()
        
        return instance
    }()
    
    private init() {
        operand = ""
        `operator` = ""
    }
}
