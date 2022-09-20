//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Baem on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue의_addQueue실행시_queue_에_추가가되는지() {
        // given
        let number: Int = 50
        
        // when
        sut?.addQueue(number)
        
        // then
        XCTAssertEqual(sut?.queue as! [Int], [50])
    }
}
