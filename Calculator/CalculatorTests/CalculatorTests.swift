//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Eddy on 2022/03/15.
//

import XCTest
@testable import Calculator


class CalculatorTests<T>: XCTestCase {
    var sut: QueueLinkedList<Int>!
    var Operator: QueueLinkedList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = QueueLinkedList<Int>()
        Operator = QueueLinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        Operator = nil
    }

    
//    func test_deque_one_element() {
//        let result = ["1"]
//
//        result = sut.dequeOperation()
//
//
//        XCTAssertEqual(result, [""])
//    }
    
    func test_count_how_many_elements_in_queue() {
        var count = 0
        
        
        
        XCTAssertEqual(count, 0)
    }
    
    
    
    

}
