//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 천승현 on 2023/01/25.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueueCurrentItem호출시_3을넣으면_enqueueStack이3을포함한다() {
        // given
        let input = "3"
        let expectation = true
        
        // when
        sut.enqueueCurrentItem(input)
        let result = sut.enqueueStack.contains("3")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    
    

}
