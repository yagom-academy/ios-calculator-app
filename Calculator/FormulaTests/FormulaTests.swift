//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Minseong Kang on 2022/05/27.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: Formula!
    
    // MARK: - Actions
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - result()
        
    func test_result메서드_operands에_1과2가있고_operator가_덧셈일때_3이_나온다() {
        // given
        let num1 = 1.0, num2 = 2.0
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, num1 + num2)
        
    }

}
