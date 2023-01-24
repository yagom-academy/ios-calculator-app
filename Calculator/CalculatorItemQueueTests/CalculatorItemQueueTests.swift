//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kimseongjun on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueueTests!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueueTests()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue를실행하여_숫자3개를넣었을때_queue안에_숫자3개와동일한지() {
        
        //given
        let input = [1,2,3]
        
        //when
        for input in input {
            sut.enqueue(input)
        }
        let result = sut.queue
        
        //then
        XCTAssertEqual(result, input)
    }

}
