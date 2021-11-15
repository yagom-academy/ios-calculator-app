//
//  StringExtensionTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/16.
//

import XCTest

class StringExtensionTests: XCTestCase {
    var sut: String = ""
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_문자열_1더하기2가_연산자를_제외하고_배열로_반환되는지() {
        let input = "1+2"
        let result = input.split(with: "+")
        
        XCTAssertEqual(result, ["1", "2"])
    }
    
    func test_여러문자열이_연산자를_제외하고_배열로_반환되는지() {
        let input = "2+3+4+6+7"
        let result = input.split(with: "+")
        
        XCTAssertEqual(result, ["2", "3", "4", "6", "7"])
    }
    
    func test_연산자가_여러개일때_타겟연산자를_제외하고_문자열로_반환하는지() {
        let input = "2+3-4*6/7+8"
        let result = input.split(with: "+")
        
        XCTAssertEqual(result, ["2", "3-4*6/7", "8"])
    }
}
