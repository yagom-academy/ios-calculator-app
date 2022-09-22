//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 이경민 on 2022/09/22.
//

/*
 테스트 목적 : Operator의 Calculate 메서드가 잘 동작하는가
 
 1. calculate 메서드를 통해서 연산을 잘 수행하는가?
 */

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!
    override func setUpWithError() throws {
        sut = Operator.allCases.randomElement()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
