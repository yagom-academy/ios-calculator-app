## 계산기2 - Derrick, Finnn

## [Step 01]

# 공부한 내용
> NaN, ExpressibleByArrayLiteral, UIStackView 

### NaN (feat. NumberFormatter)
> Not a number :
수치 연산을 할 때, 정상적인 값을 얻지 못할 때 출력되는 값
> 일반적으로는 'nan'를 출력하지만, NumberFormetter을 거칠 경우 'NaN'으로 변환된다.

```swift
print(Double.nan) // nan

let numberFormatter = NumberFormatter()
numberFormatter.string(from: NSNumber(Double.nan)) // NaN
```

> NumberFormatter :
숫자를 텍스트로 변환하면서 다양한 포멧 형식을 설정해줄 수 있는 클래스

```swfit
import Foundation

extension Double: CalculateItem {
    func removeTrailingZero() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        // 소숫점 20자리로 제한
        numberFormatter.maximumSignificantDigits = 20
        // 숫자 형식을 demical 로 세팅
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
```

### ExpressibleByArrayLiteral
> 배열 리터럴을 사용할 수 있도록 해주는 기능으로 CalculatorItemQueue<Double>를 Default 값을 빈 배열로 설정하기 위해 사용하였습니다. 


```swift
struct Formula {
    var operands: CalculatorItemQueue<Double> = []
    var operators: CalculatorItemQueue<Operator> = []
}

extension CalculatorItemQueue: ExpressibleByArrayLiteral {
    convenience init(arrayLiteral elements: T...) {
        self.init()
        
        elements.forEach {
            self.enqueue($0)
        }
    }
}
    
```

### CalculatorStackView
> UIStackView내에 생성될 UILabel 파일로 분리하여 진행 하였습니다. 

```swift
final class CalculatorStackView: UIStackView {
    init(`operator`: String?, operand: String?) {
        super.init(frame: .null)
        setLabels(with: `operator`, and: operand)
        setDefaultAttribute()
    }
}
```

