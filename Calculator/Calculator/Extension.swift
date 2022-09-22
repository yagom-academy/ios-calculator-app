//  Created by hy on 2022/09/22.

extension Double: CalculateItemProtocol {
    
}

extension String {
    func split(with target: Character) -> [String] {
        let subStringArray = self.split(separator: target)
        var stringArray:[String] = []
        
        subStringArray.forEach{
            stringArray.append(String($0))
        }
        return stringArray
    }
}
