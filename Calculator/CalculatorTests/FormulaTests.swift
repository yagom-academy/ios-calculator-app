//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/10.
//

import XCTest

class FormulaTests: XCTestCase {

    func test_더하기연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)

        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_더하기연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_더하기연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 6.0)
    }
    
    func test_빼기연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_빼기연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_빼기연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, -2.0)
    }
    
    func test_곱셈연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_곱셈연산해보기_피연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_곱셈연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 8.0)
    }
    
    func test_나눗셈연산해보기_피연산자한개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_나눗셈연산해보기_피연산자두개_연산자두개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 1.0)
    }
    
    func test_나눗셈연산해보기_피연산자세개() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.5)
    }
    
    func test_나눗셈연산해보기_0을나눌때() {
        var formula = Formula()
        
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(0)
        do {
            let result = try formula.result()
            
            XCTAssertTrue(result.isNaN)
        } catch {
            print("error")
        }
        
    }
}
