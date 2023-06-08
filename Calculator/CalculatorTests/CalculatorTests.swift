//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by idinaloq on 2023/05/29.
//

import XCTest
@testable import Calculator

extension Int: CalculateItem {}

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    func test_값을_한번enqueue하면_head와tail에추가되는지() {
        //given
        let input = 1
        //when
        sut.enqueue(input)
        let list = sut.currentList
        let head = list.currentHead()
        let tail = list.currentTail()
        //then
        XCTAssertEqual(list.currentHead()?.data, input)
        XCTAssertEqual(list.currentTail()?.data, input)
    }
    
    func test_값을두번enqueue하면_정상적으로head와tail에_추가되는지() {
        //given
        let firstInput = 1
        let secondInput = 2
        //when
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        let list = sut.currentList
        let head = list.currentHead()
        let tail = list.currentTail()
        //then
        XCTAssertEqual(list.currentHead()?.data, firstInput)
        XCTAssertEqual(list.currentTail()?.data, secondInput)
    }
    
    func test_head가없을때_값을dequeue하면_nil을반환하는지() {
        //given
        //when
        let removedData = sut.dequeue()
        //then
        XCTAssertNil(removedData)
    }
    
    func test_head가있을떄_값을dequeue하면_값을반환하는지() {
        //given
        let input = 1
        //when
        sut.enqueue(input)
        let removedData = sut.dequeue()
        //then
        XCTAssertEqual(removedData, input)
    }
    
    func test_head가있을때_모든값을지우면_head와tail이_nil로되는지() {
        //given
        let input = 1
        sut.enqueue(input)
        //when
        sut.removeAll()
        let list = sut.currentList
        let head = list.currentHead()
        let tail = list.currentTail()
        //then
        XCTAssertNil(head)
        XCTAssertNil(tail)
    }
}
