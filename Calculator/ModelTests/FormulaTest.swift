//
//  FormulaTest.swift
//  ModelTests
//
//  Created by Red on 2022/03/17.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_result() {
        sut.operands.enqueue(with: -10.0)
        sut.operands.enqueue(with: 2.0)
        sut.operands.enqueue(with: 3.0)
        sut.operands.enqueue(with: 4.0)
        sut.operators.enqueue(with: Operator.add)
        sut.operators.enqueue(with: Operator.subtract)
        sut.operators.enqueue(with: Operator.multiply)
        
        let result = sut.result()
        
        XCTAssertEqual(result, -44.0)
    }
}
