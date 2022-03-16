import Foundation

struct CalculatorItemQueue<item: CalculateItem> {
    var enqueuList: [item]
    var dequeuList: [item]
}
