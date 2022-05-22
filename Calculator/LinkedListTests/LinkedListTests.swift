//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Minseong Kang on 2022/05/22.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: LinkedList<Any>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
