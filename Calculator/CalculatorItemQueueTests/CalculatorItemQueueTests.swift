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
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    func test_배열이비어있을때_true를반환한다() {
        sut.input = []
        sut.output = []
        let expectation = true
        
        let result = sut.isEmpty
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_를실행하면_input배열에값이입력된다() {
        let input = "1"
        let expectation = ["1"]
        
        let _ = sut.enqueue(input)
        let inputArray = sut.input
        
        XCTAssertEqual(inputArray, expectation)
    }
    
    func test_dequeue_를실행하면_output에값이있으면_output의_마지막값을_반환한다() {
        sut.output = ["1"]
        let result = sut.dequeue()
        let expectation = "1"
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_를실행하면_ouput에값이없으면_nil을반환한다() {
        sut.output = []
        let result = sut.dequeue()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_dequeue_output에값이없으면_input을reversed해서_output에넣어준다() {
        sut.output = []
        sut.input = ["1"]
        let _ = sut.dequeue()
        let result = sut.output
        let expectation = sut.input.reversed() as [String]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_output에값이없으면_input을reversed해서넣어주고_마지막값을제거한다() {
        sut.output = []
        sut.input = ["1", "2"]
        let _ = sut.dequeue()
        let result = sut.output
        let expectation = ["2"]
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_실행시_output가빈배열이라면_기존의input의값을제거한다() {
        sut.output = []
        sut.input = ["1", "2", "="]
        let _ = sut.dequeue()
        let result = sut.input
        
        XCTAssertEqual(result, [])
    }

    func test_peek_output이빈배열일때_input의첫번째를반환한다() {
        sut.output = []
        sut.input = ["1", "2", "="]
        let expectation = "1"
        let result = sut.peek
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek_output에값이있다면_output의마지막을반환한다() {
        sut.output = ["=", "2"]
        sut.input = ["3"]
        
        let expectation = "2"
        let result = sut.peek
        
        XCTAssertEqual(result, expectation)
    }
}
