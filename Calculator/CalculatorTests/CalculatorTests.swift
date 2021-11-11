import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    var testQueue: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testQueue = CalculatorItemQueue()
    }
    
    func test_basicOperandQueueing() {
        testQueue.enqueue(1)
        
        let firstOperand = testQueue.firstNode?.value as? Double
        
        XCTAssertEqual(firstOperand, 1)
    }
    
    func test_operandsQueueing() {
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        testQueue.enqueue(3)
        testQueue.enqueue(4)
        testQueue.enqueue(5)
        testQueue.dequeue()
        testQueue.dequeue()
        testQueue.dequeue()
        
        let operands = testQueue.allItems().map {
            return $0 as? Double
        }
        
        XCTAssertEqual(operands, [4,5])
    }
    
    func test_operatorsQueueing() {
        testQueue.enqueue(Operator.add)
        testQueue.enqueue(Operator.subtract)
        testQueue.enqueue(Operator.divide)
        testQueue.enqueue(Operator.multiply)
        testQueue.dequeue()
        testQueue.enqueue(Operator.add)
        
        let operators = testQueue.allItems().map {
            return $0 as? Operator
        }
        
        XCTAssertEqual(operators, [.subtract,.divide,.multiply,.add])
    }
}
