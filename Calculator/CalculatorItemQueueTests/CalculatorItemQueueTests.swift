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
    func test_비어있는_큐_생성_시_isEmpty호출하면_true이다() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_Queue생성_후에_enqueue를_하고_isEmpty호출시_false이다() {
        // given
        sut.enqueue(data: "head")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    // MARK: - enqueue method test
    func test_빈_큐에_enqueue하면_head랑_tail의_값이_같다() {
        // given
        sut.enqueue(data: "head")
        
        // when
        let resultOfHead = sut.head?.data
        let resultOfTail = sut.tail?.data
        
        // then
        XCTAssertEqual(resultOfHead, resultOfTail)
    }
    
    func test_enqueue_여러번_호출해도_head는_바뀌지_않는다() {
        // given
        sut.enqueue(data: "head")
        sut.enqueue(data: "middle")
        sut.enqueue(data: "tail")
        
        // when
        let result = sut.head?.data
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue를_여러변_호출시_마지막에enqueue한_값이_tail로_들어간다() {
        // given
        sut.enqueue(data: "head")
        sut.enqueue(data: "middle")
        sut.enqueue(data: "tail")
        
        // when
        let result = sut.tail?.data
        let expectation = "tail"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - dequeue method test
    
    // MARK: - clear method test
}
