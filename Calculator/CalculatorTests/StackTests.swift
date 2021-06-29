//
//  StackTests.swift
//  CalculatorTests
//
//  Created by yun on 2021/06/29.
//

import Foundation

import XCTest
@testable import Calculator

class StackTests: XCTestCase {
    var sut = Stack<Double>()
    
    override func setUp() {
        sut = Stack<Double>()
    }
    
    func test_푸시했을때_스택에_잘_들어가는가() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let result = sut.peek()
        let expectedResult = testCase
        let failedResult: Double = 2
        
        //then
        XCTAssertEqual(expectedResult, result)
        XCTAssertNotEqual(failedResult, result)
    }
    
    func test_빈스택에_팝했을경우_에러가_던져지는가() {
        //when
        let result = sut.pop()
        let expectedResult: Double? = nil
        let failedResult: Double? = 1
        
        //then
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_스택에_팝했을경우_top이_잘_빠져나오는가() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let expectedResult: Double? = testCase
        let failedResult: Double? = nil
        let result = sut.pop()
        
        //then
        XCTAssertEqual(result, expectedResult
        )
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_스택이_비어있지_않을경우_맨위의_값이_잘_전달되는가() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let expectedResult: Double? = testCase
        let failedResult: Double? = nil
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_스택이_비어있는가() {
        //when
        let result = sut.isEmpty()
        let expectedResult = true
        let failedResult = false
        
        //then
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_빈스택이_되는가() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        sut.clear()
        let result = sut.isEmpty()
        let expectedResult = true
        let failedResult = false
        
        //then
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_스택의_길이가_잘나오는가() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        
        let result = sut.getLength()
        let expectedResult = testCases.count
        let failedResult = testCases.count+1
        
        //then
        XCTAssertEqual(result, expectedResult)
        XCTAssertNotEqual(result, failedResult)
    }
}
