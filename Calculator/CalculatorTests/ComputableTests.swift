//
//  ComputableTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/06/29.
//

import XCTest
import Foundation
@testable import Calculator


class ComputableTests: XCTestCase {
    
    func test_연산자우선순위_잘비교되는가() {
        let sut = Operator.plus
        
        // given
        let testcase1 = Operator.divide
        let testcase2 = Operator.minus
        let testcase3 = Operator.multiply
        let testcase4 = Operator.plus
        
        // when
        let testReuslt1 = sut.isLowerPriority(than: testcase1)
        let testReuslt2 = sut.isLowerPriority(than: testcase2)
        let testReuslt3 = sut.isLowerPriority(than: testcase3)
        let testReuslt4 = sut.isLowerPriority(than: testcase4)
        
        //then
        XCTAssertEqual(testReuslt1, true)
        XCTAssertEqual(testReuslt2, true)
        XCTAssertEqual(testReuslt3, true)
        XCTAssertEqual(testReuslt4, true)
    }
    
    func test_피연산자_더하기연산_잘되는가() {
        let sut = Operand(operand: 1)
        
        //given
        let testcase = Operand(operand: 3)
        
        //when
        let result = sut.plus(with: testcase)
        let expectedResult: Double = 4
        let failedResult: Double = 2
        
        //then
        XCTAssertEqual(result,expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_피연산자_뺄셈연산_잘되는가() {
        
        let sut = Operand(operand: 7)
        
        //given
        let testcase = Operand(operand: 2)
        
        //when
        let result = sut.minus(with: testcase)
        let expectedResult: Double = 5
        let failedResult: Double = 2
        
        //then
        XCTAssertEqual(result,expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_피연산자_곱셈연산_잘되는가() {
        let sut = Operand(operand: 4)
        
        //given
        let testcase = Operand(operand: 6)
        
        //when
        let result = sut.multiple(with: testcase)
        let expectedResult: Double = 24
        let failedResult: Double = 2
        
        //then
        XCTAssertEqual(result,expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_피연산자_나눗셈연산_잘되는가() {
        do {
            let sut = Operand(operand: 6)
            
            //given
            let testcase = Operand(operand: 3)
            
            //when
            let result = try sut.divide(by: testcase)
            let expectedResult: Double = 2
            let failedResult: Double = 3
            
            //then
            XCTAssertEqual(result,expectedResult)
            XCTAssertNotEqual(result, failedResult)
        } catch {
            print("에러발생")
        }
    }
}
