//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jiyoung Lee on 2022/09/20.
//

import XCTest
@testable import Calculator

extension String: CalculateItem {
    
}

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_1개삽입() {
        // given
        let input = "1"
        let expected: [String] = ["1"]
        
        // when
        sut.enqueue(item: input)
        
        // then
        XCTAssertEqual(sut.inputStack, expected)
    }
    
    func test_dequeue_빈배열에서디큐() {
        // given
        let expected: String? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expected)
    }
}


