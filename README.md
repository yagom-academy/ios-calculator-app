# 계산기 프로젝트
## 프로젝트 개요
> 아이폰 기본 계산기에 스크롤 뷰를 더한 계산기 앱
> 사칙연산 미적용.
> 
> 프로젝트 인원: [Brody](https://github.com/seunghyunCheon), [레옹아범](https://github.com/fatherLeon)
> 프로젝트 기간: 2023.02.06 ~ 2023.02.09

<br/><br/>

## 목차
- [프로젝트구조](#✍🏻-프로젝트-구조)
- [타임라인](#⏰-타임라인)
- [기능 설명](#✨-기능-설명)
- [트러블 슈팅](#⚒️-트러블-슈팅)
- [참고 자료](#📑-참고-자료)
<br/><br/>
## ✍🏻 프로젝트 구조
<details><summary><big>폴더 구조</big></summary>
    
```
├── Protocol
|   └── CalculatorItem
├── Extension
|   ├── StringExtension
|   ├── ScrollViewExtension
|   └── DoubleExtension
├── Model
|   ├── DataStructure
|   |   ├── CalculatorItemQueue
|   |   ├── LinkedList
|   |   └── Node
|   ├── Operator
|   ├── CalculatorProcessor
|   ├── Formula
|   ├── Sign
|   └── Obervable
├── ViewController
|   └── CalculatorViewController
└── View
    ├── Main
    └── CalculatorStackView

```

</details>

</br>

<details><summary><big>UML</big></summary>

<img src="https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/UML.png?raw=true"/>
   
</details>

<br/><br/> 

## ⏰ 타임라인
#### 진행기간: 23.02.06(월) ~ 23.02.9.(목)

> 시간 순으로 프로젝트의 주요 진행 척도를 표시
> - 23.02.06(월): 코드 병합
> - 23.02.07(화): 테스트코드 작성
> - 23.02.08(수): 병합 코드 리팩토링
> - 23.02.09(목): 코드 리팩토링


<br/><br/>


## ✨ 기능 설명

|연산 실행(=)|다항 연산(=)|나누기0을 할 경우 처리|
|---|---|---|
|![normal](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/기본연산.gif?raw=true)|![다항연산](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/다항연산.gif?raw=true)|![나누기0](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/나누기0.gif?raw=true)|

|계산 이후 수정불가|불필요한 숫자 표시 제거|AC&CE버튼 구현|
|---|---|---|
|![수정불가](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/계산이후수정불가.gif?raw=true)|![불필요숫자제거](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/불필요한숫자표시제거.gif?raw=true)|![AC&CE](https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/기능사진/AC&CE.gif?raw=true)|

<br/><br/><br/>

## ⚒️ 트러블 슈팅
### 코드 병합 방식
#### 1️⃣ 코드 병합 방식
* 코드의 병합방식으로 기존의 완성된 코드가 있는 브랜치에서 병합을 하는 방식, 비어있는 브랜치에서 병합을 하는 방식 둘 중 하나를 고민했습니다
* 다만, 메소드마다 변수마다 병합을 하는게 아닌 파일 단위로 병합을 하는게 구조상으로 더 좋을것 같다는 합의가 있어서 비어있는 브랜치에서 병합을 하는 방식으로 선택했습니다


<img src="https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/코드병합방식.png?raw=true"/>

* 기존 비어있는 Main브랜치에서 개발을 진행할 브랜치 `Calculator2-step1`을 만들고 해당 브랜치를 통해 각각의 기능 브랜치를 만들어 Pull Request를 보내 Merge하고 다시 브랜치를 생성하는 방향으로 코드 병합을 진행하였습니다

</br>

### 2️⃣ Observable 사용

#### Obervable 사용 전
기존에는 `ViewController`내의 객체에 의해 라벨을 업데이트 시키기 위해 클로저를 전달해서 객체의 프로퍼티가 변경되었을 때 클로저에 값을 전달해 라벨을 업데이트 했습니다.
```swift
class CalculatorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorProcessor = CalculatorProcessor(updateClosure: { text in
            self.enteringNumberLabel.text = text == Sign.empty ? Sign.zero : text
        })
}

class CalculatorProcessor {
    private var labelUpdateClosure: (String) -> Void
    
    init(updateClosure closure: @escaping (String) -> Void) {
        self.labelUpdateClosure = closure
    }
}
```

하지만 `CalculatorChecker`내부에서 클로저 변수를 가지고 있는 것이 계산기의 핵심로직에 대한 책임 뿐만 아니라 `view`를 직접 업데이트하는 책임까지 가지고 있다고 생각해 이를 위임할 수 있는 객체를 만들어 책임을 분리해야겠다고 생각했습니다.

#### Observable 사용 후
라벨을 업데이트하는 클로저를 `Obervable`이라는 클래스에 위임해서 책임을 분리했습니다. `Observable`은 제네릭타입으로 설정해 여러 타입을 받을 수 있도록 만들었습니다.
```swift
final class Observable<T> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(closure: @escaping (T) -> Void) {
        self.closure = closure
    }
}


class CalculatorProcessor {
    var enteringNumberObservable: Observable<String> = Observable(Sign.empty)
    var enteringNumber: String {
        get {
            return enteringNumberObservable.value
        }
        set {
            enteringNumberObservable.value = newValue
        }
    }
}

class CalculatorViewController: UIViewController {
    calculatorChecker.enteringNumberObservable
        .subscribe { enteringNumber in
        self.enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
    }
    initializeLabel()
}
```

</br>

### 3️⃣ 클로저의 강한 순환참조 문제
#### 기존 코드(CalculatorViewController)
```swift
calculatorChecker.enteringNumberObservable.subscribe { enteringNumber in
    self.enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
}
```

* 기존 코드의 경우 `ViewController`에서 `subscribe`메소드를 실행 할 때 클로저 인스턴스를 전달하면서 해당 `ViewController`가 클로저를 참조하게 되고 클로저는 `ViewController`를 참조하고 있으므로 강한순환참조 문제가 발생할 수 있었습니다

<img src="https://github.com/seunghyunCheon/ios-calculator-app/blob/calculator2-step2/Image/강한순환참조문제.png?raw=true" height=500px>

#### 현재 코드(CalculatorViewController)
```swift
calculatorChecker.enteringNumberObservable.subscribe { [weak self] enteringNumber in
    self.enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
}
```

* 강한 순환참조 문제를 해결하기 위하여 `[weak self]`를 사용하여 순환참조 문제를 해결하였습니다
<br/><br/>
## 📑 참고 자료
- [didSet과 closure를 통한 데이터 바인딩](https://sujinnaljin.medium.com/swift-didset%EA%B3%BC-closure%EB%A5%BC-%ED%86%B5%ED%95%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%B0%94%EC%9D%B8%EB%94%A9-5a610d28c220)
- [Swift Closure](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Swift ARC](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html)
