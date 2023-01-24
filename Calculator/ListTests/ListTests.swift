//
//  ListTests.swift
//  ListTests
//
//  Created by 조향래 on 2023/01/25.
//

import XCTest
@testable import Calculator

final class ListTests: XCTestCase {
    var sut: List<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = List<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: push() 메서드의 Test Cases
    func test_1회push후_리스트의_head가_push된_Node이다() {
        // given
        let input = Node(10)

        // when
        sut.push(input)

        // then
        XCTAssertEqual(sut.head, input)
    }
    
    func test_2회push후_리스트의_head가_두번째_push된_Node이다() {
        // given
        let input1 = Node(10)
        let input2 = Node(20)
        
        // when
        sut.push(input1)
        sut.push(input2)

        // then
        XCTAssertEqual(sut.head, input2)
    }
    
    func test_1회push후_리스트의_tail이_push된_Node이다() {
        // given
        let input = Node(10)

        // when
        sut.push(input)

        // then
        XCTAssertEqual(sut.tail, input)
    }
    
    func test_2회push후_리스트의_tail이_첫번째_push된_Node이다() {
        // given
        let input1 = Node(10)
        let input2 = Node(20)
        
        // when
        sut.push(input1)
        sut.push(input2)

        // then
        XCTAssertEqual(sut.tail, input1)
    }
    
    // MARK: popHead() 메서드의 Test Cases

}
