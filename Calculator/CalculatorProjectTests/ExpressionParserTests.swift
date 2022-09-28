//  Created by hy on 2022/09/24.

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_함수이름() {
        //given
        //when
        let result = ExpressionParser.parse(from: "4*5/3.0+50")
        //then
        XCTAssertEqual(result, Formula(operands: CalculatorItemQueue<4.0,5.0,3.0,50>, operators: CalculatorItemQueue<"*","/","+"> ))
    }
}
