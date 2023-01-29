//
//  ExtentionForTest.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/26.
//
@testable import Calculator

extension Node: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}

extension String: CalculateItem {}

