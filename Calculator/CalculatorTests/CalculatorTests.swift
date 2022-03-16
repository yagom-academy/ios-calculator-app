//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Eddy on 2022/03/15.
//

import XCTest
import Calculator


class CalculatorTests: XCTestCase {
    var sut: CalculatorQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enque_one_element() {
        sut.capacity = 5
        sut.data = ["1"]
        let input = "1"
        
        let result = sut.enqueData(input)
        
        XCTAssertEqual(result, ["1"])
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
        
        count = sut.countData
        
        XCTAssertEqual(count, 0)
    }
    
    
    
    

}
