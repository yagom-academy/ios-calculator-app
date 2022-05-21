//
//  FormulaTests.swift
//  MyCalculatorTests
//
//  Created by 이예은 on 2022/05/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
  
    func test_Formula의_operands와operators에_아무값도_안들어있을때_반환값이0이다() {
        // given
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 0.0)
    }
}
