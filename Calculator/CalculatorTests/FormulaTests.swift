//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }
    
    func test_When_generate_result_Then_expects_Not_nil() {
        // given
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertNotNil(result)
        
    }
}
