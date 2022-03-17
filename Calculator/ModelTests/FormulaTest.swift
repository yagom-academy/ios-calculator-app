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
    
    func test_result() throws {
        sut.operands.enqueue(with: 2.0)
        sut.operands.enqueue(with: 3.0)
        sut.operands.enqueue(with: 4.0)
        sut.operators.enqueue(with: Operator.multiply)
        sut.operators.enqueue(with: Operator.add)
        
        let expectResult: Double = 10.0
        let result = try sut.result()
        
        XCTAssertEqual(result, expectResult)
    }

}
