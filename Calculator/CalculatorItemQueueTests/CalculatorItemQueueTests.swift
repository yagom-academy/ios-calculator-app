//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: enqueueUserInputData() 메서드의 Test Cases
    func test_2회_enqueueUserInputData후_userInputDataQueue의_count는_2이다() {
        // given
        sut?.enqueueUserInputData("10")
        sut?.enqueueUserInputData("20")
        let expectation = 2
        
        // when / then
        XCTAssertEqual(sut?.userInputDataCount, expectation)
    }
    
    // MARK: enqueueOperationResultQueue() 메서드의 Test Cases
    func test_2회_enqueueOperationResultQueue후_operationResultQueue의_count는_2이다() {
        // given
        sut?.enqueueOperationResultQueue(10)
        sut?.enqueueOperationResultQueue(20)
        let expectation = 2
        
        // when / then
        XCTAssertEqual(sut?.operationResultCount, expectation)
    }
    
    // MARK: dequeueUserInputData() 메서드의 Test Cases
    func test_2회_enqueueUserInputData후_1회_dequeueUserInputData후_userInputDataQueue의_count는_1이다() {
        // given
        sut?.enqueueUserInputData("10")
        sut?.enqueueUserInputData("20")
        let expectation = 1
        
        // when
        _ = sut?.dequeueUserInputData()
        
        // then
        XCTAssertEqual(sut?.userInputDataCount, expectation)
    }
    
    func test_2회_enqueueUserInputData후_3회_dequeueUserInputData후_userInputDataQueue의_count는_0이다() {
        // given
        sut?.enqueueUserInputData("10")
        sut?.enqueueUserInputData("20")
        let expectation = 0
        
        // when
        _ = sut?.dequeueUserInputData()
        _ = sut?.dequeueUserInputData()
        _ = sut?.dequeueUserInputData()
        
        // then
        XCTAssertEqual(sut?.userInputDataCount, expectation)
    }
    
    // MARK: dequeueOperationResultQueue() 메서드의 Test Cases
    func test_2회_enqueueOperationResultQueue후_1회_dequeueOperationResultQueue후_operationResultQueue의_count는_1이다() {
        // given
        sut?.enqueueOperationResultQueue(10)
        sut?.enqueueOperationResultQueue(20)
        let expectation = 1
        
        // when
        _ = sut?.dequeueOperationResultQueue()
        
        // then
        XCTAssertEqual(sut?.operationResultCount, expectation)
    }
    
    func test_2회_enqueueOperationResultQueue후_3회_dequeueOperationResultQueue후_operationResultQueue의_count는_0이다() {
        // given
        sut?.enqueueOperationResultQueue(10)
        sut?.enqueueOperationResultQueue(20)
        let expectation = 0
        
        // when
        _ = sut?.dequeueOperationResultQueue()
        _ = sut?.dequeueOperationResultQueue()
        _ = sut?.dequeueOperationResultQueue()
        
        // then
        XCTAssertEqual(sut?.operationResultCount, expectation)
    }
}
