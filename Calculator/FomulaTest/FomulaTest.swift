//
//  FomulaTest.swift
//  FomulaTest
//
//  Created by unchain123 on 2022/05/20.
//

import XCTest

@testable import Calculator
class FomulaTest: XCTestCase {
    
    var sut: Formula!
    
    override func setUpWithError() throws {
      
        sut = Formula()
    }

    override func tearDownWithError() throws {
        
        sut = nil
    }
    
    func test_1더하기1은_2를반환하는지확인() {
        //given
        let input: Double = 1
        let inputOperator: Character = "+"
        let expeted: Double = 2

        //when
        sut?.operands.enQueue(input)
        sut?.operands.enQueue(input)
        sut?.operators.enQueue(inputOperator)
        let result = sut?.result()
        
        //then
       
        XCTAssertEqual(result, expeted)
    }
    
    func test_2빼기1은_1을반환하는지확인() {
        //given
        let input: Double = 2
        let secondInput: Double = 1
        let inputOperator: Character = "-"
        let expeted: Double = 1
        
        //when
        sut?.operands.enQueue(input)
        sut?.operands.enQueue(secondInput)
        sut?.operators.enQueue(inputOperator)
        let result = sut?.result()
        
        //then
        
        XCTAssertEqual(result, expeted)
    }
    
    func test_2나누기2는_1을_반환하는지확인() {
        //given
        let input: Double = 2
        let secondInput: Double = 2
        let inputOperator: Character = "/"
        let expeted: Double = 1
        
        //when
        sut?.operands.enQueue(input)
        sut?.operands.enQueue(secondInput)
        sut?.operators.enQueue(inputOperator)
        let result = sut?.result()
        
        //then
        
        XCTAssertEqual(result, expeted)
    }
    
    
    func test_2곱하기2는_4를_반환하는지확인() {
        //given
        let input: Double = 2
        let secondInput: Double = 2
        let inputOperator: Character = "*"
        let expeted: Double = 4
        
        //when
        sut?.operands.enQueue(input)
        sut?.operands.enQueue(secondInput)
        sut?.operators.enQueue(inputOperator)
        let result = sut?.result()
        
        //then
        
        XCTAssertEqual(result, expeted)
    }
}
