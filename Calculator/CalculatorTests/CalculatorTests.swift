//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by dhoney96 on 2022/05/17.
//

import XCTest

class CalculatorTests: XCTestCase {
    var calculator: CalculatorItemQueue!

    override func setUpWithError() throws {
        calculator = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
}
