//  Created by bella on 2022/09/20.

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_숫자와연산기호_모두값이있을때_result호출시_연산결과가잘나오는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5,3,1]),
                      operators: CalculatorItemQueue(enqueueStack: [Operator.multiply,Operator.add]))
        //when
        let result: Double = sut.result()
        //then
        XCTAssertEqual(result, 16)
    }
    
    func test_숫자와연산기호가_각각1개씩만있을때_reult호출시_반환값이0인지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5]),
                      operators: CalculatorItemQueue(enqueueStack: [Operator.multiply]))
        //when
        let result: Double = sut.result()
        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_연산기호가_숫자보다많을경우_result호출시_숫자만큼만연산결과가나오는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5,3]),
                      operators: CalculatorItemQueue(enqueueStack:
                                                        [Operator.multiply, Operator.add, Operator.multiply]))
        //when
        let result:Double = sut.result()
        //then
        XCTAssertEqual(result, 15)
    }
    
    func test_연산기호만있을경우_result호출시_0이반환되는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: []),
                      operators: CalculatorItemQueue(enqueueStack:
                                                        [Operator.multiply, Operator.add, Operator.multiply]))
        //when
        let result:Double = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_나누기기호와_남은숫자가0일때_원하는결과를반환하는지() {
        //given
        sut = Formula(operands: CalculatorItemQueue(enqueueStack: [1,0]),
                      operators: CalculatorItemQueue(enqueueStack:
                                        [Operator.divide]))
        //when
        let result:Double = sut.result()
        //then
        XCTAssertEqual(result, 0)
    }
}

