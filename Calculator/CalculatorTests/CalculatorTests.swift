//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by JIWOONG on 2024/02/05.
//

import XCTest
@testable import Calculator

extension LinkedList {
    
}

final class CalculatorTests: XCTestCase {
    var sut: LinkedList!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testExample() throws {
        
    }

}
