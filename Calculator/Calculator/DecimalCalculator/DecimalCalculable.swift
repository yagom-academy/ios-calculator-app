//
//  DecimalCalculable.swift
//  Calculator
//
//  Created by Yeon on 2020/12/09.
//

protocol DecimalCalculable {
    func multiply(first: String, second: String) throws -> String
    func divide(first: String, second: String) throws -> String
}
