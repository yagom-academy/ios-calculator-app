//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by Baek on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isEmpty호출시_비어있으면_true반환하는지() {
        //given
        sut.formulaQueue = []
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }

}
