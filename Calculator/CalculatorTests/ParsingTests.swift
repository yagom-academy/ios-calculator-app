//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/11.
//

import XCTest

class ParsingTests: XCTestCase {
    var sampleString: String = ""
    
    func testSplitByStringExtension() {
        let string = "1 + 2 - 3 * 5 / 4"
        XCTAssertEqual(string.split(with: " "), ["1", "+" , "2", "-", "3", "*", "5", "/", "4"])
    }

    func testParsing() {
        sampleString = "1.7 + 3.8 − 21.9 ÷ 41.0 × 310.7"
        var formula: Formula = ExpressionParser.parse(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, ((1.7 + 3.8) - 21.9) / 41.0 * 310.7 )
        } catch let error {
            print(error.localizedDescription)
            XCTFail()
        }
    }
    
    func testParsingWithNegative() {
        sampleString = "1.7 + -3.8 − -21.9 ÷ -41.0 × -310.7"
        var formula: Formula = ExpressionParser.parse(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, ((1.7 + -3.8) - -21.9) / -41.0 * -310.7 )
        } catch let error {
            print(error.localizedDescription)
            XCTFail()
        }
    }
    
    func testParsingWithDevidedByZero() {
        sampleString = "1.7 + 3.8 − 21.9 ÷ 0.0 × -310.7"
        var formula: Formula = ExpressionParser.parse(from: sampleString)
        
        XCTAssertThrowsError(try formula.result())
    }
    
    func testParsingWithEmptyQueue() {
        sampleString = ""
        var formula: Formula = ExpressionParser.parse(from: sampleString)
        
        XCTAssertThrowsError(try formula.result()) { error in
            print(error)
        }
    }
    
    func testParsingAndCalculate() {
        sampleString = "0.1 − 0.2"
        var formula: Formula = ExpressionParser.parse(from: sampleString)
        XCTAssertEqual(try formula.result(), -0.1)
    }
}
