//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Dylan_Y on 2022/09/26.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operandsQueue: CalculatorItemQueue!
    var operatorsQueue: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(
            operands: operandsQueue,
            operators: operatorsQueue
        )
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
