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
    
    func test_enqueue_type_두가지_모두_성공하는지() {
        sut.enqueue(NumberItem(value: 10))
        sut.enqueue(OperatorItem(operation: +))
        sut.enqueue(NumberItem(value: 20))
        XCTAssertEqual(sut.array.count, 3)
    }
    
    func test_dequeue_and_calculate_addition() {
        sut.enqueue(NumberItem(value: 10))
        sut.enqueue(OperatorItem(operation: +))
        sut.enqueue(NumberItem(value: 20))
        
        guard let leftValue = sut.dequeue() as? NumberItem,
              let calculation = sut.dequeue() as? OperatorItem,
              let rightValue = sut.dequeue() as? NumberItem else {
                  return
              }
        
        let result = calculation.operation(leftValue.value, rightValue.value)
        
        XCTAssertEqual(result, 30)
    }
    
    func test_dequeue_and_calculate_division() {
        sut.enqueue(NumberItem(value: 20))
        sut.enqueue(OperatorItem(operation: /))
        sut.enqueue(NumberItem(value: 10))
        
        guard let leftValue = sut.dequeue() as? NumberItem,
              let calculation = sut.dequeue() as? OperatorItem,
              let rightValue = sut.dequeue() as? NumberItem else {
                  return
              }
        
        let result = calculation.operation(leftValue.value, rightValue.value)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_dequeue_and_calculate_값이_2개인_배열에서_실패하는지() {
        sut.enqueue(NumberItem(value: 10))
        sut.enqueue(OperatorItem(operation: +))
        
        guard let leftValue = sut.dequeue() as? NumberItem,
              let calculation = sut.dequeue() as? OperatorItem,
              let rightValue = sut.dequeue() as? NumberItem else {
                  return
              }
        XCTFail()
    }
}
