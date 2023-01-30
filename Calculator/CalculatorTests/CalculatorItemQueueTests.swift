//  CalculatorItemQueueTests - CalculatorItemQueueTests.swift
//  created by vetto on 2023/01/25

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
    
    // MARK: - isEmpty computed property test
    func test_queue생성_후_비어있는_상태에서_isEmpty호출하면_true이다() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue생성_후에_enqueue를_하고_isEmpty호출시_false이다() {
        // given
        sut.enqueue("head")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    // MARK: - enqueue method test
    func test_빈_큐에_enqueue하면_head랑_tail의_값이_같다() {
        // given
        sut.enqueue("head")
        
        // when
        let resultOfHead = sut.calculatorList.head?.data
        let resultOfTail = sut.calculatorList.tail?.data
        
        // then
        XCTAssertEqual(resultOfHead, resultOfTail)
    }
    
    func test_enqueue_여러번_호출해도_head는_바뀌지_않는다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.calculatorList.head?.data
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue를_여러변_호출시_마지막에enqueue한_값이_tail로_들어간다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.enqueue("tail")
        
        // when
        let result = sut.calculatorList.tail?.data
        let expectation = "tail"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - dequeue method test
    func test_빈_큐에서_dequeue호출시_nil값이_반환된다() {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_1개이상_존재하는_큐에서_dequeue호출시_head에_있는_값이_반환된다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        
        // when
        let result = sut.dequeue()
        let expectation = "head"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_요소가_2개이상_존재하는_큐에서_dequeue호출시_head가_다음_노드로_바뀐다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        
        // when
        let _ = sut.dequeue()
        let result = sut.calculatorList.head?.data
        let expectation = "middle"
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - clear method test
    func test_큐에_두개의_노드를_넣고_clear메소드를_호출하면_head랑_tail이_nil이_된다() {
        // given
        sut.enqueue("head")
        sut.enqueue("middle")
        sut.clear()
        
        // when
        let resultOfHead = sut.calculatorList.head
        let resultOfTail = sut.calculatorList.tail
        
        // then
        XCTAssertNil(resultOfHead)
        XCTAssertNil(resultOfTail)
    }
}
