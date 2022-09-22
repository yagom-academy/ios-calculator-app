//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김인호 on 2022/09/22.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    let operandsQueue = CalculatorItemQueue<Double>()
    let operatorsQueue = CalculatorItemQueue<Operator>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: operandsQueue, operators: operatorsQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result실행시_피연산자큐가비어있으면_0을리턴하는가() {
        //given
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(0, result)
    }
}
