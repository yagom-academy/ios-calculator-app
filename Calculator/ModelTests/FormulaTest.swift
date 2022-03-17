//
//  FormulaTest.swift
//  ModelTests
//
//  Created by 박세리 on 2022/03/17.
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
        sut.operands.enqueue(with: 2.0)
        sut.operands.enqueue(with: 3.0)
        sut.operators.enqueue(with: Operator.add)
        
        let expectResult: Double = 6.0
        let result = sut.result()
        XCTAssertEqual(result, expectResult)
    }

}
