//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/06/25.
//

import XCTest
import Foundation
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    let sut: Calculator = Calculator()
    
    override func setUpWithError() throws {
        
    }
    
    func test_덧셈_연산은_잘되는가()  {
        // given
        let testcase = ["1","+","2","+","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 6
        let failedResult: Double = 5
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
        XCTAssertNotEqual(result, .success(failedResult))
    }
    
    func test_곱셈_연산은_잘되는가() {
        // given
        let testcase = ["1","*","2","*","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 6
        let failedResult: Double = 5
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
        XCTAssertNotEqual(result, .success(failedResult))
    }

    func test_뺄셈_연산은_잘되는가() {
        // given
        let testcase = ["1","-","2","-","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = -4
        let failedResult: Double = 5
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
        XCTAssertNotEqual(result, .success(failedResult))
    }

    func test_나눗셈_연산은_잘되는가() {
        // given
        let testcase = ["1","/","2","/","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        
        guard case .success(let unwrappedResult) = result else {
            return
        }
        
        let rounedResult = round(unwrappedResult*100000)/100000
        let expectedResult: Double = 0.16667
        let failedResult: Double = 0.16666
        
        // then
        XCTAssertEqual(rounedResult, expectedResult)
        XCTAssertNotEqual(rounedResult, failedResult)
    }

    func test_사칙연산은_잘되는가() {
        // given
        let testcase = ["1","*","3","+","2","/","2"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 4
        let failedResult: Double = 5
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
        XCTAssertNotEqual(result, .success(failedResult))
    }

    func test_0으로_나누었을때_에러가_발생하는가() {
        // given
        let testcase = ["1","*","3","+","2","/","0"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult = CalculatorError.dividedByZero
        let failedResult = CalculatorError.unknownError
        
        // then
        XCTAssertEqual(result, .failure(expectedResult))
        XCTAssertNotEqual(result, .failure(failedResult))
        
    }

    func test_소수점_사칙연산은_잘되는가() {
        // given
        let testcase = ["10.1","+","12.5","/","125","+","8","-","100","*","13.8"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = -1361.8
        let failedResult: Double = -1361.9
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
        XCTAssertNotEqual(result, .success(failedResult))
    }
}
