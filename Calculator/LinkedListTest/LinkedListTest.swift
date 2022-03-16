//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by DuDu on 2022/03/16.
//

import XCTest
@testable import Calculator

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>?

    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
