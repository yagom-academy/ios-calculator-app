//
//  String+Extension.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        let string = self.map { $0 }
        var result: [String] = []
        var temp = ""
        
        for element in string {
            if element != target {
                temp += String(element)
            } else {
                result.append(temp)
                temp = ""
            }
        }
        result.append(temp)
        
        return result
    }
}
