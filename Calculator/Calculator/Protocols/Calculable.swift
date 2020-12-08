//
//  Calculable.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

protocol BasicCalculable {
    func add()
    func subtract()
    func multiply()
    func clear()
}

protocol DecimalCalculable: BasicCalculable {
    func divide()
}

protocol BinaryCalculable: BasicCalculable {
    func and()
    func or()
    func xor()
    func nor()
    func not()
    func nand()
    func shift()
}
