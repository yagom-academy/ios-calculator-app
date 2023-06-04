//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by Hemg on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_dnqueue숫자확인() {
        //given
        let input = 11
        
        //when
        sut.enqueue(item: input)
        
        //then
        let result = sut.dequeueItem()
        XCTAssertEqual(result, input)
    }
    
    func test_enqueuelast숫자확인() {
        //given
        let input = 11
        
        //when
        sut.enqueue(item: input)
        
        //then
        XCTAssertEqual(input, sut.lastItem)
    }
    
    func test_queueCount_확인() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        
        //then
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_queueCount초기값() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        
        //then
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_queueCount_0개() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        _ = sut.dequeueItem()
        
        //then
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_queueCount_2개확인() {
        //given
        let input = 1
        let secondInput = 22
    
        //when
        sut.enqueue(item: input)
        sut.enqueue(item: secondInput)
        
        //then
        XCTAssertEqual(2, sut.count)
    }
    
    func test_enqueueCount_3개확인() {
        //given
        let input = 1
        let secondInput = 2
        let thirdInput = 5
       
        //when
        sut.enqueue(item: input)
        sut.enqueue(item: secondInput)
        sut.enqueue(item: thirdInput)
        
        //then
        XCTAssertEqual(3, sut.count)
    }
    
    func test_dequeue지워진숫자값확인() {
        //given
        let firstInput = 11
        let secondInput = 21
        let thirdInput = 31
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
