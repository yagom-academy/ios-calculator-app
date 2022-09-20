//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Baem on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue의_addQueue실행시_queue_에_추가가되는지() {
        // given
        let number: String = "50"
        
        // when
        sut?.addQueue(number)
        
        // then
        XCTAssertEqual(sut?.queue, ["50"])
    }
}
