//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 정선아 on 2022/09/23.
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
        sut.operands.clear()
        sut.operators.clear()
    }
    
    func test_값이_없을_때_result_메서드를_실행하면_오류가_나는가() {
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_1_더하기_1은_2로_나오는가() {
        let result = 2.0
        let operators: Character = "+"
        
        sut.operands.enQueue(element: 1.0)
        sut.operands.enQueue(element: 1.0)
        sut.operators.enQueue(element: operators)
        
        XCTAssertEqual(result, try sut.result())
    }
}
