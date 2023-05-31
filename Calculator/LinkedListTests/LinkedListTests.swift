//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Yena on 2023/05/30.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedListTest<Int>!

    override func setUpWithError() throws {
        sut = LinkedListTest()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_노드의갯수를_올바르게_출력한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        let expectation = 4
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_head가_nil이면_isEmpty는_true를반환한다() {
        // given
        let input = sut.head
        
        // when
        if input == nil {
            // then
            XCTAssertTrue(sut.isEmpty)
        }
    }

    func test_노드가없을때_apped를하면_head와tail이같다() {
        // given
        sut.append(1)
        
        // when
        if sut.isEmpty {
            // then
            XCTAssertTrue(sut.head === sut.tail)
        }
    }
    
    func test_노드가있을때_append를하면_추가된node가_tail이된다() {
        // given
        sut.append(1)
        
        // when
        sut.append(2)
        
        // then
        XCTAssertEqual(sut.tail?.data, 2)
    }
    
    func test_노드가없을때_removeFirst를하면_return값은nil이다() {
        // given
        // 아무것도 안들어감
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_노드가하나만있을때_removeFirst를하면_head와tail은_nil이된다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_removeFirst를하면_처음노드의data를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let expectaiton = 1
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
}
