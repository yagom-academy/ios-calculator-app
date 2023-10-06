//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    typealias List = LinkedList<Int>
    
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>(list: List())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count_값이없을때count가0이다() {
        // given
        let expectation = 0
        
        // when
        sut = CalculatorItemQueue(list: List())
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_count_enQueue되면_count가1이다() {
        // given
        let firstNode = List.Node(data: 1)
        let list = List(head: firstNode, tail: firstNode)
        
        let expectation = 1
        
        // when
        sut = CalculatorItemQueue(list: list)
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }

    func test_enQueue호출시_rear에값이변경된다() {
        // given
        let data: Int = 1
        
        // when
        sut.enQueue(data)
        
        // then
        XCTAssertEqual(sut.rear, data)
    }
    
    func test_deQueue호출시_front를반환한다() {
        // given
        let firstNode = List.Node(data: 1)
        let secondNode = List.Node(data: 2)
        firstNode.next = secondNode
        let list = List(head: firstNode, tail: secondNode)
        sut = CalculatorItemQueue(list: list)
        let expectation = sut.front
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_deQueue호출시_isEmpty일때_nil반환한다() {
        // given
        sut = CalculatorItemQueue(list: List())
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_clear호출시_isEmpty이다() {
        // given
        let firstNode = List.Node(data: 1)
        let list = List(head: firstNode, tail: firstNode)
        sut = CalculatorItemQueue(list: list)
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}

extension Int: CalculatorItem {
    
}
