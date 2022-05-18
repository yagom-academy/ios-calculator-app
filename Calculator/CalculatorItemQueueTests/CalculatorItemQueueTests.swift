//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 재재 on 2022/05/18.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>?
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_1을_enqueue하면_1이_있다() {
        //given
        sut?.enqueue(1)
        
        //when
        let enqueueData = sut?.peek
        
        //then
        XCTAssertEqual(1, enqueueData)
    }
    
    func test_0을_enqueue하면_0이_있다() {
        //given
        let input = 0
        let expectation = 0
        //When
        sut?.enqueue(input)
        let result = sut?.peek
        //Then
        XCTAssertEqual(expectation, result)
        
    }
    
    func test_5를_넣으면_queue가_비어있지_않다() {
        //given
        let input = 5
        let expectation: Bool = false
        //when
        sut?.enqueue(input)
        let result = sut?.isEmpty
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_1과3을_넣으면_count가_2다() {
        //given
        let firstInput = 1
        let secondInput = 2
        let expectation: Int = 2
        //when
        sut?.enqueue(firstInput)
        sut?.enqueue(secondInput)
        let result = sut?.count
        //then
        XCTAssertEqual(expectation, result)
        
    }
    
    func test_5와_3_4_를_큐에넣고_peek를_한_값은_5다() {
        //given
        let firstInput = 5
        let secondInput = 3
        let thirdInput = 4
        let expectation: Int = 5
        //when
        sut?.enqueue(firstInput)
        sut?.enqueue(secondInput)
        sut?.enqueue(thirdInput)
        let result = sut?.peek
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_2와_7_9_를_넣고_dequeue를_1번한_값은_2이고_2번한_값은_7다() {
        //given
        let firstInput = 2
        let secondInput = 7
        let thirdInput = 9
        let firstExpectation: Int = 2
        let secondExpectation: Int = 7
        //when
        sut?.enqueue(firstInput)
        sut?.enqueue(secondInput)
        sut?.enqueue(thirdInput)
        let firstResult = sut?.dequeue()
        let secondResult = sut?.dequeue()
        //then
        XCTAssertEqual(firstExpectation, firstResult!)
        XCTAssertEqual(secondResult, secondExpectation)
    }
}
