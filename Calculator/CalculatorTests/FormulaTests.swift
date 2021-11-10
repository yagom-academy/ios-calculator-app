//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/10.
//

import XCTest

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) } + [String(target)]
    }
}

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .divide:
            return didvde(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    
    private func didvde(lhs: Double, rhs: Double) -> Double {
        if rhs == .zero {
            return .nan
        }
        return lhs / rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        lhs * rhs
    }
}

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    mutating func result() -> Double {
        guard operands.count > 1, operands.front != nil else {
            operators.clear()
            operands.clear()
            return 0.0
        }
        var result: Double = 0
        do {
            result = try firstToCalculate()
        } catch let error as CalculatorError {
            print(error.description)
        } catch {
            print(error.localizedDescription)
        }

        return result
    }
    
    private mutating func firstToCalculate() throws -> Double {
        let element = try operators.dequeue()
        guard let `operator` = Operator(rawValue: element) else {
            throw CalculatorError.wrongOperator
        }
        let lhs = try operands.dequeue()
        let rhs = try operands.dequeue()
        return `operator`.calculate(lhs: lhs, rhs: rhs)
    }
}

class FormulaTests: XCTestCase {

    func test_더하기연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("+")
        let result = formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
}
