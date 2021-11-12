
import Foundation

extension Double {
    
}

extension String {
    func split(with target: Character) -> [String] {
        self.components(separatedBy: String(target)).map{ String($0) }
    }
}
