//
//  CalculateItem.swift
//  Calculator
//
//  Created by 장영우 on 2021/11/08.
//

import Foundation

protocol CalculateItem {
    var value: Double { get }
    func calculate(originalValue: Double) -> Double
}

struct Adder: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue + self.value
    }
}

struct Subtractor: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue - self.value
    }
}

struct Multiplier: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue * self.value
    }
}

struct Divider: CalculateItem {
    let value: Double
    func calculate(originalValue: Double) -> Double {
        return originalValue / self.value
    }
}
