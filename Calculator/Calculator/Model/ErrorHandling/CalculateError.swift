
import Foundation

enum CalculateError: LocalizedError {
    case divideByzero
    
    var errorDescription: String? {
        switch self {
        case .divideByzero: return "값을 0으로 나눌 수 없습니다."
        }
    }
    
}
