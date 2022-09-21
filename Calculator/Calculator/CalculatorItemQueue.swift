//  Created by Aejong on 2022/09/21.

struct CalculatorItemQueue: CalculateItem {
    
    var queue: [String] = []
    
    var count: Int {
        return queue.count
    }
    
}
