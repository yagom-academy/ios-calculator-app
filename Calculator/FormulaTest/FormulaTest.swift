//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by Kiwi on 2022/05/20.
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
    
    func test_숫자를_집어넣었을때_연산이_정상적으로_작동하는지() {
        //given
        sut.operands.enqueue(data: 1.0)
        sut.operands.enqueue(data: 2.0)
        sut.operands.enqueue(data: 3.0)
        
        sut.operators.enqueue(data: .add)
        sut.operators.enqueue(data: .substract)
        //when
        let result = try? sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
}
