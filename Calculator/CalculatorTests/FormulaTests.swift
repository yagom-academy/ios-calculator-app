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
        guard operands.isEmpty == false else {
            return result
        }
        repeat {
            do {
                result = try calculateFromThrSecond(lhs: result)
            } catch let error as CalculatorError {
                print(error.description)
            } catch {
                print(error.localizedDescription)
            }
        } while operands.isEmpty == false
        if operators.isEmpty == false {
            operators.clear()
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
    
    private mutating func calculateFromThrSecond(lhs: Double) throws -> Double {
        let element = try operators.dequeue()
        guard let `operator` = Operator(rawValue: element) else {
            throw CalculatorError.wrongOperator
        }
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
    
    func test_더하기연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("+")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("+")
        let result = formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_더하기연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("+")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("+")
        formula.operands.enqueue(2.0)
        let result = formula.result()
        
        XCTAssertEqual(result, 6.0)
    }
    
    func test_빼기연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("-")
        let result = formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_빼기연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("-")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("-")
        let result = formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_빼기연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("-")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("-")
        formula.operands.enqueue(2.0)
        let result = formula.result()
        
        XCTAssertEqual(result, -2.0)
    }
    
    func test_곱셈연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("*")
        let result = formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_곱셈연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("*")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("*")
        let result = formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_곱셈연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("*")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("*")
        formula.operands.enqueue(2.0)
        let result = formula.result()
        
        XCTAssertEqual(result, 8.0)
    }
    
    func test_나눗셈연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        let result = formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_나눗셈연산해보기_피연산자두개_연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        let result = formula.result()
        
        XCTAssertEqual(result, 1.0)
    }
    
    func test_나눗셈연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        formula.operands.enqueue(2.0)
        let result = formula.result()
        
        XCTAssertEqual(result, 0.5)
    }
    
    func test_나눗셈연산해보기_0을나눌때() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue("/")
        formula.operands.enqueue(0)
        let result = formula.result()
        
        XCTAssertTrue(result.isNaN)
    }
}
