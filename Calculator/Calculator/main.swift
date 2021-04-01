//
//  main.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

print("사용할 진법을 선택하세요...")
print("1. Decimal")
print("2. Binary")
print(": ", terminator: "")
let numeralSystem = Int(readLine()!)!

Calculator().run(NumeralSystem(rawValue: numeralSystem)!)
