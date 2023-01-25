//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by jiye Yi on 2023/01/25.
//

import XCTest
@testable import Calculator
final class LinkedListTest: XCTestCase {
    var sut: LinkedList!

    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
      try super.tearDownWithError()
        sut = nil
    }

}
