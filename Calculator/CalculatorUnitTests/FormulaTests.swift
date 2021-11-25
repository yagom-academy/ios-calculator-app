import XCTest

class FormulaTests: XCTestCase {
    /**
     테스트 케이스 (수식, 결과)
     1. ("10000000000÷3", 10000000000 / 3),
     2. ("10000000000÷3×3", 10000000000 / 3 * 3),
     3. ("12+-3÷-2−0.05", 12 + (-3) / (-2) - 0.05),
     4. ("3÷0×3−5×-0.05", 3 / 0 * 3 * (-5) - 0.05),
     5. ("132+43÷-42×3−56×-0.05", 132.0 + 43.0 / (-42.0) * 3.0 - 56.0 * (-0.05))
     */
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: .init(), operators: .init())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result호출시_1번수식에대해서_올바른결과가나오는지() {
        //given
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandQueue.enqueue(10000000000)
        operatorQueue.enqueue(Operator(rawValue: "÷")!)
        operandQueue.enqueue(3)
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let expectedResult: Double = 10000000000 / 3
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectedResult)
    }
    func test_result호출시_2번수식에대해서_올바른결과가나오는지() {
        //given
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandQueue.enqueue(10000000000)
        operatorQueue.enqueue(Operator.divide)
        operandQueue.enqueue(3)
        operatorQueue.enqueue(Operator.multiply)
        operandQueue.enqueue(3)
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let expectedResult: Double = 10000000000 / 3 * 3
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectedResult)
    }
    func test_result호출시_3번수식에대해서_올바른결과가나오는지() {
        //given
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandQueue.enqueue(12)
        operatorQueue.enqueue(Operator.add)
        operandQueue.enqueue(-3)
        operatorQueue.enqueue(Operator.divide)
        operandQueue.enqueue(-2)
        operatorQueue.enqueue(Operator.subtract)
        operandQueue.enqueue(0.05)
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let expectedResult: Double = (12 + (-3)) / (-2) - 0.05
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectedResult)
    }
    func test_result호출시_4번수식에대해서_올바른결과가나오는지() {
        //given
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandQueue.enqueue(3)
        operatorQueue.enqueue(Operator.divide)
        operandQueue.enqueue(0)
        operatorQueue.enqueue(Operator.multiply)
        operandQueue.enqueue(3)
        operatorQueue.enqueue(Operator.multiply)
        operandQueue.enqueue(-5)
        operatorQueue.enqueue(Operator.subtract)
        operandQueue.enqueue(0.05)
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        //when
        let result = sut.result()
        //then
        XCTAssertTrue(result.isNaN)
    }
    func test_result호출시_5번수식에대해서_올바른결과가나오는지() {
        //given
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandQueue.enqueue(132.0)
        operatorQueue.enqueue(Operator.add)
        operandQueue.enqueue(43.0)
        operatorQueue.enqueue(Operator.divide)
        operandQueue.enqueue(-42.0)
        operatorQueue.enqueue(Operator.multiply)
        operandQueue.enqueue(3.0)
        operatorQueue.enqueue(Operator.subtract)
        operandQueue.enqueue(56.0)
        operatorQueue.enqueue(Operator.multiply)
        operandQueue.enqueue(-0.05)
        
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let expectedResult: Double = ((132.0 + 43.0) / (-42.0) * 3.0 - 56.0) * (-0.05)
        //when
        let result = sut.result()
        //then
        XCTAssertEqual(result, expectedResult)
    }
}

