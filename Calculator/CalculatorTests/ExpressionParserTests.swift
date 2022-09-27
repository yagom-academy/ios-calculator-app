//
//  ExtensionParserTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(),
                      operators: CalculatorItemQueue<String>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse메서드에의해_Formula가올바르게초기화되고있는지() {
        // given
        sut.operands.enqueue(1)
        sut.operators.enqueue("-")
        sut.operands.enqueue(3)
        sut.operators.enqueue("+")
        sut.operands.enqueue(2)
        sut.operators.enqueue("-")
        sut.operands.enqueue(3)
        
        // when
        let result = try? ExpressionParser.parse(from: "1-3+2-3").result()
        
        // then
        XCTAssertEqual(try? sut.result(), result)
    }
    
    func test_parse메서드에의해_Formula가올바르게초기화되고_result메서드반환값이nil이아닌지() {
        // given
        // when
        let result = try? ExpressionParser.parse(from: "1-3+2-3").result()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_parse메서드에의해_Formula가올바르게초기화되고_result메서드반환값이올바른지() {
        // given
        // when
        let result = try? ExpressionParser.parse(from: "1-3+2-3").result()
        
        // then
        XCTAssertEqual(result, -3)
    }
}
