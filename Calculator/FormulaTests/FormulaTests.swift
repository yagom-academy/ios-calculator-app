//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Minseong Kang on 2022/05/27.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: Formula!
    
    // MARK: - Actions
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - result()

    func test_result메서드_2더하기3빼기1곱하기4나누기4는_4가나온다() {
        // given
        let numbersArray = [2.0, 3.0, 1.0, 4.0, 4.0]
        let operatorsArray: [Operator] = [.add, .subtract, .multiply, .divide]
        numbersArray.forEach { sut.operands.enqueue($0) }
        operatorsArray.forEach { sut.operators.enqueue($0) }
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 2+3-1*4/4)
    }
    
    func test_result메서드_0으로_나누는_연산시_infinity가_리턴된다() {
        // given
        let numbersArray = [1.0, 2.0, 3.0, 4.0, 0.0]
        let operatorsArray: [Operator] = [.add, .subtract, .add, .divide]
        numbersArray.forEach { sut.operands.enqueue($0) }
        operatorsArray.forEach { sut.operators.enqueue($0) }
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, Double.infinity)
    }
}
