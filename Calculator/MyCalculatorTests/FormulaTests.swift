//
//  FormulaTests.swift
//  MyCalculatorTests
//
//  Created by yeton on 2022/05/19.
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
    
    func test_Formula의_operands에_3과4가담겨있고_operators에_add가담겨있고_result를호출했을때_반환값이7이다() {
        // given
        sut.operands.enqueue(data: 3.0)
        sut.operators.enqueue(data: .add)
        sut.operands.enqueue(data: 4.0)
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, 7.0)
    }
    
    func test_Formula의_operands에3과0이담겨있고_operators에_divide가담겨있고_result를호출했을때_오류를던진다() {
        // given
        sut.operands.enqueue(data: 3.0)
        sut.operators.enqueue(data: .divide)
        sut.operands.enqueue(data: 0.0)
        
        // when
        
        // then
        XCTAssertThrowsError(try sut.result())
    }
}
