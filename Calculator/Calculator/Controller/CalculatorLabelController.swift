//
//  CalculatorLabelController.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import Foundation

class CurrentLabelValue {
    
    // MARK: static property
    
    static var shared: CurrentLabelValue = {
        let instance = CurrentLabelValue()
        
        return instance
    }()
    
    // MARK: instance property
    
    var operand: String
    var `operator`: String
    
    // MARK: init 
    
    private init() {
        operand = ""
        `operator` = ""
    }
}
