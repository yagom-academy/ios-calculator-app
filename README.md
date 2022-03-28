# 계산기 프로젝트
> 프로젝트 기간 2022.03.14 ~ 2022.03.25 </br>
팀원 : [@마이노](https://github.com/Mino777) / 리뷰어 : [@Steven](https://github.com/stevenkim18)

---

<img src="https://user-images.githubusercontent.com/54234176/160284016-53016a35-80d6-4706-af8d-78d48ae772ad.gif" width="250" height="500"/>

---

## 키워드
- Protocols
- Extensions
- Error Handling
- Closures
- Advanced Operators
- Inheritance
- Subscripts
- Queue, DoubleStack
- Unit Test
- UML
- TDD
- UIScrollView
- drawing cycle
- Massive ViewController
- LLDB
- UIStackView

# Ground Rules
- 프로젝트에 집중하는 시간: 10:00 ~ 22:00
- 밥먹는 시간: 12 ~ 14 / 18 ~ 19:30
- 공식적인 휴일: 주말

### 프로젝트 주요 목표
- UML을 토대로 한 TDD 경험
- Protocol 활용
- Testable한 코드 작성

### Commit 제목 규칙
- 기능(feat): 새로운 기능을 추가
- 버그(fix): 버그 수정
- 리팩토링(refactor): 코드 리팩토링
- 형식(style): 코드 형식, 정렬, 주석 등의 변경(동작에 영향을 주는 코드 변경 없음)
- 테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
- 문서(docs): 문서 수정(제품 코드 수정 없음)
- 기타(chore): 빌드 업무 수정, 패키지 매니저 설정 등 위에 해당되지 않는 모든 변경(제품 코드 수정 없음)

## [STEP 1]

## UML

![](https://user-images.githubusercontent.com/54234176/158206284-bd69aab5-20cc-4beb-8f45-0e14fbcc4d66.png)

### 고민한 점 및 궁금한 점
1. 자료구조 결정
- 기획서에 List 자료구조를 활용해 Queue를 구현 해보라는 챌린지가 있었습니다.
- 그래서 조사해보니, 연결 리스트와 더블스택을 활용한 Queue 구현이 가장 자료가 많았습니다.
- 그럼 Array로 구현안하고 왜 굳이 다른 선형 자료구조를 만들어서 구현을 할까 라는 의문점이 생겼습니다.
- Array로 구현할 시, dequeue 기능의 경우 removeFirst메서드의 시간 복잡도가 O(n)이 되어 (앞으로 당겨줘야하는 작업) 이것보다 좀 더 효율적으로 사용할 수 있다 라는 아이디어가 있었습니다.
- 연결 리스트와 더블스택 모두 시간 복잡도는 O(1)로 동일하지만, 공간 복잡도 측면에서 더블스택이 효율적입니다. ( 연결 리스트의 경우 참조를 해야하기 때문에 더블스택에 비해 메모리 접근 시간이 상대적으로 느림 )
- 따라서 더블 스택으로 구현해보기로 결정 해보았습니다.

2. UML
- 기획서에 CalculatorItemQueue의 요소에 CalculateItem 프로토콜을 준수해야 한다는 요구사항이 있었습니다.
- 이렇게 구조체에 채택하지않고, 제네릭 타입에 타입으로써 사용이 되는 경우에는 UML을 어떤식으로 진행하는게 좋을까요? 현재는 일반적인 타입에 프로토콜을 채택하는 실체화 구조로 UML을 그려보았는데 어떤식으로 진행하는게 더 나은 방향일까요?

3. TDD 커밋의 단위, 타이틀
- 원래의 계획으로는 TDD에서 Red, Green 까지 진행 후 test 타이틀로 커밋을 하고 이후에 Blue에서 리팩토링 하는 과정을 최초는 feat, 추후로는 refactor로 진행하려고 했습니다.
- 그런데 진행 하다보니 DoubleStack을 활용한 Queue의 경우 메서드가 굉장히 간단하기 때문에 뭔가 리팩토링을 하려면 좀 억지로 진행을 해야되는 부분이 있었습니다.
- 그래서 우선 test 타이틀로 모두 진행하였는데 이런 경우 어떤식으로 진행을 하는게 더 나은 방향일까요?

### 피드백 및 배운 것
- UML의 경우 팀에서 규칙을 정하기 나름이기 때문에 유연하게 진행하면 된다.
- 앞으로 테스트케이스를 정의하는(네이밍 정의) 부분까지 test로 진행하고, 케이스의 바디를 진행하는것은 결국엔 기능을 만들면서 진행해야 되기 때문에 feat으로 통일.
- getter 프로퍼티를 만드는 경우에 이런식으로 사용.
```swift
private var _property: Int
var property: Int {
    return _property
}
```
- 네이밍시에 조금 더 직관적으로 진행하기 ( front, rear -> first, last )
- if와 guard 사용시에 기존엔 단순하게 Early Exit이 필요한 경우에만 사용했는데, 이 외에도 몇가지 경우를 더 생각해보기. ex) !=는 가독성이 떨어지기 때문에 ==을 사용하기 위해 이에 맞게 if / guard문 사용
- reverse vs reversed
reverse의 경우 배열 안에서 각각의 위치를 변경하여 모든 element의 순서를 교환하기 때문에 O(n)이지만, reversed의 경우 ReversedCollection이라는 기본 컬렉션의 요소를 역순으로 표시해주는 컬렉션으로 현재 배열을 래핑만 해서 역순으로 액세스 할 수 있게 해주기 때문에 O(1)인 것으로 이해했습니다!
- 모든 것엔 이유가 있어야함. 테스트에서 강제 언래핑을 사용하는 이유는 ?를 사용하면 그냥 에러가 나지 않고 해당 케이스가 넘어가져서 실패인데 성공으로 뜨는 경우가 있습니다. 확실한 에러를 파악할때는 강제언레핑이 나은 선택이 될 수도 있습니다.
- 테스트 네이밍 규칙 ~할때 ~해야한다로 통일
- return 값을 사용하지 않아도 warning 메시지가 나오지 않게하는 @discardableResult

## [STEP 2]

### UML
![https://s3.ap-northeast-2.amazonaws.com/media.yagom-academy.kr/resources/6131c8fa2e11413823f8dd7f/6189d7537c82755a83c68a7d.jpg](https://s3.ap-northeast-2.amazonaws.com/media.yagom-academy.kr/resources/6131c8fa2e11413823f8dd7f/6189d7537c82755a83c68a7d.jpg)

### 고민한 점 및 궁금한 점
1.  UML을 토대로 요구사항 파악
- UML만 보고 기능을 명세해야되는 과정을 처음해보다보니 이 부분에서 시간을 가장 많이 쓴 것 같습니다😭
-   `Operator`: 연산자 정의, 매칭 및 실질적인 연산을 담당한다고 생각했습니다.
-   `ExpressionParser`: 표현식을 만드는것과 관련된 메서드를 모아둔 타입이라고 생각했습니다.
    -   `parse`: 계산기에서 사용자가 입력했던 요소들을 해당 메서드를 호출하는 부분에서 저장해두었다가, =을 눌렀을 때 호출하여 input을 받아서 operand, operator를 분리한 후 각 queue에 enqueue해주고 이를 Formular에 주입해서 반환해주는 메서드라고 생각했습니다.
    -   `componentsByOperators`: operand와 operator를 분리해주는 메서드라고 생각했습니다.
-   `Formula`
    -   `result`: 계산기에서 =을 눌렀을 때 큐에 입력된 연산들을 수행하는 메서드라고 생각했습니다.
- 스티븐과 협의 후 추가로 진행한 메서드
- `ExpressionParser`
    - `componentsByOperands`: `componentsByOperators`의 경우 Operand만 뽑아내는 메서드이고, 해당 메서드의 경우 Operator만 뽑아내는 메서드입니다.
    - `makeOperandsQueue`: queue에 enqueue해주는 과정을 분리해주어 반환값으로 `CalculatorItemQueue<Double>`을 반환해줍니다.
    - `makeOperatorsQueue`: queue에 enqueue해주는 과정을 분리해주어 반환값으로 `CalculatorItemQueue<Operator>`를 반환해줍니다.
- `componentsByOperators`의 경우 반환값을 Double로 진행하면 한뎁스를 줄일 수 있지만, 우선 UML을 바꾸지 않는 선에서 진행해보았습니다.

2. TDD
- TDD를 위해 의존성 관계 그래프의 최말단 타입부터 구현 해보았습니다!
    - Operator -> Formula -> ExpressionParser 순
- 이번 스텝에서 TDD를 하면서 왜 개발시간이 훨씬 더 늘어나는지 아주 확실하게 알게 된 것 같습니다😭 그래도 확실히 안정적으로 자신감있게 한줄 한줄 개발할 수 있게 해주는 것은 틀림없는 것 같습니다!
- 요구사항 중 0으로 나누는 경우 에러처리를 진행해줘야 하는 부분이 있었는데, 해당 부분의 경우 Operator에서 부터 계속 진행이 되다보니 모든 단계에서 테스트를 진행하게 되었습니다.
- 이런식으로 중첩되는 테스트의 경우 모든 단계에서 하는것이 맞을까요? 아니면 최상위 메서드에서만 테스트하는게 맞을까요?
- 그런데 생각해보니 TDD의 경우에 해당 테스트를 진행해야 다음 단계로 갈 수 있는 것 같다는 생각이 들어서 모든 단계에서 해주는게 맞는 것 같습니당 스티븐의 생각은 어떠실까요?!

3. 메서드 분리
- 말씀드렸던 `ExpressionParser` 타입에서 최대한 메서드를 분리해보려고 진행을 해보았는데, 뭔가 분리하면 할수록 복잡성이 올라가는 느낌이 드는 것 같습니다. 그런데 분리를 안하면 뭔가 역할이 많아지는 것 같고 그렇습니다😭 조언 부탁드립니당!

감사합니다!!🙇‍♂️


### 피드백 및 배운 것
- https://developer.apple.com/videos/play/wwdc2018/417/
- 항상 무엇이든지 테스트할 때 작은 단위로 시작해서 endtoend 테스트 까지 가야한다.
- 고차함수 사용할 때 축약 쓸 때와 안쓸 때 구분하는 것 생각하면서 사용하기
- 고차함수 장점

좀 더 적은 수의 코드로 동일한 결과를 얻을 수 있습니다.
이번 프로젝트에 쓴거처럼 남용하지 않는다면 가독성도 높일 수 있습니다.
for문 처럼 구문 안에서 변수를 변경하는 작업이 필요없이 완성된 결과를 리턴해주기 때문에 사이드 이펙트도 줄일 수 있을 것 같습니다.
위와 같은 이유 때문에 함수형 프로그래밍을 진행할 때 적극 활용될 수 있을 것 같습니다.
고차함수 단점

남용하는 경우 지금처럼 가독성이 오히려 떨어질 수 있을 것 같습니다.
체이닝이 깊어지는 경우에 컴파일러단에서 최적화가 이루어진다 해도, 만약 for문 한개로 진행할 수 있는 작업의 경우 성능적으로 밀릴 것 같습니다.
map

map의 경우 기존의 Sequence 타입의 데이터를 변형하여 새로운 컨테이너를 생성해 반환해줍니다.

filter

filter의 경우 컨테이너 내부에서 조건에 따라 값을 걸러서 새로운 컨테이너로 추출해줍니다.

compactMap

compactMap의 경우 map과 동일한 작업을 수행하지만, nil이 아닌 요소만 반환해줍니다.

고차함수들을 직접 구현해보았습니다.
```swift
extension Sequence {
    func myMap<T>(conversion: (Element) -> T ) -> [T] {
        var result: [T] = []
        
        self.forEach({ element in
            result.append(conversion(element))
        })

        return result
    }
    
    func myFilter(selected: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        
        self.forEach({ element in
            if selected(element) {
                result.append(element)
            }
        })

        return result
    }
    
    func myCompactMap<T>(conversion: (Element)-> T?) -> [T] {
        var result = [T]()

        self.forEach { element in
            if let convertedEntity = conversion(element) {
                result.append(convertedEntity)
            }
        }

        return result
    }
    
    func myReduce<T>(initValue: T, calculation: (T, Element) -> T) -> T {
        var result: T = initValue

        self.forEach({
            result = calculation(result, $0)
        })

        return result
    }
}
```

- 멤버 변수가 private일시에 initializer도 접근제어레벨이 private이 되어 멤버와이즈 이니셜라이저를 사용하지 못한다
- 테스트 케이스 네이밍 계속 고민해보기
- 테스트 커버리지의 경우 숫자는 신경쓰지 말고, 어디가 테스트가 안되어있는지 확인할 때 사용하기
- 메소드 분리 계속 고민해보기

## [STEP 3]

### 고민한 점 및 궁금한 점
1. ScrollView scroll to bottom
- stackView의 높이가 scrollView의 높이보다 커질 때 자동으로 최하단으로 스크롤 되게끔 구현하였습니다.
- 해당 부분에서 최초로 스크롤이 필요한 조건을 충족할 때 스크롤이 되지 않는 문제가 있었습니다.
- 조사를 해보니, layoutOfNeeded() 라는 메서드를 활용하여 해결하는 방법이 있었고, 해당 메서드로 해결하였습니다.
- 해당 메서드는 main run loop에서 update cycle이 오기 전에 즉시 layoutSubview를 호출하는 메서드라고 이해하였습니다.
- 따라서 애니메이션 같은 이벤트 발생 즉시 값이 변경되어야 하는 곳에 많이 사용된다고 이해하였습니다.

2. 계산을 수행한 뒤 나머지 버튼들을 눌렀을 때 계산기를 초기화하는 과정
- 해당 부분을 위해 계산을 수행할 때 다른 모든 버튼에 액션을 추가해주었습니다.
- 하지만 이런 경우에 한번 계산한 이후에도 계속해서 해당 액션이 호출되는 부분이 있습니다.
- 그래서 초기화 해준뒤 바로 액션을 삭제하려고 시도를 해보았는데, 아직 답을 찾지 못했습니다.

```swift
private func reconfigureAllButton() {
        allButtonComponentExceptEqual.forEach {
            $0.removeTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
        }
    }
```
- 위와 같은 코드로 특정 액션만 삭제하려고 시도해보았으나, touchUPInside와 관련된 이벤트들이 모두 삭제가 되버립니다.
- 혹시 이같은 상황에 특정 액션을 삭제할 수 있을까요?

3. 해당 스텝처럼 UI와 연동하는 부분에 대한 Test
- 이번 스텝처럼 ViewController 작업을 진행하는 경우에 테스트를 어떤식으로 진행해야하는지 궁금합니다.
- UI Test의 경우에 현업에서 자주 하시는지 궁금합니다!

4. UIStackView를 ViewController에서 분리
- ViewController에서 UIStackView에 대한 생성과 세팅을 모두 진행하기 보다는, 최대한 View를 따로 분리해 세팅을 미리 해서 생성만 해서 쓸 수 있도록 분리해보았습니다.

5. Massive ViewController
- 점점 ViewController가 무거워 지는것을 보면서 왜 MVC의 단점으로 꼽히는지 확실하게 체감이 된 것 같습니다.
- 해당 부분을 그나마 조금 보완해보려고 최대한 MARK 주석을 통해 영역을 분리해보았습니다.
- 현재 상황에서 ViewController가 무거워지는걸 보완할 방법이 또 있을까요?

6. 함수형 프로그래밍의 필요성
- 이번 프로젝트를 진행하면서 Side Effect가 정말 무서운것이라는걸 느낀 것 같습니다...!!
- 함수형 프로그래밍에 익숙해지려면 어떤식으로 숙련하는게 좋을까요? 예를 들어 SOLID에서 SRP에 경우 메소드 몇줄, 클래스 몇줄 이런식으로 제한을 둬서 자신만의 안전장치를 만드는 것 처럼 혹시 함수형 프로그래밍도 이런 효율적인 숙련 방법이 있을까요?

7. 디버깅 팁
- 이번에 LLDB를 학습하면서 최대한 활용을 해보려고 했는데, 아직까진 po, e 등 쓰는 것만 쓰게 되는 것 같습니다.
- 혹시 현업에서 자주 쓰이는 명령어나 스티븐만의 디버깅팁이 있을까요?! 궁금합니다😆

### 피드백 및 배운 것
