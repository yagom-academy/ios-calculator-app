//  Created by Aejong on 2022/09/28

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    func test_문자열로수식을입력받았을때_parse호출및result호출시_피연산자와연산자가분리돼계산되어야한다() {
        // given
        let input = "1 + 2 - 3 * 0"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        var result:Double = 0
        
        do {
            result = try formula.result()
        } catch CalculateError.divideByZero {
            print("0으로 나눌 수 없습니다")
        } catch {
            
        }
        
        // then
        XCTAssertEqual(result, 0)
    }
}
