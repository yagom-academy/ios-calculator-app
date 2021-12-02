# iOS 커리어 스타터 캠프

## 계산기 프로젝트 저장소

## Contributors

## Reviewer

## 키워드
- 의존성 역전
- 의존성 주입
- 단위 테스트
- TDD
- NumberFormatter
- Extension
- Error Handeling

## UML
![UML class](https://user-images.githubusercontent.com/33091784/141096278-2996dade-cdb3-4cda-94c9-d8e8a669d1e5.png)

## 🤔 고민했던 것 

## 1. 결과를 가져오는 역할의 메서드의 이름을 `get` , `retrieve` 중에서 고민.
    
```swift
    func getCalculationResult(from formula: inout Formula) -> Double {
    	var result = 0.0
    	  do {
    	    try result = formula.result()
        } catch let error as CalculateItemQueueError {
    	    print(error.errorDescription)
        } catch {
    	    print(error)
        }
        return result
    } 
```
    
- 위 메서드에서 `get` 를 사용할지 `retrieve` 를 사용할지 고민하다가 `retrieve` 는 원래 갖고있던걸 다시 가져오는 의미가 포함되어 있는것 같고, `get` 는 한번만 가져오는 의미가 있는것 같아서 `get` 를 사용.
- 
## 2. `Calculatable` 프로토콜 사용.
- `CalculationViewController` 가 너무 크고, 하는 일이 많은것 같아서 계산하는 기능만 따로 `Calculator` 타입으로 분리.
- 처음에는 `Calculator` 를 `CalculationViewController` 내에서 중첩 타입으로 사용했었는데, 결합도를 낮추면서 testability를 올리기위해서 `Calculatable` 프로토콜로 기능을 분리하려고 노력.
- 그리고 단위 테스트를할때는 `Calculatable` 프로토콜에 대해서만 진행.
    
```swift
    protocol Calculatable {
        var formulaStack: [String] { get set }
    }
    
    extension Calculatable {
        func calculateResult() -> Double {
            let equationString = formulaStack.filter { $0 != "" }
                .joined()
            var formula = ExpressionParser.parse(from: equationString)
            let result = getCalculationResult(from: &formula)
            return result
        }
    
        func getCalculationResult(from formula: inout Formula) -> Double {
            var result = 0.0
            do {
                try result = formula.result()
            } catch let error as CalculateItemQueueError {
                print(error.errorDescription)
            } catch {
                print(error)
            }
            return result
        }
    }
```
    
- **그런데** `Calculator` 타입이 `Model` 의 일부라고 판단을 하게돼서 뷰컨트롤러에서 빼게 됐는데, `Calculatable` 이 하는 역할이 없어진것 같아서 남겨둘지 말아야될지 고민.
- 테스트를할때 `Calculator` 에 대해서만 진행하면, 테스트에는 필요없는 부분들까지 가져가야한다는 단점이 있다고 생각함.
- 그래서 그냥 계산이 제대로 작동되는지만 확인하면 될것 같아서 `Calculatable` 을 채택한 `MockCalculator` Test double을 만들어서 테스트 진행.
    
## 4. 뷰컨트롤러와 모델타입의 의존성  문제


## 5. 커스텀한 `NumberFormatter` 를 재사용하는 방법에 대해서 고민.
- `NumberFormatter` 의 인스턴스를 코드 곳곳에서 사용해야되는데, 적절하게 재사용하기 위해서 어떤 방법이 있는지 고민.
    
```swift
enum NumberFormatterGenerator {
   static func createNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
            
        return numberFormatter
    }
}
```
    
- 이런식으로 원하는 속성값들을 갖고있는 `NumberFormatter` 를 리턴하는 `static` 메서드를 생성.
- 그래서 `NumberFormatter` 가 필요한 곳마다 위의 메서드를 호출해서 인스턴스를 만들어서 사용.

## 트러블슈팅



