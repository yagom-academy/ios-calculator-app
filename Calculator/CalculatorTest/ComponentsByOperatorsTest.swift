//
//  ComponentsByOperatorsTest.swift
//  CalculatorTest
//
//  Created by dhoney96 on 2022/06/02.
//

import XCTest

class ComponentsByOperatorsTest: XCTestCase {
    var sut = "+-*/"
        override func setUpWithError() throws {
            try super.setUpWithError()
            sut = "+-*/"
        }
        
        override func tearDownWithError() throws {
            try super.tearDownWithError()
            sut = " "
        }
        
        func test_더하기연산자를_기준으로_components를호출하면_연산자를기준으로_분리하는가() {
            //given
            let sut = "1+2-3"
            
            //when
            let result = sut.components(separatedBy: "+")
            
            //then
            XCTAssertEqual(result, ["1", "2-3"])
        }
        
        func test_더하기연산자를_기준으로_components를호출하면_다른연산자를기준으로_분리하지않는가() {
            //given
            let sut = "1+2-3"
            
            //when
            let result = sut.components(separatedBy: "+")
            
            //then
            XCTAssertNotEqual(result, ["1+2", "3"])
        }
        
        // 리팩토링으로 인해 유효한 테스트 코드가 하나밖에 없음
        func test_공백을_기준으로_components를호출하면_공백을기준으로_분리하는가() {
            //given
            let sut = "1 + 2 - 3"
            
            //when
            let result = sut.components(separatedBy: " ")
            
            //then
            XCTAssertEqual(result, ["1", "+", "2", "-", "3"])
        }
        
        func test_공백을_기준으로_components를호출하면_다른것을기준으로_분리하지는않는가() {
            //given
            let sut = "1 + 2 - 3"
            
            //when
            let result = sut.components(separatedBy: " ")
            
            //then
            XCTAssertNotEqual(result, ["1+2", "3"])
        }
        
        func test_filter고차함수를이용해_숫자가아닌것을_필터링을하는가() {
            //given
            sut = "1 + 2 - 3"
            
            //when
            let result = sut.filter { $0.isNumber == false }
            
            //then
            XCTAssertEqual(result, " +  - ")
        }
        
        func test_map고차함수를이용해_숫자가아닌것을_다시새로운컨테이너에_매핑을하는가() {
            //given
            sut = "1+2-3"
            
            //when
            let input = sut.filter { ($0.isNumber) == false }
            let result = input.map { String($0) }
            
            //then
            XCTAssertEqual(result, ["+", "-"])
        }
        
        func test_정확히숫자만_잘걸러내고있는가() {
            sut = "1+2- ㅁㄴㅇㄹasdf3"
            
            //when
            let input = sut.filter { ($0.isNumber) == false }
            let result = input.map { String($0) }
            
            //then
            XCTAssertEqual(result, ["+", "-", " ", "ㅁ", "ㄴ", "ㅇ", "ㄹ", "a", "s", "d", "f"])
        }
}
