//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class FormulaTest: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
