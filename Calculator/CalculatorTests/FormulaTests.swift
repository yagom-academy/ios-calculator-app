//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/12/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}
