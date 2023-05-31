//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Dasan on 2023/05/30.
//

import XCTest
import Foundation
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<CalculateItem>!

    override func setUpWithError() throws {
        sut = LinkedList()
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
        sut.append("+")
        sut.append("-")
        let expectation = 6
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_head가_nil이면_isEmpty는_true를반환한다() {
        // given
        let input = sut.first
        
        // when
        if input == nil {
            // then
            XCTAssertTrue(sut.isEmpty)
        }
    }

    func test_노드가없을때_apped를하면_처음과끝노드의값이_같다() {
        // given
        sut.append(1)
        
        // when
        if sut.isEmpty {
            // then
            let first = sut.first as? Int
            let last = sut.last as? Int
            XCTAssertEqual(first, last)
        }
    }
    
    func test_노드가있을때_append를하면_추가된node가_마지막노드가된다() {
        // given
        sut.append(1)
        
        // when
        sut.append(2)
        let result = sut.last as? Int
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_노드가없을때_removeFirst를하면_return값은nil이다() {
        // given
        // 아무것도 안들어감
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_노드가하나만있을때_removeFirst를하면_처음과끝노드는_nil이된다() {
        // given
        sut.append(1)
        
        // when
        let _ = sut.removeFirst()
        
        // then
        XCTAssertNil(sut.first)
        XCTAssertNil(sut.last)
    }
    
    func test_removeFirst를하면_처음노드의data를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let expectation = 1
        
        // when
        let result = sut.removeFirst() as? Int
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
