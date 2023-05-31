//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by kangkyungmin on 2023/05/31.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {

    var sut: LinkedList<Any>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
