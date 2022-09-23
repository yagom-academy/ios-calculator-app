//
//  FormulaTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let operandQueue = CalculatorItemQueue<Double>(elements: [1,2,3,4,5])
        let operatorQueue = CalculatorItemQueue<Operator>(elements: [.add,.multiply,.subtract,.multiply])
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testExample() {
        let result = sut.result()
        
        XCTAssertEqual(result, 25)
    }
}
