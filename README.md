# 🏕 iOS 커리어 스타터 캠프

## ➕➖✖️➗ 계산기 프로젝트

> 프로젝트 기간: 2022-03-14 ~ 2022-03-25 (11days)  
팀원: 개인프로젝트 / 리뷰어: [hyunable](https://github.com/hyunable)

## 목차
- [UML](#UML)
- [STEP 1](#STEP-1)
- [STEP 2](#STEP-2)
- [STEP 3](#STEP-3)

## UML
![UML](https://i.imgur.com/m9l0ku9.png)

## STEP 1

### 고민한 점

#### Queue를 구현하는 방법에 대해

> 방법1: 그냥 array 사용

- 장점: 간단함
- 단점: dequeue시 O(n)으로 굉장히 비효율적이어서 탈락

> 방법2: Double Stack Queue 구현

- 장점: 효율적인 큐 구현가능, 비교적 간단함

> 방법3: LinkedList 사용해서 구현

- 장점: 효율적인 큐 구현가능
- 단점: 코드량이 상당히 많음, class인 node와 prev, next를 관리하는 overhead가 있음

2번 3번 둘다 상관 없을것 같아서, 그냥 LinkedList로 해보기로 했습니다

#### 어떤 LinkedList를 사용할지

제가 생각했던 구조는 head와 tail이 있고, dummy node두개가 있는 구조입니다  
처음에는 단방향 연결리스트로 구현하였는데, append 매서드 구현이 불가능하여 양방향 연결리스트로 변경하였습니다  

또한 아직 프로젝트에서 왜 queue를 구현하라고 했는지 이해를 하지 못했습니다
계산기에서 CE를 누르면, 가장 최신 피연산자를 지워야하는데, 오히려 stack이 맞지 않나? 라고 생각했습니다. 추후 프로젝트를 진행하면서 이유를 알게 될것이라고 생각합니다

만약 removeLast() 연산이 추가적으로 필요하다면, 현재 양방향 연결리스트이므로 deque으로의 리팩토링도 훨씬 수월할것 같습니다

#### Node와 LinkedList와 CalculatorItemQueue를 Class 로 할지 Struct로 할지

애플은 기본적으로 struct를 권장하고 있습니다. 그래서 저는 타입을 정할때, 기본적으로는 struct로를 선택하고 무조건 class를 써야하는 이유가 있거나, mutating이 너무 빈번하면 class를 쓰는 편입니다

Node의 경우 struct로로 선언했을때, value타입은 자신과 동일한 타입을 저장프로퍼티로 가질수 없다는 에러가 떴습니다

> The answer is in your question: structs are value types. If you include a substruct B into a struct A, it means, that one object of type A will have a size sizeof(all_other_fields_of_A) + sizeof(B). So, a value type can not be recursive: it would have infinite size.

값 타입의 경우, 자신이 자신을 저장프로퍼티로 가지고 있을 경우, 해당 구조체의 size는 무한이 되어서 그렇다고 합니다..!

LinkedList와 CalculatorItemQueue는 그럴 이유를 전혀 찾지 못해서 둘다 struct로 구현하였습니다

#### TDD 진행방식에 대한 어려움

Node를 만들고, LinkedList와 CalculatorItemQueue를 선언하자 코드 작성순서에 대한 고민이 생겼습니다

Queue에 대한 검증함수를 만들고 싶은데, 그러면 Queue에 대한 테스트 함수를 만든후, Queue에서 함수 작성을 하고, LinkedList에서 함수 작성까지 해야합니다

ex) enqueue에 대해서 검증하고 싶다면..?
- enqueue에 대한 test함수를 만들고
- queue에서 enqueue를 구현하고
- linkedList에서 append를 구현해야 함

중간에 커밋을 끊기도 애매하고(완성되지 않았으므로), 그렇다고 한번에 하자니 이것도 아닌것같고.. ㅠㅠ  
결국 LinkedList를 테스트 함수를 구현하며 TDD로 작성하였고, Queue를 다시 Test 함수를 구현하면서 TDD로 작성하였습니다  
그러다보니 사실상 Queue는 LinkedList를 Wrapping한 형태인데, 검증 코드를 두번씩 작성하는것이 너무 마음에 들지 않았습니다  

요약)
- 검증 코드는 Queue에만 구현하고, 내부적으로 사용하는 LinkedList는 암시적으로 검증되게 하고 싶었습니다(마치 private 매서드 처럼요!)
- 하다보니 위와 같은 이유로 잘 되지 않았습니다.. ㅠㅠ

지금 생각해보니, LinkedList 부터 작성하되, LinkedList에 대해서는 검증함수를 작성하지 말고, Queue를 구현할때, 검증함수를 작성하는 방법도 있었을것 같습니다.

이 부분에 대해 조언을 주실 수 있을까요?

### 피드백 후 개선한 점

- 커밋을 조금더 큰 개념단위로 하기
- LinkedList를 클래스로 변경
- 테스트 코드에서 옵서녈 쓰지 않기
- 테스트 함수의 네이밍

### 배운 개념

- 구조체는 동일한 타입을 저장프로퍼티로 가질 수 없다/ 이유까지
- TDD 작성의 어려움 (현실적으로 왜 완벽할 수 없는지)

## STEP 2

STEP2는 주어진 명세서 대로 코드를 작성하는 것이었습니다

![](https://s3.ap-northeast-2.amazonaws.com/media.yagom-academy.kr/resources/6131c8fa2e11413823f8dd7f/6189d7537c82755a83c68a7d.jpg)

명서세를 이해하는데에만 시간이 꽤 걸렸던것 같습니다.

#### extension String
- `split(with target: Character) -> [String]`: target을 기준으로 split 해주는 함수

#### enum ExpressionParser
- `componentsByOperators(from input: String) -> [String]`: 연산자를 기준으로 구분해주는 함수
- `parse(from input String) -> Formula`: 식 문자열을 받아서 계산을 위한 Formula 구조체를 만드는 함수

#### struct Formula
- `result() throws -> Double`: 연산자큐, 피연산자큐에 있는 걸로 결과를 계산하는 함수

#### enum Operator
- `calculate(lhs: Double, rhs: Double) -> Double`: 외부에서 계산을 위해 호출하는 함수
- `add(lhs: Double, rhs: Double) -> Double`: 더하는 함수
- `subtract(lhs: Double, rhs: Double) -> Double`: 빼는 함수
- `multiply(lhs: Double, rhs: Double) -> Double`: 곱하는 함수
- `divide(lhs: Double, rhs: Double) throws -> Double`: 나누는 함수

### 고민한 점

#### 명세서를 보고 코드 작성하기

가장 고민이 됬던건 다음 연산이 입력됬을때 어떻게 걸러야 할까? 였습니다  
식: `"-1*3+(-2)"`

연산자 +/-와, 부호 +/-를 구분해야 할 필요성이 있었습니다  
그래서 애초에 계산기에서 문자를 하나씩 입력하여 연산문자열을 만들어줄때 사이사이에 공백을 넣어주면 구분이 매우 간단할 것 같았습니다  
식: `"-1 * 3 + -2"`

이렇게 되고 나니, 주어진 함수를 어떤식으로 써야할지 고민했습니다  
`componentsByOperators(from input: String) -> [String]`  
연산자를 기준으로 나눠주는 함수인데, 이미 공백으로 나눠진 값이 들어왔기때문에, 내부에서 split(with: " ") 을 호출하면, 알아서 연산자 기준으로 분리가 되는것을 확인했습니다  
연산자 기준으로 나뉜식: `["-1", "*", "3", "+", "-2"]`

다만 이렇게 되니, componentsByOperators의 용도가 살짝 애매해지는 느낌이 있었습니다.. (굳이 왜만들었을까?)

### 궁금한점

#### 제대로 오류가 던져지는지 테스트 하고 싶을때

잘못된 문자열이거나, 0으로 나눠서특정한 오류가 발생했을때 해당 오류가 잘 발생했는지 확인하고 싶었습니다  
그래서 테스트 코드를 다음과 같이 작성했는데, 이런식으로 하는게 맞을까요?  
(원하는 부분에만 맞는 식을 써놓고, 오류가 안나거나 정상작동하면 무조건 테스트가 실패하게 만들었습니다)  

```swift
    func test_10과0을_divide_Operator로_연산했을때_error가나와야한다() {
        //given
        sut = .divide
        
        //when
        do {
            let _ = try sut?.calculate(lhs: 10, rhs: 0)
            XCTAssertTrue(false)
        } catch (let error as CalculateError) {
            //then
            XCTAssertEqual(CalculateError.divideByZero, error)
        } catch {
            XCTAssertTrue(false)
        }
    }
```

#### 이미 예약어로 지정된 이름 사용하기

operator를 변수이름으로 쓰고 싶었는데 예약어라서 쓰지 못한다는 에러가 났습니다  
그래서 'operator'와 같이 쓰면 쓸수 있다는 법을 알아냈는데, 해당방식이 좋은 방식일까요?  
애초에 예약어는 굳이 이렇게 안쓰는게 좋을거 같은데, 축약을 하지 않고 operator를 대체할 단어를 생각해 내지를 못했습니다  

그래도 oneOperator 이런식으로라도 쓰는게 좋을까요?


### 배운 개념
### 피드백 후 개선한 점

## STEP 3

### 고민한 점
### 배운 개념
### 피드백 후 개선한 점

