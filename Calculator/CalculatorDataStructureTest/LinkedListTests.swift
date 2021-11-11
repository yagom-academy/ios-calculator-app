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
    
    func test_insert후Elements가값을그대로반환되는지() {
        let value = "5"
        
        sut.insert(value)
        
        XCTAssertEqual(sut.elements(), [value])
    }
    
    func test_insert와_delete를거치면_Elements가_nil배열을반환하는지() {
        sut.insert("3")
        
        sut.delete("3")
        
        XCTAssertEqual(sut.elements(), [])
    }
    
    func test_연결리스트에숫자_1_2_3을넣고_2를_delete했을때연결리스트가_1_3을가지는지() {
        sut.insert("1")
        sut.insert("2")
        sut.insert("3")
        
        sut.delete("2")
        
        XCTAssertEqual(sut.elements(), ["1", "3"])
    }
}
