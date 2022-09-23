//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 정선아 on 2022/09/23.
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
        sut.operands.clear()
        sut.operators.clear()
    }
    
    func test_값이_없을_때_result_메서드를_실행하면_오류가_나는가() {
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_1_더하기_1은_2로_나오는가() {
        let result = 2.0
        
        sut.operands.enQueue(element: 1.0)
        sut.operands.enQueue(element: 1.0)
        sut.operators.enQueue(element: Operator.add)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_1_더하기_3_빼기_2은_2로_나오는가() {
        let result = 2.0
        
        sut.operands.enQueue(element: 1.0)
        sut.operands.enQueue(element: 3.0)
        sut.operands.enQueue(element: 2.0)
        
        sut.operators.enQueue(element: Operator.add)
        sut.operators.enQueue(element: Operator.subtract)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_1_더하기_3_빼기_2_곱하기_10은_20로_나오는가() {
        let result = 20.0
        
        sut.operands.enQueue(element: 1.0)
        sut.operands.enQueue(element: 3.0)
        sut.operands.enQueue(element: 2.0)
        sut.operands.enQueue(element: 10.0)
        
        sut.operators.enQueue(element: Operator.add)
        sut.operators.enQueue(element: Operator.subtract)
        sut.operators.enQueue(element: Operator.multiply)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_1_더하기_3_빼기_2_곱하기_10_나누기_2은_10로_나오는가() {
        let result = 10.0
        
        sut.operands.enQueue(element: 1.0)
        sut.operands.enQueue(element: 3.0)
        sut.operands.enQueue(element: 2.0)
        sut.operands.enQueue(element: 10.0)
        sut.operands.enQueue(element: 2.0)
        
        sut.operators.enQueue(element: Operator.add)
        sut.operators.enQueue(element: Operator.subtract)
        sut.operators.enQueue(element: Operator.multiply)
        sut.operators.enQueue(element: Operator.divide)
        
        XCTAssertEqual(result, try sut.result())
    }
}
