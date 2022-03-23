//
//  Double+Extension.swift
//  Calculator
//
//  Created by Lingo on 2022/03/15.
//

import Foundation

extension Double: CalculateItem {
  
  func formatString() -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 20
    formatter.roundingMode = .halfUp
    return formatter.string(for: self)
  }
}
