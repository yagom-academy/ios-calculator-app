//
//  TypeConvertible.swift
//  Calculator
//
//  Created by ysp on 2021/03/30.
//

import Foundation

protocol TypeConvertible {
    associatedtype T
    
    func inputAndConvertType() -> T
}
