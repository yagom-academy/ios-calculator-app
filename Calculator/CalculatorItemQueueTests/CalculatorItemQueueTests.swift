//  CalculatorItemQueueTests - CalculatorItemQueueTests.swift
//  created by vetto on 2023/01/25

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: - isEmpty computed property test
    func test_큐_생성_시_isQueueEmpty호출시_true이다() {
        // given
        
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_Queue생성_후에_enqueue를_하고_isQueueEmpty호출시_false이다() {
        // given
        sut.enqueue(data: "head")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    // MARK: - enqueue method test
    
    // MARK: - dequeue method test
    
    // MARK: - clear method test
}
