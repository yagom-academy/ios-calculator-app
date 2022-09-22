//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 노유빈 on 2022/09/22.
//

import XCTest

@testable import Calculator
final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        //sut = Formula(operands: <#CalculatorItemQueue#>, operators: <#CalculatorItemQueue#>)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}
