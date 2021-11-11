//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/11.
//

import XCTest

class ExpressionParserTests: XCTestCase {

    var sampleString: String = ""
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSplitByStringExtension() {
        let string = "1+2+3+5"
        XCTAssertEqual(string.split(with: "+"), ["1", "2", "3", "5"])
    }
    
    func testComponentsByOperators() {
        let string = "1.7+4.5-8.9/16.4*28.0"
        XCTAssertEqual(ExpressionParser.componentsByOperators(from: string),
                       ["1.7", "4.5", "8.9", "16.4", "28.0"])
    }

    func testParsingFromString() {
        sampleString = "1.7+3.8-21.9/41.0*310.7"
        var formula: Formula = ExpressionParser.parase(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, ((1.7 + 3.8) - 21.9) / 41.0 * 310.7 )
        } catch let error {
            print(error.localizedDescription)
            XCTFail()
        }
    }
    
    func testParsingFromInvaildString() {
        sampleString = "+1.7+3.8-21.9/41.0**310.7"
        var formula: Formula = ExpressionParser.parase(from: sampleString)
        do {
            let result = try formula.result()
            XCTAssertEqual(result, ((1.7 + 3.8) - 21.9) / 41.0 * 310.7 )
        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}
