
//  Created by hy on 2022/09/19.


import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
//    func test_enqueue에값이잘들어가는지() {
//        //given
//        let input = 2
//        //when
//        let result = sut.enqueue(element: input)
//        //then
//        XCTAssertEqual(result, [2])
//    }
    
    func test_카운트() {
        //given
        let input = [1,2]
        //when
        let result = sut.count(of: input)
        //then
        XCTAssertEqual(result, 2)
        
    }
}

