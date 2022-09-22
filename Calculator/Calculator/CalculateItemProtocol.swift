//  Created by bella on 2022/09/20.

protocol CalculateItemProtocol {
    
}

extension String: CalculateItemProtocol {
    func split(with target: Character) -> [String] {
        let substringArray = self.split(separator: target)
        var stringArray:[String] = []
        
        substringArray.forEach{
            stringArray.append(String($0))
        }
        return stringArray
    }
}

extension Double: CalculateItemProtocol {
    
}
