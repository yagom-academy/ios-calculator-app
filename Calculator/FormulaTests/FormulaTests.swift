//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기_1을했을때_2이_되는지(){
        let result:Double = 2
        
        sut.operands.enqueue(1)
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator.add)
        
        XCTAssertEqual(result, sut.result())
    }
}
