//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Charles on 2023/10/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_왼쪽컨테이너에_요소가있을때_마지막요소를_빼내는지() {
        // given
        sut.leftContainer = [1, 2, 3]
        sut.rightContainer = []
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result!, sut.leftContainer.last)
    }
}
