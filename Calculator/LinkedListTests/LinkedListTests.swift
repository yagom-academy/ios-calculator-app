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
        sut = LinkedList(head: Node(data: 1))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_append를하면_맨마지막에_들어가는지() {
        // given
        let input = Node(data: 3)
        
        // when
        sut.append(data: 5)
        guard let result = sut.getLastNodeData()?.data else {
            return
        }
        
        // then
        XCTAssertEqual(input.data, result)
    }

}
