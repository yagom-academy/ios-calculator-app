//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by Baek on 2022/05/17.
//

import XCTest

class CalculatorTest: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isEmpty호출시_비어있으면_true반환하는지() {
        //given
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_비어있지않으면_False반환하는지() {
        //given
        sut.enqueue("1")

        //when
        let result = sut.isEmpty

        //then
        XCTAssertFalse(result)
    }

    func test_peek함수가_리스트_첫번째_값을가져오는지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let testNumber = "1"
        
        //when
        let peekGetNumber = sut.peek?.data

        //then
        XCTAssertEqual(testNumber, peekGetNumber)
    }

    func test_deQueue_리스트에아무것도없을때_nil반환하는지() {
        //given
        //when
        let result = sut.dequeue()

        //then
        XCTAssertNil(result)
    }

    func test_deQueue_리스트에서_맨앞에_갚을제거하는지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let testNumber = "1"

        //when
        let result = sut.dequeue()

        //then
        XCTAssertEqual(testNumber, result)
    }
    
    func test_removeAll_로_리스트모든값제거() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
