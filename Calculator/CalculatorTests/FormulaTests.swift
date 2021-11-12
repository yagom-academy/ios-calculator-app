//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 황제하 on 2021/11/11.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자_한개가_입력됐을때_result함수의_결과가_입력한_숫자가_나오는지(){
        // given
        let input = 2.0
        
        // when
        sut.operands.enqueue(value: input)
        
        let result = sut.result()
                
        // then
        XCTAssertEqual(result, input)
    }
    
    func test_숫자_두개와_더하기가_입력됐을때_result함수의_결과가_맞게_나오는지(){
        // given
        let number1 = 2.0
        let number2 = 3.0
        let `operator`: Operator = .add
        
        // when
        sut.operands.enqueue(value: number1)
        sut.operands.enqueue(value: number2)
        
        sut.operators.enqueue(value: `operator`)
        
        let result = sut.result()
                
        // then
        XCTAssertEqual(result, number1 + number2)
    }
    
    func test_숫자_여러개와_여러개의_연산자가_입력됐을때_result함수의_결과가_맞게_나오는지(){
        // given
        let number1 = 2.0
        let number2 = 3.0
        let number3 = 1.0
        let number4 = 5.0
        let number5 = 4.0
        
        let operator1: Operator = .add
        let operator2: Operator = .subtract
        let operator3: Operator = .multiply
        let operator4: Operator = .divide
        
        // when
        sut.operands.enqueue(value: number1)
        sut.operands.enqueue(value: number2)
        sut.operands.enqueue(value: number3)
        sut.operands.enqueue(value: number4)
        sut.operands.enqueue(value: number5)
                
        sut.operators.enqueue(value: operator1)
        sut.operators.enqueue(value: operator2)
        sut.operators.enqueue(value: operator3)
        sut.operators.enqueue(value: operator4)
        
        let result = sut.result()
                
        // then
        XCTAssertEqual(result, 5.0)
    }
}
