//
//  Formula_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class Formula_Tests: XCTestCase {
    var sut: Formula!
//    var operandsQueue = CalculatorItemQueue()
//    var operatorsQueue = CalculatorItemQueue()
    let testOperands: [Double] = [1.0, 2.0, -3.0, 4.0, 5.0]
    let testOperators: [Operator] = [.add, .subtract, .divide, .multiply]
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    
}
