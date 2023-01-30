//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by kimseongjun on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_dequeueStack이_비어져있을때_isEmpty프로퍼티가_true를반환한다() {
        //given
        let expectedValue = true
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueueStack이_비어져있을때_isEmpty프로퍼티가_true를반환한다() {
        //given
        let expectedValue = true
        
        //when
        let result = sut.isEmpty
    
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueue실행시_enqueueStack에_3개의값이_넣어진다() {
        //given
        let input = ["3", "+", "4"]
        let expectedValue = ["3", "+", "4"]
        
        //when
        for value in input {
            sut.enqueue(item: value)
        }
        let result = sut.enqueueStack
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeueStack이_비어있을때_enqueueStack의reversed값을_가져온다() {
        //given
        let input = ["3", "+", "4"]
        let expectedValue = ["4", "+"]
        
        //when
        for value in input {
            sut.enqueue(item: value)
        }
        sut.dequeue()
        let result = sut.dequeueStack
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeueStack이_비어있을때_enqueueStack값을_비운다() {
        //given
        let input = ["3", "+", "4"]
        let expectedValue = [String]()
        
        //when
        for value in input {
            sut.enqueue(item: value)
        }
        sut.dequeue()
        let result = sut.enqueueStack
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeueStack이_마지막값을_반환한다() {
        //given
        
        let input = ["3", "+", "4"]
        let expectedValue = "3"
        
        //when
        for value in input {
            sut.enqueue(item: value)
        }
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
}
