
import Foundation

extension String {
    func split(with target: Character) -> [String] {
        var strArray: [String] = []
        var num: String = ""
        self.forEach {
            if $0 != target {
                num = num + String($0)
            } else {
                strArray.append(num)
                num.removeAll()
            }
        }
        strArray.append(num)
        return strArray
    }
}
