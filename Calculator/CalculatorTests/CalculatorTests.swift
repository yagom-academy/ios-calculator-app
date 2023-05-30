//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by minsong kim on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1번stack에_순서대로요소가추가되는지() {
        //given
        let input = 10
        let nextInput = 20
        let answer = [10, 20]
        
        //when
        var result = sut.pushStack(input)
        result = sut.pushStack(nextInput)
        
        //then
        XCTAssertEqual(result, answer)
    }

}
