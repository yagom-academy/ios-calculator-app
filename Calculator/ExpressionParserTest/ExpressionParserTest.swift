//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 서현웅 on 2022/09/28.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {

    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_componentsByOperators_실행시_숫자값이배열로반환되는가() {
        // given
        let input = "45+1-31*59/30"
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        // then
        XCTAssertEqual(result, ["45","1","31","59","30"])
    }
    
    // 이 테스트코드는 임시로 둔 것 입니다. 해당 문제를 어떻게 해결해야할건지 고민필요 //
    // 현재 저의생각으로서 계산기의 '+/-' 버튼을 눌렀을 때, 숫자 앞에 m을 추가시킴. //
    // m % 2 == 0 이면 양수 , m % 2 == 1 이면 음수 취급                 //
    func test_componentsByOperators_실행시_음수값넣었을때숫자값이배열로반환되는가() {
        // given
        let input = "45-m3"
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        // then
        XCTAssertEqual(result, ["45","m3"])
    }
    
    
    func test_parse_호출시_formula_숫자는_정상반환되는가() {
        // given
        let input = "44+33-13*18"
        // when
        let inputParser = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(inputParser.operands.queue, [44.0,33.0,13.0,18.0])
    }
    
    func test_parse_호출시_formula_연산자는_정상반환되는가() {
        // given
        let input = "44+33-13*18"
        // when
        let inputParser = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(inputParser.operators.queue, [.add, .subtract, .multiply])
    }

}
