## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

> 프로젝트 기간 2022/05/30 ~ 2022/06/03  
> 팀원: [@bonf](https://github.com/apwierk2451), [@sookoong](https://github.com/Jeon-Minsu) / 리뷰어: [@찰리](https://github.com/kcharliek)

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)

# 프로젝트 소개
- 계산기 어플리케이션


# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()

# 키워드
- `compactMap`
- `layoutSubviews`, `layoutIfNeeded`
- `removeFromSuperview`
- `LocalizedError`


# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 10 : 00 ~ 22 : 00

[식사 시간]

- 점심 12 : 30 ~ 14 : 00
- 저녁 18 : 00 ~ 19 : 00

[연락이 어려운 시간]

- 없음

[휴일]

- 본프 : 주말
- 수꿍 : 주말


### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
- `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- `docs` = 문서에 변경 사항이 있는 경우
- `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지

# 핵심경험

# [STEP 1]

## 고민한점 
### 1. 계산기 코드 병합 과정

- extension String

> `String` 익스텐션 내 `split` 메서드에 대하여 내부에 `split` 함수를 실행하는 과정은 동일하였으나, `split` 결과값에 대하여 수꿍은 `map` 고차함수를 사용하였고, 본프는 `compactMap` 고차함수를 사용하였습니다. 두 고차함수를 비교해 본 결과, 시간복잡도가 `O(N)`으로 동일하여, 예기치 못한 `nil` 값도 처리할 수 있는 `compactMap`을 사용하는 것이 더욱 적절하다고 판단하였습니다.

- struct Queue

> `Queue` 구현 방식에 있어서 수꿍은 더블스택 구조로 `Queue`를 구현하였고, 본프는 `linked-list` 방식으로 `Queue`를 구현해보았습니다. 두 방법을 비교해본 결과, `linked-list`의 경우, 각각의 노드가 데이터와 참조하는 주소로 이루어져 있기 때문에 연결리스트를 추가할 때 수행하는 동적할당이 상대적으로 큰 메모리를 소모합니다. 이는 공간 복잡도를 크게 하며, 메모리 접근 시간도 더디게 합니다. 반면, 더블스택으로 구현한 큐는 `Array`이기 때문에 요소가 모두 나란히 존재하여 각각의 주소를 참조하기에 요소들이 산개하여 존재하는 연결 리스트보다 공간복잡도가 낮으며, 메모리 접근 속도가 빠릅니다. 추가로, `linked-list`의 `Node`를 클래스로 구현해야하기 때문에 `Queue`도 클래스로 구현되어 더블 스택 구조가 더욱 적절하다고 판단하였습니다.

- struct CalculatorItemQueue

> `Queue` 구조체의 재사용을 위하여 별도로 생성하였고, 더블 스택 구조를 사용하고 있기에 이를 프로퍼티로 갖는 `CalculatorItemQueue`를 새로 생성하였습니다.

- enum Operator

> `Operator` 구현 방식에 있어서 두 사람 모두 비슷하게 코드를 구현하였는데, 본프의 코드에서는 추가적으로 `init`을 해주는 부분이 존재하였습니다. 열거형 내 `init`을 사용하여 `ExpressionParser` 열거형 내 `parse` 메서드 과정에서 `CalculatorItemQueue<Operator>`를 만들어낼 수 있습니다. 기존에는 `CalculatorItemQueue<String>`을 만들어 진행하였는데, 본프의 방법을 이용하면 연산자임을 더욱 직관적이고 확실하게 파악할 수 있기 때문에 본프의 방법을 사용하였습니다.

- enum ExpressionParser

> `ExpressionParser` 열거형 내에서는 전반적으로 차이가 많이 났습니다. 먼저, `componentByOperators`를 다루어보자면, 본프는 공백을 통해 분리하는 `split` 작업 이후 `Map`을 통해 `[String]`을 반환하는 내부 기능으로 구현한 반면, 수꿍은 숫자가 아니고, 숫자 기호가 아닌 경우에 대하여 `filter`를 수행하고, 이를 `Map`을 통해 `[String]`을 반환하도록 구현하였습니다. 메서드명에서 미루어 알 수 있듯, 수꿍의 방식과 같이 연산자를 미리 필터링하는 것이 더욱 적절하다고 판단하였습니다. 다음으로, `parse` 함수에 관하여 본프는 `Formula`를 반환함에 있어서 `enqueue`과정을 진행하지 않고, `Formula` 내부에서 `enqueue`를 진행하도록 구현하였고, 수꿍은 `parse` 과정에서 `enqueue` 과정도 함께 처리하여 `Formula`를 반환했습니다. 이에 `UML`을 근거로, 각각의 숫자와 연산자 큐에 값을 할당하는 작업은 `Formula`에서 이루어지는 것이 더욱 적절하다고 판단하여 본프의 방법을 채택하였습니다. 추가로, `operands` 프로퍼티를 추출하는 과정에서 수꿍은 `map`만을 이용하여 `Double($0)`을 사용시 `??`을 사용해야 되었는데, 본프는 `compactMap`을 사용하여 `??` 사용을 피할 수 있었습니다.

- struct Formula

> `Formula` 구조체 내에서 로직은 두 사람 모두 비슷하게 구현되었으나, 조건 분기에 있어 수꿍의 코드가 분기 처리가 더욱 세분화되어 있다고 판단하여 `result` 함수 내부 기능을 구현함에 있어, 수꿍의 방법을 채택하였습니다. 반면, 프로퍼티 및 이니셜라이저 구성에 있어서 `ExpressionParser`에 연장되는 사안으로, `Formula` 구조체 내에서 `enqueue` 과정을 수행하고 이를 각각 `operands`와 `operators` 프로퍼티에 할당하는 방식은 본프의 방식이 더욱 적절하다 판다하여 이를 따랐습니다.

- enum Constant

> `Constant`은 본프의 방법을 채택한 `changeValueButtonDidTapped` 과정에서 입력되는 버튼의 `CurrentTitle`이 오타로 인하여 혼란을 일으키지 않도록, 열거형을 새로 추가하여 코드 오타를 피할 수 있도록 하였습니다.

- enum CalculatorError

> 에러 처리에 있어서 기본 로직은 더욱 세분화한 수꿍의 로직을 사용하였고, 추가적으로 수꿍이 다루지 않은 에러 케이스에 대하여 본프의 케이스를 추가하였습니다.


- class CalculatorViewController

> `numberButtonDidTapped`, `operatorButtonDidTapped`, `resultButtonDidTapped`
 구현에 있어 둘의 코드가 비슷하였지만, 수꿍의 코드가 함수 단위로 세분화 과정이 잘 구현되어 있다고 판단하여 전체적으로 수꿍의 로직을 사용하였습니다. 물론, 그 내부에서 본프만이 구현한 `isNumberEqualToNaN`에 대한 분기 처리를 추가하고, `makeUIStackView` 과정에서 연산자와 피연산수를 하나의 `string`으로 보내어 `StackView`에 수꿍의 방법과 같이 추가하기 보다는, 두 개의 `operatorLabel`, `operandLabel`을 생성하여 각각 `stackView`에 추가하는 방법이 더욱 스택뷰에 올리는 값을 직관적으로 해주기 때문에 이를 사용하였습니다. `changeValueButtonDidTapped` 버튼에 대하여 함수에 입력 버튼을 복수로 받아 분기처리를 하는 본프의 방식이 더욱 각각의 케이스에 대한 처리를 직관적으로 보여주었기 때문에 이를 채택하였습니다. 또한, 프로퍼티 및 메서드의 네이밍에 있어 본프의 네이밍 방식이 더욱 확실하다고 여겨 이를 바탕으로 네이밍을 진행하였습니다.
<br/>


## 의문점

### 1. 코드 발전

- 현재 병합한 코드에서 더욱 발전시킬 수 있는 방법이 무엇이 있을지 궁금합니다!
<br/>

## 의문점 해결

<br>

## 배운개념
- `compactMap`
- `layoutSubviews`, `layoutIfNeeded`
- `removeFromSuperview`
- `LocalizedError`
<br>


# [STEP 2]

## 고민한점 


## 의문점


## 의문점 해결


## 배운개념
