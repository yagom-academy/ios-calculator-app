//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Yena on 2023/05/30.
//

import XCTest
import Foundation

@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
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
}
