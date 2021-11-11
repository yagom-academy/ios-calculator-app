//
//  CalculatorDataStructureTest.swift
//  CalculatorDataStructureTest
//
//  Created by 고은 on 2021/11/09.
//

import XCTest

class CalculatorDataStructureTest: XCTestCase {
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_insert후test_Elements에값을그대로반환되는지() {
        let value = "5"
        
        sut.insert(value)
        
        XCTAssertEqual(sut.test_Elements(), [value])
    }
    
    func test_insert와_delete를거치면_test_Elements가_nil배열을반환하는지() {
        sut.insert("3")
        
        sut.delete("3")
        
        XCTAssertEqual(sut.test_Elements(), [])
    }
}
