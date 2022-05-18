//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by 오경식 on 2022/05/17.
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
}
