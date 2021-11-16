//
//  FormulaTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/16.
//

import XCTest

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
}
