//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/24.
//

import Foundation

protocol CalculatorItem { }

extension Double: CalculatorItem { }

extension Operator: CalculatorItem { }
