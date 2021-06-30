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
    
    func test_Double타입의_1이_준비되어_push메소드에_1을_전달하고_스택의_맨위의_값을_확인했을때_1이_확인된다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let result = sut.peek()
        let expectedResult = testCase
        
        //then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_Double타입의_1이_준비되어_push메소드에_1을_전달하고_스택의_맨위의_값을_확인했을때_2는_아니다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let result = sut.peek()
        let failedResult: Double = 2
        
        //then
        XCTAssertNotEqual(failedResult, result)
    }
    
    func test_빈스택에_팝했을경우_nil이_된다() {
        //when
        let result = sut.pop()
        let expectedResult: Double? = nil
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_빈스택에_팝했을경우_1은_확인되지_않는다() {
        //when
        let result = sut.pop()
        let failedResult: Double? = 1
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_Double타입의_1이_준비되어_스택에_넣은후_pop메소드를_호출했을경우_1이_반환된다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let expectedResult: Double? = testCase
        let result = sut.pop()
        
        //then
        XCTAssertEqual(result, expectedResult)

    }
    
    func test_Double타입의_1이_준비되어_스택에_넣은후_pop메소드를_호출했을경우_nil은_아니다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let failedResult: Double? = nil
        let result = sut.pop()
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_Double타입의_1이_준비되어_스택에_넣은후_peek메소드를_호출하면_1이_확인된다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let expectedResult: Double? = testCase
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_Double타입의_1이_준비되어_스택에_넣은후_peek메소드를_호출하면_nil은_아니다() {
        //given
        let testCase: Double = 1
        
        //when
        sut.push(object: testCase)
        let failedResult: Double? = nil
        let result = sut.peek()
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_스택에_아무것도_넣지않고_isEmpty메소드를_호출하면_true이다() {
        //when
        let result = sut.isEmpty()
        let expectedResult = true
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_스택에_아무것도_넣지않고_isEmpty메소드를_호출하면_false는_아니다() {
        //when
        let result = sut.isEmpty()
        let failedResult = false
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_1과_2와_3이_담긴_배열을_순회하며_스택에_푸쉬한후_clear메소드를_호출하고_스택이_비어있는지_확인하면_true가_나온다() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        sut.clear()
        let result = sut.isEmpty()
        let expectedResult = true
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_1과_2와_3이_담긴_배열을_순회하며_스택에_푸쉬한후_clear메소드를_호출하고_스택이_비어있는지_확인하면_false는_아니다() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        sut.clear()
        let result = sut.isEmpty()
        let failedResult = false
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_1과_2와_3이_담긴_배열을_순회하며_스택에_푸쉬한후_getLength메소드를_호출하면_3이_나온다() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        
        let result = sut.getLength()
        let expectedResult = testCases.count
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_1과_2와_3이_담긴_배열을_순회하며_스택에_푸쉬한후_getLength메소드를_호출하면_4는_아니다() {
        //given
        let testCases: Array<Double> = [1, 2, 3]
        
        //when
        for testCase in testCases {
            sut.push(object: testCase)
        }
        
        let result = sut.getLength()
        let failedResult = testCases.count+1
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
}
