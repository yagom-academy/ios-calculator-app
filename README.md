## 계산기 프로젝트 📱

### 0. 목차
- [1. 소개](#1-소개)
- [2. 팀원](#2-팀원)
- [3. UML](#3-uml)
- [4. 타임라인](#4-타임라인)
- [5. 실행 화면](#5-실행-화면)
- [6. 트러블 슈팅](#6-트러블-슈팅)
- [7. 팀 회고](#7-팀-회고)


### 1. 소개
사용자는 계산기 화면을 통해 숫자패드와 기호를 통해 연산을 하는 숫자 계산 결과를 확인할 수 있습니다. 

### 2. 팀원
| [Danny](https://github.com/dannykim1215) |
| --- |
| <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> |

### 3. UML
## 시퀀스 다이어그램
![그림1](https://github.com/dannykim1215/ios-calculator-app/assets/154333967/a67aae78-70d1-43ad-a600-6b013920cf2f)

## 클래스다이어그램
![그림1](https://github.com/dannykim1215/ios-calculator-app/assets/154333967/29b5a471-2b2e-490f-ad1f-2164d9d0654e)


### 4. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.02.06(화) | 팀 그라운드 룰즈 및 계산기 프로젝트 요구사항 파악하기, Unit Test(단위테스트)를 위한 타깃 추가, CalculatorItemQueue, CalculatorItem 파일 생성, Unit Test 초기세팅 추가 |
| 24.02.07(수) | CalculatorItemQueue 구조체 내부의 프로퍼티, 메소드 구현 및 각각의 Unit Test 케이스 추가, 연산을 하는 calculateOperations() 메소드 추가 |
| 24.02.07(수) | STEP1 PR 요청 |
| 24.02.07(수) | CalculatorItemQueue 구조체 내부의 queue라는 변수 네이밍 수정(-> list), CalculatorItemQueue 내부에서는 크게 필요성이 없었던 calculateOperations() 메소드를 삭제 |
| 24.02.08(목) | 필요 없는 코드 주석 제거, 테스트와 어울리지 않는 테스트 케이스 이름 변경 |
| 24.02.11(일) | 계산기 프로젝트 1주차 README 작성 |
| 24.02.13(화) | Extension String 타입의 split() 구현, ExpressionParser 열거형 타입 내부의 parse(), componentByOperators() 구현 |
| 24.02.14(수) | Formula 구조체 타입의 내부 result() 구현, Double 타입 내부 로직 삭제, CalculatoritemQueue 구조체 타입이 Calculatoritem 프로토콜 준수하도록 정의 |
| 24.02.14(수) | CalculatorError 열거형 타입을 생성 후 divideOfZero 추가, Operator 열거형 타입 내부의 calculate, divide 메소드 코드 수정 - do, try, catch문 사용 |
| 24.02.14(수) | STEP2 PR 요청 |
| 24.02.15(목) | Formula 구조체 타입 내부의 result() 메소드의 if 조건부 명확한 표시 수정, 상수를 별도 Constant 열거형 타입을 통해 정의 후 사용 |
| 24.02.15(목) | UnitTest 각 케이스에 dummy 변수를 추가하여 입력받는 데이터를 효율적으로 받을 수 있게 개선, Formula/ExpressionParser/Operator 타입의 UnitTest 생성 및 테스트 진행 |
| 24.02.15(목) | Extension String 타입의 split() 내부 로직 변경, ExpressionParser 열거형 타입 내부 로직 변경, ExpressionParser 구조체 타입 관련 테스트 케이스 리팩토링 |
| 24.02.15(목) | Operator 열거형 타입의 caculate 메소드 리팩토링, Formula 구조체 타입 내부의 result() 리팩토링, STEP2 2차 PR 요청 |


### 5. 실행 화면
- 없음

### 6. 트러블 슈팅
1. Extension String 타입의 확장 메소드 로직 리팩토링 진행
[변경전]
target 매개변수 Operators 데이터가 할당될 것이라고 생각했었기에 아래와 같이 코드 작성하였습니다. 
```swift
extension String {
    func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperands: String = ""

        for i in self {
            if i == target {
                splitString.append(String(i))
            } else {
                splitOperands.append(String(i))
            }
        }

        splitString.append(splitOperands)
            
        return splitString
    }
}
```
[변경후]
target 매개변수가 " " 공백으로 정의를 하고 split 메소드 활용도를 이해하여 다음과 같이 변경하였습니다.
```swift
func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperandsAndOperators: String = ""
        
        for i in self {
            if i == target {
                splitString.append(splitOperandsAndOperators)
                splitOperandsAndOperators = ""
            } else {
                splitOperandsAndOperators.append(String(i))
            }
        }
        
        splitString.append(splitOperandsAndOperators)
            
        return splitString
    }
```

### 7. 팀 회고
#### 우리팀이 잘한 점 😍
- 계산기 프로젝트 STEP PR 요청 및 개선하고자 하였습니다.
- Error Handling을 사용해보고자 시도하였습니다.
- UnitTest를 사용했습니다.

#### 우리팀 개선할 점 🥲
- 고차함수 사용을 못한 점은 아쉬운 부분으로 느껴집니다. 고차함수로 변경이 가능한 부분은 변경해보는 연습이 필요할 것 같습니다. 
- 각각의 Step PR 일정이 계속 미뤄지고 있는 부분을 개선해야 할 부분인 것 같습니다.
- STEP2에서 TDD 진행을 못 했던 부분은 아쉬운 부분입니다.
- CalculatorItemQueue 타입 내부의 리스트 관련 로직을 구성해보는 경험도 필요할 것 같습니다. (Double Stack, LinkedList)

