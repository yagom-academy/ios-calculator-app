//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    func testQueue_Double타입의값을enqueue했을때_queue의첫번째요소가_enqueue한값이어야한다() {
        // given
        sut.enqueue(10.0)
        // when
        let result = sut.queue.head?.data
        // then
        XCTAssertEqual(result, 10.0)
    }
    
    func testQueue_비어있는CalculatorItemQueue에_isEmpty를호출했을때_true가나와야한다() {
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    func testQueue_Double타입의값을enqueue한후_removeAll을호출하면_전부삭제돼야한다() {
        // given
        sut.enqueue(10.0)
        sut.enqueue(20.0)
        sut.enqueue(30.0)
        sut.removeAll()
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    func testQueue_Queue가비었을때_dequeue를하면_nil이나와야한다() {
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func testQueue_Double타입의값을enqueue한후_dequeue를했을때_enqueue한값반환되어야한다() {
        //given
        sut.enqueue(10.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 10.0)
    }
}
