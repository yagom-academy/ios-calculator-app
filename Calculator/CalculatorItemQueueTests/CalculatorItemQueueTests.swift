//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by jiye Yi on 2023/01/25.
//

import XCTest
@testable import Calculator
final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue(items: [], reversedItems: [])
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_input과output_둘중하나라도_빈배열이라면_true이다() {
    
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_를실행하면_input에값이입력된다() {
        //given
        let input = "3"
        
        //when
        let _ = sut.enqueue(input)
        let result = sut.items
        
        //then
        XCTAssertEqual(result, ["3"])
    }
    
    func test_dequeue_를실행했을때_output과_input이비어있다면_nil을반환한다() {
        //when
        let result = sut.dequeue()

        //then
        XCTAssertNil(result)
       
    }
    
    func test_dequeue_를실행했을때_output은비어있고_input은비어있지않을때_output은input의_첫번째값을반환한다() {
        //given
        let input = ["1", "2", "+"]
        
        //when
        for value in input {
            sut.enqueue(value)
        }
        let result = sut.dequeue()
        let expectation = "1"
        
        XCTAssertEqual(result, expectation)
    }
    
    
}
