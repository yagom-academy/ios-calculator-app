//
//  Addable.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

protocol Addable {
    associatedtype T = Numeric
    
    func add(_ operatedNumber: T, and operatingNumber: T)
}

extension Addable {
    func add(_ operatedNumber: T, and operatingNumber: T) -> T {
        return operatedNumber + operatingNumber
    }
}
//10분남음
//미안해요.. 에어팟이 말썽이야.. 익쓰텡션!!!이요!!
// 5분 남음
// 이거 끝나고 화장실점.
// 라져
