import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_type() {
        sut.enqueue(NumberItem(value: 10))
        sut.enqueue(OperatorItem(value: +))
        sut.enqueue(NumberItem(value: 20))
        XCTAssertEqual(sut.array.count, 3)
    }
    
    func test_dequeue_and_calculate() {
        sut.enqueue(NumberItem(value: 10))
        sut.enqueue(OperatorItem(value: +))
        sut.enqueue(NumberItem(value: 20))
        
        guard let leftValue = sut.dequeue() as? NumberItem,
              let calculate = sut.dequeue() as? OperatorItem,
              let rightValue = sut.dequeue() as? NumberItem else {
                  return
              }
        
        let result = calculate.value(leftValue.value, rightValue.value)
        
        XCTAssertEqual(result, 30)
    }
}
