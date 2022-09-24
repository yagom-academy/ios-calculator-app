//  OperatorTests.swift
//  Created by zhilly on 2022/09/24.

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue에Operator타입의add가enqueque되었을때_head의데이터가add인지() {
        //given
        let data: Operator = .add
        
        //when
        sut.enqueue(data)
        let result = sut.head?.data

        //then
        XCTAssertEqual(result, Operator.add)
    }
    
    func test_queue에Operator타입의divide와multiply가enqueque되었을때_head의데이터가divide_tail의데이터가multiply인지() {
        //given
        let dataArray: [Operator] = [.divide, .multiply]
        
        //when
        for data in dataArray {
            sut.enqueue(data)
        }
        
        let headDataResult = sut.head?.data
        let tailDataResult = sut.tail?.data
        
        //then
        XCTAssertEqual(headDataResult, Operator.divide)
        XCTAssertEqual(tailDataResult, Operator.multiply)
    }
}
