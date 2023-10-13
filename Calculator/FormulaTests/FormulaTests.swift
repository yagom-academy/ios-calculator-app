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
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [2, 7, 1, 4]), operators: CalculatorItemQueue<Operator>(enqueueBox: [.add, .subtract, .multiply]))
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 32)
    }
    
    func test_Formula의queue요소에2와7과마이너스1이있을때_result호출시_마이너스9가나오는지() throws {
        //given
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [2, 7, -1]), operators: CalculatorItemQueue<Operator>(enqueueBox: [.add, .multiply]))
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, -9)
    }
    
    func test_rhs가dequeue에실패했을때_lhs가rhs에전달되어계산이되는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue<Double>(enqueueBox: [2]), operators: CalculatorItemQueue<Operator>(enqueueBox: [.multiply]))
        let expectedResult: Double = 4
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectedResult)
    }
    
    
    
}

