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
}
