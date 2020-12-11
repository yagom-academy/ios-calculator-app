//
//  File.swift
//  Calculator
//
//  Created by Yeon on 2020/12/09.
//

protocol BinaryCalculable {
    func and(first: String, second: String) throws -> String
    func or(first: String, second: String) throws -> String
    func xor(first: String, second: String) throws -> String
    func nor(first: String, second: String) throws -> String
    func not(first: String) throws -> String
    func nand(first: String, second: String) throws -> String
    func rightShift(first: String) throws -> String
    func leftShift(first: String) throws -> String
}
