//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Minseong Kang on 2022/05/27.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    // MARK: - Properties

    var sut: ExpressionParser!
    
    // MARK: - Actions
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - parse(from:)
    
    func test_parse메서드_input계산식을_계산한_결과가_정확하다() throws {
        // given
        let input = "100+200-150*3/2"
        
        // when
        let parsedFormula = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(try parsedFormula.result(), Double(225.0))
    }
}
