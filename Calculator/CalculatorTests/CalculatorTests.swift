//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Yejin Hong on 2024/02/05.
//

import XCTest
@testable import Calculator

enum MyError: Error {
    case someExpectedError
    case someUnExpectedError
}

func functionThatThrows() throws {
    throw MyError.someExpectedError
}

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        //각각의 테스트 메서드가 실행되기 전 말그대로 setup 해주는 코드
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        // 각각의 유닛 테스트가 끝난 후 테스트 값을 처리
        sut = nil
    }

    func test_Queue의사이즈가Enqueue한만큼늘어났다면_True를_반환한다() {
        let expectation = 5
        let input = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        for number in input {
            sut.enqueue(number)
        }
        
        XCTAssertEqual(sut.size, expectation)
    }
    
    func test_Queue을모두Dequeue하였을때isEmpty를만족시키면_True를_반환한다() throws {
        let size = sut.size

        if size == 0 {
            print("list의 사이즈가 0")
            return
        }
        
        XCTAssertThrowsError(try functionThatThrows()) { error in
            for _ in 0...size-1 {
                let dequeuedNumber = sut.dequeue()
            }
            
            XCTAssertEqual(error as! MyError, MyError.someExpectedError)
        }
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_Queue를clear한경우isEmpty를만족시키면_True를_반환한다() {
        let input = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        for number in input {
            sut.enqueue(number)
        }
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty)
    }
}
