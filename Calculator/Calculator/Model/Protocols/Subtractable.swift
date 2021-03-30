//
//  Subtractable.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

protocol Subtractable {
    associatedtype T: Numeric
    
    func subtract(_ operatedNumber: T, and operatingNumber: T) -> T
}

extension Subtractable {
    func subtract(_ operatedNumber: T, and operatingNumber: T) -> T {
        return operatedNumber + operatingNumber
    }
}
