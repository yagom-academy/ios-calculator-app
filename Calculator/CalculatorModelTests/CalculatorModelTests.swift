//  Created by Aejong on 2022/09/21.

import XCTest
@testable import Calculator

class CalculatorModelTests: XCTestCase {
    var sutByLinkedList: CalculatorItemQueueByLinkedList<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutByLinkedList = CalculatorItemQueueByLinkedList<Double>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_1_2_3요소가_순서대로linkedList에_append되어야한다() {
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
    
    func test_비어있는list에_1을enqueue한후_dequeue가1을반환해야한다() {
        // given
        let input: Double = 1
        sutByLinkedList.enqueue(input)
        
        // when
        let result = sutByLinkedList.dequeue()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_1_2_3_을enqueue한후_dequeue를호출했을때_1을반환해야한다() {
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
}
