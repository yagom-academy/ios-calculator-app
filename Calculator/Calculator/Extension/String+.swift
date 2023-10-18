//
//  String+.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/12.
//
import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
    
    func numberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(for: Double(self)) ?? ""
    }
}
