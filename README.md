## iOS 커리어 스타터 캠프

### 계산기1
> 프로젝트 기간 2022/05/16 ~ 2022/05/27  
> 팀원: [@bard](https://github.com/bar-d) / 리뷰어: [@Green](https://github.com/GREENOVER)


# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 0](#STEP-0)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
	- [보완할부분](###보완할부분)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)
- [STEP 3](#STEP-3)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)

## `UML`
![Screen Shot 2022-05-17 at 9 38 58 PM](https://user-images.githubusercontent.com/92622931/168812781-53bf0514-8fd4-429d-afc3-f4cc1fc9d0d0.png)  

# 프로젝트 소개
- 계산기의 동작 원리를 이해하고 UML과 TDD, Queue 자료구조에 대한 이해와 구현

# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()


# 키워드  
- `UML`, `TDD`
- `Queue`, `Stack`
- `Array Queue`, `DoubliyLinkedList Queue`, `DoubleStack Queue, RingBuffer Queue`
- `시간복잡도`
# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 09:30 ~ 21:00

[식사 시간]

- 점심 12:30 ~ 13:30
- 저녁 19:00 ~ 20:00



[휴일]

- 휴일따위..


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
- [x] TDD 시작하기
	- [x] 기존의 프로젝트에 Test Target 추가
- [x] Queue 자료구조의 이해와 구현
- [x] List 자료구조 직접 구현해보기(선택)
	- [x] 리스트를 활용하여 Queue 구현(선택)

# [STEP 0]

## 고민한점 
- 계산기의 동작하는 로직을 어떻게 집어넣어야 하나

## 배운개념


# [STEP 1]
## 고민한점 

### `Queue`
- 1. 스위프트에는 `Queue`라는 타입이 없어서 여러 방식으로 구현을 하여 사용을 하는데, `DispatchQueue`같은 클래스는 왜 존재하는지, 특정 케이스에서만 `Queue`가 쓰이도록 구현을 해논것인가?
아니면 구현을 어떻게 하느냐에 따라 쓰이는 용도가 달라서?
	- 그린의 답변  
>학습해보셨다시피 Queue 타입이 딱 지정되어 사용할 수 있게 swift에서는 제공하지 않고 있고 여러 방법으로 구현하고 있습니다.   
  이에 DispatchQueue도 아마 까보시면 해당 용도로 Queue를 구현한것이고 지금 CalculatorItemQueue와 같이 큐의 역할을 한다~ 라고 이름을 붙여준 클래스일것입니다.  
 이를 생각해보면 해당 클래스의 존재여부와는 다를것 같고 큐의 구현이라고 보시면 될것 같아요!
- 여러 종류의 `Queue`구현 타입중에 어떠한 것을 써야 하나?
- 시간 복잡도면에서 어느 것이 성능이 좋은가?

### `TDD`
- `TDD`를 수행하기 전 먼저 `UML`을 작성해놓은 상태
```swift
struct CalculatorItemQueue<Double>: Queue, CalculateItem {  
    var leftStack: Array<Double> = []
    var rightStack: Array<Double> = []
    
    var isEmpty: Bool
    
    var peek: Double?
    
    
    mutating func enQueue(_ double: Double) -> Bool {
        return true
    }
    
    mutating func deQueue() -> Double? {
        return Double?.self as? Double
    }
}
```
- `TDD`는 말 그대로 테스트를 기반으로 하는 코드인데, `UML`을 이미 작성을 해서 `UML`을 토대로 코드의 틀만 짠 상태로 테스트 코드를 진행하는게 맞는 방법인가?
	- 그린의 답변  
> TDD에 대해서 현재 구현해주신 스텝이 맞다고 생각합니다.  
 즉 UML로 모델타입에 대해 정의해주고 이를 테스트 코드를 구현하면서 지금처럼 값을 넣어 정상적으로 구현된 기능 정의인지 확인부터 해보는것이 TDD의 기초 개념이라 생각합니다!  
 이에 지금 전체적인 맥락에서 어긋나는 부분은 없다고 생각합니다😁

## 보완할부분
1. 전체적으로 리뷰 코멘트로도 많이 단 부분이 TDD 쪽인데 전체 흐름 및 개념에 대해서는 어긋나지 않았지만 그 검증을 위한 구현부가 조금 다듬어 지면 좋겠다는 생각이 있어 다시 한번 코멘트를 드립니다🙌  
2. CalculatorItemQueue에 대해 조금 더 확장성 있는 방법을 생각해보면 좋을것 같습니다!  
 더불어 전체적으로 정의된 기능과 프로퍼티들의 실제 사용여부와 메서드 시그니쳐를 한번 더 고민해보면 어떨까해요🤔
3. 리드미를 매 스텝별 작성해보면 분명 분명 큰 도움이 되실거에요😀
4. 브랜치명이 조금 모호한것 같습니다.  
 혼자 작업할때는 문제가 되지 않지만 협업을 고려한다면 ic_6_barrd보다는 step1, step2와 같이 명확한 브랜치를 생성해 관리하는것은 어떨까요?


## 배운개념

# [STEP 2]

## 고민한점




## 배운개념


# [STEP 3]

## 고민한점


## 배운개념





