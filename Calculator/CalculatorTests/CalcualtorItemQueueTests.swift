import XCTest

@testable import Calculator

class CalcualtorItemQueueTests: XCTestCase {
    var operandQueue: CalculatorItemQueue<Double>!
    var operatorQueue: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operandQueue = CalculatorItemQueue()
        operatorQueue = CalculatorItemQueue()
    }
    
    func test_basicOperandQueueing() {
        operandQueue.enqueue(1)
        
        let firstOperand = operandQueue.dequeue()
        
        XCTAssertEqual(firstOperand, 1)
    }
    
    func test_operandsQueueing() {
        var removedItems: [Double?] = []
        
        operandQueue.enqueue(1)
        operandQueue.enqueue(2)
        operandQueue.enqueue(3)
        operandQueue.enqueue(4)
        operandQueue.enqueue(5)
        removedItems.append(operandQueue.dequeue())
        removedItems.append(operandQueue.dequeue())
        removedItems.append(operandQueue.dequeue())
        
        let operandsInQueue = operandQueue.allItems()
        
        XCTAssertTrue(operandsInQueue == [4,5])
        XCTAssertTrue(removedItems == [1,2,3])
    }
    
    func test_operatorsQueueing() {
        var removedItems: [Operator?] = []

        operatorQueue.enqueue(Operator.add)
        operatorQueue.enqueue(Operator.subtract)
        operatorQueue.enqueue(Operator.divide)
        operatorQueue.enqueue(Operator.multiply)
        removedItems.append(operatorQueue.dequeue())
        operatorQueue.enqueue(Operator.add)

        let operatorsInQueue = operatorQueue.allItems()

        XCTAssertTrue(operatorsInQueue == [.subtract,.divide,.multiply,.add])
        XCTAssertTrue(removedItems == [.add])
    }
}


