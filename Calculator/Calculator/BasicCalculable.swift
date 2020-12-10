//
//  BasicCalculable.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

protocol BasicCalculable {
    func add(first: String, second: String) throws -> String
    func subtract(first: String, second: String) throws -> String
    func clear()
}
