//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Kiseok on 2023/10/11.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Formula의queue에요소가있을때_result호출시_순서대로연산이진행되는지() throws {
        //given
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [2, 7, 1, 4], dequeueBox: []), operators: CalculatorItemQueue<Operator>(enqueueBox: [.add, .subtract, .multiply], dequeueBox: []))
        
        //when
        let result = try sut.result()
        
        //then
        XCTAssertEqual(result, 32)
    }
    
    func test_Formula의operands의queue가비어있을때_result호출시_invalidOperandError가나오는지() throws {
        //given
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [], dequeueBox: []), operators: CalculatorItemQueue<Operator>(enqueueBox: [], dequeueBox: []))
        
        //then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.invalidOperandError)
        }
    }
}
