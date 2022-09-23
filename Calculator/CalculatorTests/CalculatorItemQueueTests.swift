//  CalculatorTests.swift
//  Created by zhilly on 2022/09/20.

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue가비어있을때_isEmpty가true인지() {
        //given
        
        //when
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_queue를_Double타입으로_빈queue생성할때_Error가안나고_isEmpty가true인지(){
        //given
        
        //when
        let queue = CalculatorItemQueue<Double>()
        
        //then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_queue에_3을push했을때_sut가에러가안나는지() {
        //given
        let element: String = "3"
        
        //when
        sut.push(element)
        
        //then
        XCTAssertNoThrow(sut)
    }
    
    func test_queue에_3을push했을때_isEmpty가false인지() {
        //given
        let element: String = "3"
        
        //when
        sut.push(element)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에_3_6_9를push했을때_isEmpty가False인지() {
        //given
        let elementArray: [String] = ["3", "6", "9"]
        
        //when
        for element in elementArray {
            sut.push(element)
        }
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_queue에_3_6_9를push하고pop을한번했을때_pop된요소가맨앞의값_3과같은값인지() {
        //given
        let elementArray: [String] = ["3", "6", "9"]
        
        //when
        for element in elementArray {
            sut.push(element)
        }
        let result = sut.pop()
        
        //then
        XCTAssertEqual(result, "3")
    }
    
    func test_queue에pop할요소가없을때_nil값을반환하는지() {
        //given
        
        //when
        let result = sut.pop()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에3_6_9를push하고queue의count보다많은pop을했을때_결과가nil이나오는지() {
        //given
        let elementArray: [String] = ["3", "6", "9"]
        
        //when
        for element in elementArray {
            sut.push(element)
        }
        
        var result: String?
        for _ in 1...sut.count + 1 {
            result = sut.pop()
        }
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에1_2_3_4_5를push했을때count값이5인지() {
        //given
        let elementArray: [String] = ["1", "2", "3", "4", "5"]
        
        //when
        for element in elementArray {
            sut.push(element)
        }
        let result = sut.count
    
        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_queue가비어있을때count가0인지() {
        //given
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 0)
    }
}
