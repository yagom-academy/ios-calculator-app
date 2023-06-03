//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hemg on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemLinkedList<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_dnqueue숫자확인() {
        //given
        let input = 1
        sut.enqueue(item: input)
        
        //when
        let result = sut.dequeueItem()
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_enqueuelast숫자확인() {
        //given
        let input = 1
        sut.enqueue(item: input)
        
        //when
        let result = sut.lastItem
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_enqueueCount_확인() {
        //given
        let input = 1
        sut.enqueue(item: input)
        
        //when
        let result = sut.countItem
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_enqueueCount_2개확인() {
        //given
        let input = 1
        let secondInput = 2
        sut.enqueue(item: input)
        sut.enqueue(item: secondInput)
        
        //when
        let result = sut.countItem
        
        //then
        XCTAssertEqual(secondInput, result)
    }
    
    func test_dequeue지워진숫자값확인() {
        //given
        let firstInput = 1
        let secondInput = 2
        let thirdInput = 3
        sut.enqueue(item: firstInput)
        sut.enqueue(item: secondInput)
        sut.enqueue(item: thirdInput)
        
        //when
        let firsResult = sut.dequeueItem()
        let secondResult = sut.dequeueItem()
        let thirdResult = sut.dequeueItem()
        
        //then
        XCTAssertEqual(firsResult, firstInput)
        XCTAssertEqual(secondResult, secondInput)
        XCTAssertEqual(thirdResult, thirdInput)
    }
}
