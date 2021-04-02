//
//  MaximumDigitLimitable.swift
//  Calculator
//
//  Created by ysp on 2021/04/02.
//

import Foundation

protocol MaximumDigitLimitable {
    associatedtype T: Numeric
    var maximumDigit: T { get set }
}
