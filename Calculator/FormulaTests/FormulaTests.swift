//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Kiseok on 2023/10/11.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [], dequeueBox: []),
                      operators: CalculatorItemQueue<Operator>(enqueueBox: [], dequeueBox: []))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
