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
}
