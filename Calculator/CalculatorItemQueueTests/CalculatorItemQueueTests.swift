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
    
    func test_enqueue_type_두가지_타입으로_성공하는지() {
        sut.enqueue(10)
        sut.enqueue(+)
        sut.enqueue(20)
        XCTAssertEqual(sut.numbers.count, 2)
        XCTAssertEqual(sut.operators.count, 1)
    }
    
    func test_dequeue_and_calculate_addition() {
        sut.enqueue(10)
        sut.enqueue(+)
        sut.enqueue(20)
        sut.enqueue(+)
        sut.enqueue(30)
        
        guard let leftValue = sut.dequeueNumber(),
              let calculation = sut.dequeueOperator(),
              let rightValue = sut.dequeueNumber() else {
                  return
              }
        
        let temp = calculation.operation(leftValue, rightValue)
        
        guard let calculation2 = sut.dequeueOperator(),
              let rightValue2 = sut.dequeueNumber() else {
                  return
              }
        
        let result = calculation2.operation(temp, rightValue2)
        
        XCTAssertEqual(result, 60)
    }
    
    func test_dequeue_and_calculate_division() {
        sut.enqueue(20)
        sut.enqueue(/)
        sut.enqueue(10)
        
        guard let leftValue = sut.dequeueNumber(),
              let calculation = sut.dequeueOperator(),
              let rightValue = sut.dequeueNumber() else {
                  return
              }
        
        let result = calculation.operation(leftValue, rightValue)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_dequeue_and_calculate_값이_2개인_배열에서_실패하는지() {
        sut.enqueue(10)
        sut.enqueue(+)
        
        guard sut.dequeueNumber() != nil,
              sut.dequeueOperator() != nil,
              sut.dequeueNumber() != nil else {
                  return
              }
        
        XCTFail()
    }
    
    func test_calculateAll_0으로_나누기() {
        sut.enqueue(20)
        sut.enqueue(/)
        sut.enqueue(0)
        
        let result = sut.calculateAll()
        
        XCTAssertTrue(result.value.isInfinite)
    }
    
    func test_calculateAll_더하기() {
        sut.enqueue(10)
        sut.enqueue(+)
        sut.enqueue(20)
        sut.enqueue(+)
        sut.enqueue(30)
        
        let result = sut.calculateAll()
        
        XCTAssertEqual(result, 60)
    }
    
    func test_calculateAll_숫자가_부족할때_마지막_연산_생략() {
        sut.enqueue(10)
        sut.enqueue(+)
        sut.enqueue(20)
        sut.enqueue(+)
        sut.enqueue(30)
        sut.enqueue(+)
        
        let result = sut.calculateAll()
        
        XCTAssertEqual(result, 60)
    }
    
    func test_calculateAll_queue가_비었을_때_0을_반환() {
        let result = sut.calculateAll()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_calculateAll_계산후_큐가_비는지_확인() {
        sut.enqueue(10)
        sut.enqueue(+)
        sut.enqueue(20)
        sut.enqueue(+)
        sut.enqueue(30)
        sut.enqueue(+)
        
        let result = sut.calculateAll()
        
        XCTAssertEqual(result, 60)
        XCTAssertTrue(sut.numbers.isEmpty)
        XCTAssertTrue(sut.operators.isEmpty)
    }
}
