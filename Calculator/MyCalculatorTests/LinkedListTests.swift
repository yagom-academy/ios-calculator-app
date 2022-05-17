//
//  MyCalculatorTests.swift
//  MyCalculatorTests
//
//  Created by 이예은 on 2022/05/17.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_노드가_없을때_isEmpty가_True인지() {
        // give
        sut?.self.head = nil
        
        // when
        let result = sut?.isEmpty()
        
        // then
        XCTAssertTrue(result!)
    }
}
