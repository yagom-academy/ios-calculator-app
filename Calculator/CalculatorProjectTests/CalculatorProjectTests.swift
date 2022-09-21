//  Created by bella on 2022/09/20.

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_한개의값을_enqueue로_값이_잘들어가는지() {
        //given
        let input = 2
        //when
        let result = sut.enqueue(element: String(input))
        //then
        XCTAssertEqual(result, ["2"])
    }
    
    func test_여러개의값을_enqueue로_값이_순차적으로들어가는지() {
        //given
        let input1 = "2"
        let input2 = "3"
        //when
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        //then
        XCTAssertEqual(sut.enqueueStack, [input1, input2])
    }
    
    func test_큐값이있을때_dequeue로_제일먼저넣어준값이_반환되는지() {
        //given
        let input1 = "3"
        let input2 = "+"
        let input3 = "4"
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        sut.enqueue(element: input3)
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, "3")
    }

    func test_큐값이있을때_dequeue호출시_dequeueStack배열의카운트가_줄어드는지() {
        //given
        let input1 = "3"
        let input2 = "+"
        let input3 = "4"
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        sut.enqueue(element: input3)
        //when
        sut.dequeue()
        let result = sut.dequeueStack.count
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_큐값이있을때_count로_값을_잘세어주는지() {
        //given
        let input1 = "2"
        let input2 = "3"
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        //when
        let result = sut.enqueueStack.count
        //then
        XCTAssertEqual(result, 2)
    }

    func test_큐값이있을때_isEmpty호출시_false가반환되는지() {
        //given
        let input1 = "2"
        sut.enqueue(element: input1)
        //when
        let result = sut.isEmpty()
        //then
        XCTAssertFalse(result)
    }

    func test_큐값이없을때_isEmpty호출시_true가반환되는지() {
        //given
        //when
        let result = sut.isEmpty()
        //then
        XCTAssertTrue(result)
    }

    func test_큐값이있을때_clear로_enqueueStack의_모든값이_지워지는지() {
        //given
        let input1 = "3"
        let input2 = "+"
        let input3 = "4"
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        sut.enqueue(element: input3)
        //when
        sut.clear()
        //then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_큐값이있을때_peek로_dequeuStack에서_마지막값이_삭제되지않고_반환되는지() {
        //given
        let input1 = "3"
        let input2 = "+"
        let input3 = "4"
        sut.enqueue(element: input1)
        sut.enqueue(element: input2)
        sut.enqueue(element: input3)
        //when
        let result1 = sut.peek()
        let result2 = sut.count()
        //then
        XCTAssertEqual(result1, "3")
        XCTAssertEqual(result2, 3)
    }
}

