//
//  CalculationMethodSwitchable.swift
//  Calculator
//
//  Created by Ryan-Son on 2021/03/30.
//

import Foundation

protocol CalculationMethodSwitchable {
    associatedtype T: Numeric
    
    func switchCalculationMethod(to operator: T)
}
