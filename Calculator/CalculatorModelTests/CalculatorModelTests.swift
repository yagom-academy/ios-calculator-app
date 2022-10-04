//  Created by Aejong on 2022/09/21.

import XCTest
@testable import Calculator

class CalculatorModelTests: XCTestCase {
    var sutByLinkedList: CalculatorItemQueueByLinkedList<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutByLinkedList = CalculatorItemQueueByLinkedList<Double>()
    }
    
    func test_배열의요소가_순서대로linkedList에_append되어야한다() {
        // given
        let input: [Double] = [1,2,3]
        
        // when
        for element in input {
            sutByLinkedList.enqueue(element)
        }
        
        // then
        XCTAssertEqual(sutByLinkedList.linkedList.head?.value, 1)
        XCTAssertEqual(sutByLinkedList.linkedList.tail?.value, 3)
    }
    
    func test_큐에하나의요소를enqueue한후_dequeue가그값을반환해야한다() {
        // given
        let input: Double = 1
        sutByLinkedList.enqueue(input)
        
        // when
        let result = sutByLinkedList.dequeue()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_배열의요소들을enqueue한후_dequeue를호출했을때_가장먼저enqueue된값을반환해야한다() {
        // given
        let input: [Double] = [1, 2, 3]
        for element in input {
            sutByLinkedList.enqueue(element)
        }
        
        // when
        let result = sutByLinkedList.dequeue()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_큐에요소들이enqueue된상태에서_clear함수호출시_isEmpty가true를반환해야한다() {
        // given
        let input: [Double] = [1, 2, 3, 4, 5]
        for element in input {
            sutByLinkedList.enqueue(element)
        }
        
        // when
        sutByLinkedList.clear()
        let result = sutByLinkedList.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
}
