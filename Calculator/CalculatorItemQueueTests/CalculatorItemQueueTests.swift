//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by redmango1446 on 2023/06/01.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_dequeue_enqueue를_하지_않고_dequeue를_하면_Nil이_반환된다() {
        // given
        // when
        var result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}
