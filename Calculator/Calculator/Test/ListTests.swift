//
//  ListTests.swift
//  ListTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class ListTests: XCTestCase {
    var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: push() 메서드의 Test Cases
    func test_1회_push후_리스트의_head가_push된_Node이다() {
        // given
        let input = Node("10")

        // when
        sut.push(input)

        // then
        XCTAssertEqual(sut.head, input)
    }
    
    func test_2회_push후_리스트의_head가_두번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        
        // when
        sut.push(input1)
        sut.push(input2)

        // then
        XCTAssertEqual(sut.head, input2)
    }
    
    func test_1회_push후_리스트의_tail이_push된_Node이다() {
        // given
        let input = Node("10")

        // when
        sut.push(input)

        // then
        XCTAssertEqual(sut.tail, input)
    }
    
    func test_2회_push후_리스트의_tail이_첫번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        
        // when
        sut.push(input1)
        sut.push(input2)

        // then
        XCTAssertEqual(sut.tail, input1)
    }
    
    // MARK: count 프로퍼티의 Test Cases
    func test_빈_리스트의_count는_0이다() {
        // given
        let expectation = 0

        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_1회_push후_리스트의_count는_1이다() {
        // given
        let input1 = Node("10")
        let expectation = 1
        sut.push(input1)

        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_2회_push후_리스트의_count는_2이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let expectation = 2
        sut.push(input1)
        sut.push(input2)

        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    
    // MARK: popHead() 메서드의 Test Cases
    func test_1회_push후_popHead는_첫번째_push된_Node이다() {
        // given
        let input = Node("10")
        sut.push(input)
        
        // when / then
        XCTAssertEqual(sut.popHead(), input)
    }
    
    func test_2회_push후_popHead는_두번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        sut.push(input1)
        sut.push(input2)
        
        // when / then
        XCTAssertEqual(sut.popHead(), input2)
    }
    
    func test_2회_push후_2회popHead는_첫번째_push된_Node이다() {
        let input1 = Node("10")
        let input2 = Node("20")
        sut.push(input1)
        sut.push(input2)
        
        // when
        _ = sut.popHead()
        
        // then
        XCTAssertEqual(sut.popHead(), input1)
    }
    
    func test_2회_push후_3회popHead는_nil이다() {
        let input1 = Node("10")
        let input2 = Node("20")
        sut.push(input1)
        sut.push(input2)
        
        // when
        _ = sut.popHead()
        _ = sut.popHead()
        
        // then
        XCTAssertEqual(sut.popHead(), nil)
    }
    
    // MARK: pickHead() 메서드의 Test Cases
    func test_1회_push후_pickHead는_첫번째_push된_Node이다() {
        // given
        let input = Node("10")
        sut.push(input)
        
        // when / then
        XCTAssertEqual(sut.pickHead()!, input)
    }
    
    func test_2회_push후_pickHead는_두번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        sut.push(input1)
        sut.push(input2)
        
        // when / then
        XCTAssertEqual(sut.pickHead()!, input2)
    }
    
    // MARK: removeLast() 메서드의 Test Cases
    func test_1회_push후_removeLast는_첫번째_push된_Node이다() {
        // given
        let input = Node("10")
        sut.push(input)
        
        // when / then
        XCTAssertEqual(sut.removeLast(), input)
    }
    
    func test_3회_push후_removeLast는_첫번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.push(input1)
        sut.push(input2)
        sut.push(input3)
        
        // when / then
        XCTAssertEqual(sut.removeLast(), input1)
    }
    
    func test_3회_push후_2회removeLast는_두번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.push(input1)
        sut.push(input2)
        sut.push(input3)
        
        // when
        _ = sut.removeLast()

        // when / then
        XCTAssertEqual(sut.removeLast(), input2)
    }
    
    func test_3회_push후_3회removeLast는_세번째_push된_Node이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.push(input1)
        sut.push(input2)
        sut.push(input3)
        
        // when
        _ = sut.removeLast()
        _ = sut.removeLast()
        
        // when / then
        XCTAssertEqual(sut.removeLast(), input3)
    }
    
    func test_3회_push후_3회removeLast후_head는_nil이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.push(input1)
        sut.push(input2)
        sut.push(input3)
        
        // when
        _ = sut.removeLast()
        _ = sut.removeLast()
        _ = sut.removeLast()
        
        // when / then
        XCTAssertEqual(sut.head, nil)
    }
    
    func test_3회_push후_3회removeLast후_tail은_nil이다() {
        // given
        let input1 = Node("10")
        let input2 = Node("20")
        let input3 = Node("30")
        sut.push(input1)
        sut.push(input2)
        sut.push(input3)
        
        // when
        _ = sut.removeLast()
        _ = sut.removeLast()
        _ = sut.removeLast()
        
        // when / then
        XCTAssertEqual(sut.tail, nil)
    }
}
