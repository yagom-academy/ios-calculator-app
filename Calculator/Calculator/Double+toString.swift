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
}
