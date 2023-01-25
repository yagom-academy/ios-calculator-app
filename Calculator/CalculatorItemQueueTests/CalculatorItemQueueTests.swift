//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Hyejeong Jeong on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_빈Queue인경우_1을추가하면_마지막값이1이다() {
        // given
        let expectation = "1"
        
        // when
        sut.enqueue(expectation)
        let tailOfQueue = sut.queue.tail?.value
        
        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_빈Queue가아닌경우_3을추가하면_마지막값이3이다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        let expectation = "3"
        
        // when
        sut.enqueue("3")
        let tailOfQueue = sut.queue.tail?.value
        
        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_removeRear호출시_마지막으로입력한3이삭제되고_tail이2가된다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "2"
        
        // when
        let _ = sut.removeRear()
        
        // then
        XCTAssertEqual(sut.queue.tail?.value, expectation)
    }
    
    func test_deququ호출시_맨처음입력한1이삭제되고_head는2가된다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "2"
        
        // when
        let _ = sut.deququ()
        
        // then
        XCTAssertEqual(sut.queue.head?.value, expectation)
    }
    
    func test_removeAll호출시_head와tail모두nil이된다() {
        // given
        let head = sut.queue.head
        let tail = sut.queue.tail
        var condition: Bool {
            head == nil && tail == nil
        }
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertTrue(condition)
    }
}
