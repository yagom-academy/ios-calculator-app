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
        sut = nil
    }
    
    func test_값이_없을_때_result_메서드를_실행하면_오류가_나는가() {
        XCTAssertThrowsError(try sut.result())
    }
}
