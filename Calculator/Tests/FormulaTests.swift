//
//  FormulaTests.swift
//  Tests
//
//  Created by mmim.
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
}
