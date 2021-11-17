//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/10.
//

import XCTest

class FormulaTests: XCTestCase {
    
    var formula: Formula!
    
    override func setUpWithError() throws {
        formula = Formula()
    }
    
    override func tearDownWithError() throws {
        formula = nil
    }
    
    func test_피연산자한개뿐일때_0을반환한다() {
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertTrue(result == 0)
    }
    
    func test_연산자한개뿐일때_에러를반환한다() {
        formula.operators.enqueue(.add)
        
        do {
            let result = try formula.result()
            XCTAssertThrowsError(result)
        } catch { }
        
    }
    
    
    func test_더하기연산해보기_피연산자한개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_더하기연산해보기_피연산자두개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_더하기연산해보기_피연산자세개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 6.0)
    }
    
    func test_빼기연산해보기_피연산자한개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_빼기연산해보기_피연산자두개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_빼기연산해보기_피연산자세개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.subtract)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, -2.0)
    }
    
    func test_곱셈연산해보기_피연산자한개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_곱셈연산해보기_피연산자두개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 4.0)
    }
    
    func test_곱셈연산해보기_피연산자세개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.multiply)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 8.0)
    }
    
    func test_나눗셈연산해보기_피연산자한개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_나눗셈연산해보기_피연산자두개_연산자두개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 1.0)
    }
    
    func test_나눗셈연산해보기_피연산자세개() {
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2.0)
        let result = try? formula.result()
        
        XCTAssertEqual(result, 0.5)
    }
    
    func test_나눗셈연산해보기_0을나눌때() {
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
    
    func test_연산자가_피연산자보다2개적을때에러남() {
        formula.operands.enqueue(2)
        formula.operators.enqueue(.add)
        formula.operands.enqueue(3)
        formula.operands.enqueue(2)
        formula.operators.enqueue(.divide)
        formula.operands.enqueue(2)
        do {
            let result = try formula.result()
            XCTAssertThrowsError(result)
        } catch { }
    }
    
    func test_큐가없는데_연산하려고할때에러() {
        do {
            let result = try formula.result()
            XCTAssertThrowsError(result)
        } catch { }
    }
}
