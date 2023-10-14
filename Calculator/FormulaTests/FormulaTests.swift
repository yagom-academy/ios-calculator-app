//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Charles on 2023/10/10.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_피연산자들과_연산자들이_주어지고_result호출시_결과값은_14와같다() {
        // given
        sut = Formula()
        sut.operands.enqueue(2)
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operands.enqueue(1)
        sut.operators.enqueue(.add)
        sut.operators.enqueue(.multiply)
        sut.operators.enqueue(.subtract)
        
        // when
        let result = try! sut.result()
        
        // then
        XCTAssertEqual(result, 14)
    }
    
    func test_피연산자에_0과_연산자에_나누기가_주어지고_result를호출했을때의_에러는_dividingZero와같다() {
        // given
        sut = Formula()
        sut.operands.enqueue(3)
        sut.operands.enqueue(0)
        sut.operators.enqueue(.divide)
        
        // when
        let result = Result {
            try sut.result()
        }
        
        // then
        switch result {
        case .success(_):
            break
        case .failure(let error):
            XCTAssertEqual(error as? OperateError, OperateError.dividingZero)
        }
    }

}
