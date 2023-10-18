//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by Lee minyeol on 2023/10/11.
//

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_2더하기3이_들어있을때_result실행시_결과는5가된다() {
        //given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(.add)
        
        let expectation = 5.0
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectation)
    }

    func test_2곱하기3과4가_들어있을때_result실행시_결과는6이된다() {
        //given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operators.enqueue(.multiply)
        
        let expectation = 6.0
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2빼기3곱하기4가_들어있을때_result실행시_결과는마이너스4가된다() {
        //given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operators.enqueue(.substract)
        sut.operators.enqueue(.multiply)
        
        let expectation = -4.0
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectation)
    }
}
