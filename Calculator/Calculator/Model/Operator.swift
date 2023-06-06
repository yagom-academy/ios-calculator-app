//
//  Operator.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

enum Operator: Character, CaseIterable {
	case add = "+"
	case subtract = "-"
	case divide = "/"
	case multiply = "*"
}

extension Operator {
	func calculate(lhs: Double, rhs: Double) -> Double {
		return 0.0
	}
	
	private func add(lhs: Double, rhs: Double) -> Double {
		return lhs + rhs
	}
	
	private func subtract(lhs: Double, rhs: Double) -> Double {
		return lhs - rhs
	}
	
	private func divide(lhs: Double, rhs: Double) -> Double {
		return lhs / rhs
	}
	
	private func multiply(lhs: Double, rhs: Double) -> Double {
		return lhs * rhs
	}
}
