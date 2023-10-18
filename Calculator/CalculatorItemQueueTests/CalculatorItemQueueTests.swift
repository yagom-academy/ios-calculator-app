//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by jyubong,Morgan.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    typealias List = LinkedList<Double>
    
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>(list: List())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐값이없을때_count결과가_0이다() {
        // given
        let expectation = 0
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐값이1개이면_count결과가_1이다() {
        // given
        let node = List.Node(data: 1.0)
        let list = List(head: node, tail: node)
        sut = .init(list: list)
        let expectation = 1
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_Queue가_비어있을때_enQueue호출시_head의값이변경된다() {
        // given
        let data = 1.0
        
        // when
        sut.enQueue(data)
        
        // then
        XCTAssertEqual(sut.peek, data)
    }
    
    func test_deQueue호출시_front가삭제되고front를반환한다() {
        // given
        let node = List.Node(data: 1.0)
        let list = List(head: node, tail: node)
        sut = .init(list: list)
        let expectation = sut.peek
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertNotEqual(sut.peek, expectation)
        XCTAssertEqual(result, expectation)
    }
    
    func test_deQueue호출시_값이없을때_nil반환한다() {
        // given
        sut = .init(list: List())
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_clear호출시_값이nil이된다() {
        // given
        let node = List.Node(data: 1.0)
        let list = List(head: node, tail: node)
        sut = .init(list: list)
        
        // when
        sut.clear()
        
        // then
        XCTAssertNil(sut.peek)
    }
}
