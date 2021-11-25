import XCTest

class CalculatorItemQueueUnitTest: XCTestCase {
    var operandQueueUnderTest: CalculatorItemQueue<Double>!
    var operatorQueueUnderTest: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operandQueueUnderTest = CalculatorItemQueue<Double>()
        operatorQueueUnderTest = CalculatorItemQueue<Operator>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operandQueueUnderTest = nil
        operatorQueueUnderTest = nil
    }

    func test_빈_큐에_1을_enqueue하면_1이_남는다() {
        //given
        let input: Double = 1
        
        //when
        operandQueueUnderTest.enqueue(input)
        guard let result = operandQueueUnderTest.dequeue() else { return }
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈_큐에_1과_2를_enqueue하면_1과_2가_남는다() {
        //given
        let firstInput: Double = 1
        let secondInput: Double = 2
        
        //when
        operandQueueUnderTest.enqueue(firstInput)
        operandQueueUnderTest.enqueue(secondInput)
        guard let firstResult = operandQueueUnderTest.dequeue() else { return }
        guard let secondResult = operandQueueUnderTest.dequeue() else { return }
        
        //then
        XCTAssertEqual(firstResult, 1)
        XCTAssertEqual(secondResult, 2)
    }
    
    func test_빈_큐에_더하기를_enqueue하면_더하기가_남는다() {
        //given
        let input: Operator = .add
        
        //when
        operatorQueueUnderTest.enqueue(input)
        guard let result = operatorQueueUnderTest.dequeue() else { return }
        
        //then
        XCTAssertEqual(result, .add)
    }
    
    func test_1과_2와_3이_있는_큐를_dequeue하면_1이_나온다() {
        //given
        let firstInput: Double = 1
        let secondInput: Double = 2
        let thirdInput: Double = 3
        
        //when
        operandQueueUnderTest.enqueue(firstInput)
        operandQueueUnderTest.enqueue(secondInput)
        operandQueueUnderTest.enqueue(thirdInput)
        guard let result = operandQueueUnderTest.dequeue() else { return }
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈_큐에_dequeue을_하면_에러가_난다() {
        //when
        let result = operandQueueUnderTest.dequeue()
        
        //then
        XCTAssertNil(result)
    }

    func test_1과_2가_있는_큐의_모든_요소를_제거하면_빈_큐가_된다() {
        //when
        operandQueueUnderTest.removeAll()
        
        //then
        let result = operandQueueUnderTest.dequeue()
        XCTAssertNil(result)
    }
}
