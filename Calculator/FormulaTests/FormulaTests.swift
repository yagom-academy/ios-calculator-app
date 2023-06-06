//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by kangkyungmin on 2023/06/07.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: FormulaTests!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FormulaTests()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
