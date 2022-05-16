//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by seohyeon park on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func calculateItems에_요소가_잘_추가되는지() {
        // given
        let number = 3.0
        sut.enqueu(number)
        // when
        let result = sut.calculateItems[0]
        // then
        XCTAssertEqual(result, 3.0)
    }
}
