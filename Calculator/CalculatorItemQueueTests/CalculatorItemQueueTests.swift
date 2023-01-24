//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kimseongjun on 2023/01/24.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue를실행하여_숫자3개를넣었을때_queue안에_숫자3개와동일한지() {
        
        //given
        let input: [Any?] = [1,2,3]
        
        //when
        for input in input {
            sut.enqueue(element: input)
        }
        let result = sut.queue
    
        //then
        XCTAssert(result, input)
    }

}
