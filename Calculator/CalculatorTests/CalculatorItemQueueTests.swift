//
//  CalculatorItemQueue.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty호출시_큐가_비어있으면_true를_리턴한다() {
        // given
        let expectedResult = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
}
