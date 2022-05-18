import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var doubleList: LinkedList<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        doubleList = LinkedList<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        doubleList = nil
    }
    
    func test_isEmpty_아무노드를넣지않았을때_True를반환하는지() {
        // when
        let result = doubleList.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_add_1을넣으면_lastNode의value기1인지() {
        // given
        let input: Double = 1
        let expectation: Double = 1
        
        // when
        doubleList.add(value: input)
        let result = doubleList.lastNode?.value
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_add_1과2를넣으면_lastNode의value가2인지() {
        // given
        let firstInput: Double = 1
        let secondInput: Double = 2
        let expectation: Double = 2
        
        // when
        doubleList.add(value: firstInput)
        doubleList.add(value: secondInput)
        let result = doubleList.lastNode?.value
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_add_1과2를넣으면_2의previous노드의value가1인지() {
        // given
        let firstInput: Double = 1
        let secondInput: Double = 2
        let expectation: Double = 1
        
        // when
        doubleList.add(value: firstInput)
        doubleList.add(value: secondInput)
        let result = doubleList.lastNode?.previous?.value
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
