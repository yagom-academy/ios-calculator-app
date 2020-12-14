//
//  Double+cleanValue.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/10.
//

import Foundation

extension Double {
    
    /// 정수로 변환이 가능하면, 소수점 이하를 제거한 문자열로 반환.
    var toString: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    /// String을 Double로 변환할 때, 오차가 발생하게 되는데 이를 정정해주는 함수
    func setPrecision() -> Double {
        let digit = 1e9
        var precisionedNumber = self * digit
        precisionedNumber.round()
        precisionedNumber = precisionedNumber / digit
        return precisionedNumber
    }
}
