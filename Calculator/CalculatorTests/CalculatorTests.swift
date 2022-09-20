//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jiyoung Lee on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

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
        let expected: [CalculateItem] = ["1"]
        
        // when
        sut.enqueue(item: input)
        
        // then
        XCTAssertEqual(sut.inItems, expected)
    }
}

extension String: CalculateItem {
    
}

extension CalculateItem: Equatable {
    
}
