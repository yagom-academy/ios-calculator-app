//
//  StringTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/13.
//

import XCTest
@testable import Calculator

class StringTests: XCTestCase {
    
    func test_플러스_character를_가지고_split하면_플러스기준으로_앞뒤_String을_배열로_반환한다() {
        let stringValue: String = "15*-1+0.4"
        
        let result = stringValue.split(with: Operator.add.rawValue)
        
        XCTAssertEqual(result, ["15*-1","+","0.4"])
    }
    
    func test_마이너스_character를_가지고_split하면_마이너스기준으로_앞뒤_String을_배열로_반환한다() {
        let stringValue: String = "15−-1+0.4"
        
        let result = stringValue.split(with: Operator.substract.rawValue)
        
        XCTAssertEqual(result, ["15","−","-1+0.4"])
    }
    
    func test_두개의마이너스를_가진_string을_split하면_모든마이너스기준으로_앞뒤_String을_배열로_반환한다() {
        let stringValue: String = "15−-1+0.4−8"
        
        let result = stringValue.split(with: Operator.substract.rawValue)
        
        XCTAssertEqual(result, ["15","−","-1+0.4","−","8"])
    }
}
