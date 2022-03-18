//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<LinkdeList<Double>>(LinkdeList<Double>()), operators: CalculatorItemQueue<LinkdeList<Operator>>(LinkdeList<Operator>()))
    }

    override func tearDownWithError() throws {
        sut = nil
        
    }
    
    

}
