//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/06/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}
