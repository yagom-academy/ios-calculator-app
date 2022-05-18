//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by unchain123 on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_숫자5를_넣었을때_5가_들어있는지확인() {
        sut.linkedList.append(data: 5)
        
        XCTAssertEqual(sut.linkedList.head?.data, 5)
    }
    
    func test_숫자5_6을_넣었을때_5_6이들어있는지확인() {
        sut.linkedList.append(data: 5)
        sut.linkedList.append(data: 6)
        
        XCTAssertEqual(sut.linkedList.head?.data, 5)
        XCTAssertEqual(sut.linkedList.head?.next?.data, 6)
    }
    
    func test_3개의데이터를넣으면카운트가3인지() {
        sut.linkedList.append(data: 6)
        sut.linkedList.append(data: 6)
        sut.linkedList.append(data: 6)

        XCTAssertEqual(sut.linkedList.count, 3)
    }
    
    func test_remove함수를_사용하면_head값이바뀌는지() {
        sut.linkedList.append(data: 1)
        sut.linkedList.append(data: 3)
        sut.linkedList.append(data: 5)
        sut.linkedList.remove()
        
        XCTAssertEqual(sut.linkedList.head?.data, 3)
    }
    
    func test_값이없을때_remove하면_nil을_반환하는지() {
        sut.linkedList.remove()
        
        XCTAssertEqual(sut.linkedList.head?.data, nil)
    }
}
