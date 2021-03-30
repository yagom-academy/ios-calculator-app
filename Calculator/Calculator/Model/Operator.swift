//
//  Operator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/25.
//

protocol Operator: CalculatingElement, CaseIterable {
    init?(rawValue: String)
}
