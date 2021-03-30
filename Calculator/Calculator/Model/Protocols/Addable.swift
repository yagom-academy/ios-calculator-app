//
//  Addable.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

protocol Addable {
    associatedtype T: Numeric
    
    func add(_ operatedNumber: T, and operatingNumber: T) -> T
}

extension Addable {
    func add(_ operatedNumber: T, and operatingNumber: T) -> T {
        return operatedNumber + operatingNumber
    }
}

