//  Created by Aejong on 2022/09/27

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_formula인스턴스생성해준상태로_1_add_2의결과가_3이반환되야한다() {
        // given
        var operands: CalculatorItemQueueByLinkedList<Double> = CalculatorItemQueueByLinkedList()
        var operators: CalculatorItemQueueByLinkedList<Operator> = CalculatorItemQueueByLinkedList()
        
        operands.enqueue(1)
        operands.enqueue(2)
        
        operators.enqueue(.add)
        
        sut = Formula(operands: operands, operators: operators)
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, 3.0)
    }
}
