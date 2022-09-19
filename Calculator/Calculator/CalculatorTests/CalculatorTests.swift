//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 노유빈 on 2022/09/19.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐에_데이터가_아무것도_없을경우_pop() {
        let result = sut.pop()
        
        XCTAssertEqual(result, nil)
    }
    
    func test_push_1_2_3_pop_1_2_3() {
        sut.push(1)
        sut.push(2)
        sut.push(3)
        
        XCTAssertEqual(sut.pop(), 1)
        XCTAssertEqual(sut.pop(), 2)
        XCTAssertEqual(sut.pop(), 3)
    }
    
    func test_queue_isEmpty_true() {
        XCTAssertEqual(sut.isEmpty, true)
    }
    
    func test_queue_isEmpty_false() {
        sut.push(1)
        XCTAssertEqual(sut.isEmpty, false)
    }

}
