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
    
    func test_enqueue_55_enqueue시_count가_1인지_확인() {
        //given
        let expectationCount = 1
        
        //when
        sut.enqueue(item: 55)
        
        //then
        XCTAssertEqual(sut.count, expectationCount)
    }
    
    func test_enqueue_11_enqueue의_마지막값이11인지_확인() {
        //given
        let input = 11
        
        //when
        sut.enqueue(item: input)
        
        //then
        XCTAssertEqual(input, sut.lastItem)
    }
    
    func test_enqueue_1_입력후count갯수가_1인지확인() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        
        //then
        XCTAssertEqual(sut.count, 1)
    }
        
    func test_enqueue이후_dequeue하여_값이비어있는지확인() {
        //given
        let input = 1
        
        //when
        sut.enqueue(item: input)
        _ = sut.dequeueItem()
        
        //then
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_enqueue_2번_이후_2개의값_입력되었는지확인() {
        //given
        let input = 1
        let secondInput = 22
    
        //when
        sut.enqueue(item: input)
        sut.enqueue(item: secondInput)
        
        //then
        XCTAssertEqual(2, sut.count)
    }
    
    func test_enqueue_3번_이후_3개의값_입력되었는지확인() {
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
    
    func test_enqueue값_dequeue에서지워지는_숫자가같은지확인() {
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
