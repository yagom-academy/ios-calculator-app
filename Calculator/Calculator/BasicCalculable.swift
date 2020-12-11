//
//  BasicCalculable.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/08.
//

import Foundation

protocol BasicCalculable {
    func add() throws -> String
    func subtract() throws -> String
    func clear() 
}
