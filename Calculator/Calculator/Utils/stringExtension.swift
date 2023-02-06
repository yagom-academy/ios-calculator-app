//
//  stringExtension.swift
//  Calculator
//
//  Created by 천승현 on 2023/02/06.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func convertToDouble(appending number: String = "") -> Double {
        let addedNumber = (self + number).filter { $0 != "," }
        guard let doubleNumber = Double(addedNumber) else { return .zero }
        return doubleNumber
    }
}
