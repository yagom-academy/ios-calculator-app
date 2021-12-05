# 📱 계산기 프로젝트 (팀)

- 구현 기간 : 2021.11.22 ~ 26 (1 weeks)
- 팀 프로젝트 (코드 병합 및 리팩터링)

|STEP 1|STEP 2|
|:---:|:---:|
|✅|✅|

## 목차 
- [Step 1](#step-1)
  - [고민된 점 및 해결 방법 1](#고민된-점-및-해결-방법-1)
- [Step 2](#step-2)
  - [고민된 점 및 해결 방법 2](#고민된-점-및-해결-방법-2)
- [학습 키워드](#학습-키워드)


## Step 1 

구현 기간: 2021.11.22 ~ 24


## 고민된 점 및 해결 방법 1

### Model

> 1. linked list

큐 타입구현을 위해서 배열보다 linked list가 삽입, 삭제에 효율적이라 판단해 linked list를 선택했습니다.

> 2. CalculatorItemQueue 이니셜라이저 추가

CalculatorItemQueue를 초기화할 때 요소배열을 받아 생성해주기 위해 이니셜라이저를 추가했습니다.

```swift
init(_ items: [Element] = []) {
    for item in items {
        self.enqueue(item)
    }
}
```    

> 3. Operator내 타입 프로퍼티 추가

Operator의 모든 케이스에 대한 배열의 정보를 가지는 타입 프로퍼티(marks)를 추가했습니다.
parse나 ViewController에서 Operator의 case배열을 필요로하는 곳이 많아 타입 프로퍼티로 제공해주도록 했습니다.

> 4. Decimal

부동소수점으로 인한 부정확한 연산 문제를 해결하기 위해 Decimal타입을 활용하여 연산을 했습니다.

> 5. 0으로 나눌때 에러를 던지는 로직

0으로 나눌 때 `Double.nan`을 반환할 지, 에러를 반환할 지 고민했습니다.
프로젝트 요구사항에서 0으로 나눌 때 에러핸들링을 하라고 명시되어있어 에러를 반환하는 방식으로 구현했습니다.
에러를 던져주는 방식이 해당 메서드를 사용할 때 예외 케이스가 있음을 인지할 수 있는 장점이 있다고 생각했습니다.

> 6. componentsByOperator, parse 로직 수정

`componentsByOperator()`가 operator를 기준으로 문자열을 나누는 기능이라 해석하여, Operator의 allCase를 순회하며 문자열을 분리하도록 로직을 수정했습니다.
그에 따라 `parse()` 메서드도 로직을 수정해주었습니다.


### View

> 1. 스택뷰의 요소를 커스텀 클래스로 구현

스크롤뷰 내 스택뷰에 추가될 스택뷰와 이를 구성하는 UILabel을 커스텀 클래스로 구현했습니다.


### Controller

> 1. 수식 입력 방식 변경에 따른 리팩터링

`[String]`에서 공백으로 구분해주려 했던 방식에서 `String`내 연산자들로 구분해주는 방식으로 변경했습니다.
별도 공백이나 구분자 없이도 주어진 연산자들로 구분을 할 수 있다는 이점이 있다고 생각했습니다.

## Step 2 

구현 기간: 2021.11.24 ~ 26

## 고민된 점 및 해결 방법 2

### Model

> 1. LinkedList tail 구현

기존 LinkedList appendNode 메서드의 시간 복잡도가 `O(n)`이라는 것을 확인하고, LinkedList의 끝 노드를 항상 가지고 있는 tail 프로퍼티를 만들어주어 이를 해결하고자 했습니다. head만 있었을 때는 노드의 개수만큼 끝까지 이동해야했으나, tail을 참조하여 바로 다음 노드에 새로운 노드를 할당하는 방식으로 리팩터링을 진행했습니다.

### View

> 2. `required init(coder: )` 내 메서드

기존에 `required init(coder: )`내에 기본적으로 제공해주는 fatalError를 사용했었으나, 이전에 주셨던 코멘트에 따라 앱이 최대한 종료되지 않는 쪽으로 수정하고자 `super.init(coder: )`로 대체하였습니다.

### ViewController

> 3. CalculatorManager 생성

기존 CalculatorViewController가 가지고 있던 UI와 관련이 없는 로직을 CalculatorManager에게 역할을 넘겨주도록 리팩터링했습니다.
이에 최대한 핵심 로직은 CalculatorManager가 가지고 있게 만들어줌으로써 조금이나마 CalculatorViewController의 역할을 덜어줄 수 있었습니다.

---

# 학습 키워드 

- 공통된 UML 기반의 코드를 합치는 과정
- 서로의 코드를 기반으로 리팩터링하는 과정
- ViewController의 역할 대체 
- required init
