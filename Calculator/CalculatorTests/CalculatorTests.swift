//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Eddy on 2022/03/15.
//

import XCTest
import Calculator

class CalculatorTests<T>: XCTestCase {
    var sut: QueueLinkedList<T>!
  
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = QueueLinkedList<T>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
    }
    
    func test_enque_one_element() {
        
        
        let input = "1"
        
        
        
        
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
