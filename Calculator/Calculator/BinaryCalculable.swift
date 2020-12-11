//
//  BinaryCalculable.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/10.
//

import Foundation

protocol BinaryCalculable {
    func and() throws -> String
    func or() throws -> String
    func xor() throws -> String
    func nor() throws -> String
    func not() throws -> String
    func nand() throws -> String
    func leftShift() throws -> String
    func rightShift() throws -> String
}
