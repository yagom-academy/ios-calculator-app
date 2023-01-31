//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_비어있는리스트에서_add호출시_head가add된Node이다() {
        // given
        let input = Node("10")
        let expectation = input

        // when
        sut.add(input)

        // then
        XCTAssertEqual(sut.head, expectation)
    }
    
    func test_비어있는리스트에서_add호출시_head가tail이다() {
        // given
        let input = Node("10")
        
        // when
        sut.add(input)

        // then
        XCTAssertEqual(sut.head, sut.tail)
    }
    
    func test_비어있지않은리스트에서_add호출시_head가add된Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let expectation = input2

        // when
        sut.add(input1)
        sut.add(input2)

        // then
        XCTAssertEqual(sut.head, expectation)
    }
    
    func test_비어있는리스트의_count는0이다() {
        // given
        let expectation = 0

        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_노드가한개인리스트의_count는1이다() {
        // given
        let input1 = Node("10")
        let expectation = 1
        sut.add(input1)

        // then
        XCTAssertEqual(sut.count, expectation)
    }
        
    func test_비어있는리스트에서removeFirst호출시_반환은nil이다() {
        // then
        XCTAssertEqual(sut.removeFirst(), nil)
    }
    
    func test_비어있지않은리스트에서_removeFirst호출시_반환은마지막에add된노드이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        sut.add(input1)
        sut.add(input2)
        let expectation = input2
        
        // then
        XCTAssertEqual(sut.removeFirst(), expectation)
    }
    
    func test_비어있는리스트에서_peekFirst호출시_반환은nil이다() {
        // then
        XCTAssertEqual(sut.peekFirst(), nil)
    }
    
    func test_비어있지않은리스트에서_peekFirst호출시_반환은마지막에add된노드이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        sut.add(input1)
        sut.add(input2)
        let expectation = input2
        
        // then
        XCTAssertEqual(sut.peekFirst(), expectation)
    }
    
    func test_비어있는리스트에서_removeLast호출시_반환은nil이다() {
        // then
        XCTAssertEqual(sut.removeLast(), nil)
    }
    
    func test_비어있지않은리스트에서_removeLast호출시_반환은첫번째add된노드이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.add(input1)
        sut.add(input2)
        sut.add(input3)
        let expectation = input1
        
        // then
        XCTAssertEqual(sut.removeLast(), expectation)
    }
}
