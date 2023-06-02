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
    
    func test_enqueue숫자값확인() {
        //given
        let firstInput = 1
        
        //when
        sut.enqueue(item: firstInput)
        let result = sut.dequeueItem()
        
        //then
        XCTAssertEqual(result, firstInput)
    }
    
    func test_enqueuelast_확인() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        let result = sut.lastItem
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_enqueueCount_확인() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        let result = sut.countItem
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_enqueueCount_2개확인() {
        //given
        let input = 1
        let secondInput = 2
        
        //when
        sut.enqueue(item: input)
        sut.enqueue(item: secondInput)
        let result = sut.countItem
        
        XCTAssertEqual(secondInput, result)
    }
    
    func test_enqueue숫자값다중확인() {
        //given
        let firstInput = 1
        let secondInput = 2
        let thirdInput = 3
        
        //when
        sut.enqueue(item: firstInput)
        sut.enqueue(item: secondInput)
        sut.enqueue(item: thirdInput)
        
        let firsResult = sut.dequeueItem()
        let secondResult = sut.dequeueItem()
        let thirdResult = sut.dequeueItem()
        
        //then
        XCTAssertEqual(firsResult, firstInput)
        XCTAssertEqual(secondResult, secondInput)
        XCTAssertEqual(thirdResult, thirdInput)
    }
}
