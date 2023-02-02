//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/24.
//

import Foundation

protocol CalculateItem { }

extension Double: CalculateItem { }

extension Operator: CalculateItem { }
