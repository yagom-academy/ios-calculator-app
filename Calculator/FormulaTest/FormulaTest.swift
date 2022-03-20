//  FormulaTest.swift
//  FormulaTest
//  Created by LIMGAUI on 2022/03/20

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula(operands: .init(), operators: .init())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
