//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 재재, Kay on 2022/05/18.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_returnsNumberWhatUserEnqueue() {
        //given
        let expectation: Double = 1.0
        
        //when
        sut?.enqueue(1.0)
        
        //then
        XCTAssertEqual(expectation, 1.0)
    }
    
    func test_returnsTotalNumberOfElement() {
        //given
        sut?.enqueue(1.0)
        let secondInput = 7.0
        let expectation: Int = 2
        
        //When
        sut?.enqueue(secondInput)
        let result = sut?.count
        
        //Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_emptyWhenQueueDoesNotHaveAnElement() {
        //given
        let input = 5.0
        let expectation: Bool = false
        
        //when
        sut?.enqueue(input)
        let result = sut?.isEmpty
        
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_returnsNumberInOrderWhenDequeue() {
        //given
        let firstInput = 2.0
        let secondInput = 7.0
        let thirdInput = 9.0
        let firstExpectation: Double = 2.0
        let secondExpectation: Double = 7.0
        
        //when
        sut?.enqueue(firstInput)
        sut?.enqueue(secondInput)
        sut?.enqueue(thirdInput)
        let firstResult = sut?.dequeue()
        let secondResult = sut?.dequeue()
        
        //then
        XCTAssertEqual(firstExpectation, firstResult)
        XCTAssertEqual(secondExpectation, secondResult)
    }
    
    func test_returnsNillWhenQueueIsEmpty() {
        //given
        let expectation: Double? = nil
        
        //when
        let result = sut?.dequeue()
        
        //then
        XCTAssertEqual(expectation, result)
    }
}
