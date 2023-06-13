//
//  MockOperator.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

extension MockOperator: CalculateItem { }

enum MockOperator: Character, CaseIterable {
	case add = "+"
	case subtract = "-"
	case divide = "/"
	case multiply = "*"
}

extension MockOperator {
	func calculate(lhs: Double, rhs: Double) -> Double {
		var operatorsCalculateResult: Double {
			switch self {
			case .add:
				return add(lhs: lhs, rhs: rhs)
			case .subtract:
				return subtract(lhs: lhs, rhs: rhs)
			case .divide:
				return divide(lhs: lhs, rhs: rhs)
			case .multiply:
				return multiply(lhs: lhs, rhs: rhs)
			}
		}
		return operatorsCalculateResult
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
