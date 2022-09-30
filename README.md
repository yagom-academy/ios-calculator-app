# 계산기 README
> 프로젝트 기간 2022/09/19 ~ 2022/10/02
> 팀원: [Mangdi](https://github.com/MangDi-L) / 리뷰어: [쿠마](https://github.com/leejun6694)

# 목차
- [프로젝트 소개](#소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [타임라인](#타임라인)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)

## 프로젝트 소개
> 계산을 도와주는 계산기 앱


## 개발환경 및 라이브러리
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

## 타임라인

### 1주차
- 09/19 ~
    - 사칙연산을 위한 큐 연결리스트 구현
- 09/22 ~
    - 설계된 UML대로 타입 구현
### 2주차
- 09/26 ~
    - UML대로 작성한 타입의 역할에 맞는 기능 구현
- 09/28 ~ 10/02
    - 계산기가 제대로 작동하도록 UI 및 기능 구현

## 실행 화면
|1.사칙연산 작동 확인|2.연산버튼누를때마다 &nbsp;변경되는지확인|3.부호변환확인|
|---|---|---|
|![1_사칙연산잘작동하는지](https://user-images.githubusercontent.com/49121469/193212593-10ea0c99-ac96-4409-8274-24cf74ab06b3.gif)|![2_연산버튼누를때마다변경](https://user-images.githubusercontent.com/49121469/193212610-68e62c68-bcaa-4e10-a0cb-a2c704a4bad4.gif)|![3_부호변환확인](https://user-images.githubusercontent.com/49121469/193212618-eee38646-e8ec-42de-9057-f46ab4229031.gif)|
|4.CE로 숫자제거 확인|5.AC로 모든내역제거 확인|6.소수점출력 확인|
|![4_CE로제거](https://user-images.githubusercontent.com/49121469/193212626-cfc380ad-94d4-4448-9b7e-d5d8b9cd3094.gif)|![5_AC로모두제거](https://user-images.githubusercontent.com/49121469/193212637-d1c2f831-fbc1-411c-a5f8-cfc393a16bbe.gif)|![6_소수점표현](https://user-images.githubusercontent.com/49121469/193212642-ba9c2f84-0c48-4f7c-b896-8150c7361009.gif)|
|7.소수점여러번클릭 확인|8.소수점0 입력 확인|9.소수점필요없는부분제거 확인|
|![7_소수점여러번클릭](https://user-images.githubusercontent.com/49121469/193212651-d2ae1ee7-5fcc-4342-bf2f-0213d6af5ddd.gif)|![8_소수점0입력](https://user-images.githubusercontent.com/49121469/193212659-a896da17-440c-49ec-b285-e75d820981ee.gif)|![9_소수점0000없애는거확인](https://user-images.githubusercontent.com/49121469/193212667-7cc5dd53-ef4b-48ee-beb6-fd7343d7896a.gif)|
|10.세자릿수마다 콤마잘나오는지 확인|11.0으로나눌때 NaN출력 확인||
|![10_세자릿수마다콤마잘나오는지](https://user-images.githubusercontent.com/49121469/193212684-47a25f6c-5bca-480b-9300-9e1aeeb77c5a.gif)|![11_0나눌때_NaN출력](https://user-images.githubusercontent.com/49121469/193212704-bea13ee3-2d7a-471d-9ad4-597450460a54.gif)||

## 트러블 슈팅
* 1  
큐를 구현할때 배열로 할건지 연결리스트로 할건지 고민이 되었다. 각각 큐의 알고리즘을 적용했을때 어떤식으로 동작하는지 서로 비교해 본 바, 배열의 경우엔 첫번째 인덱스부터 삭제 작업이 이루어질때 그 빈 공간들은 놔두면 그대로 공간만 차지하게 되거나 수동적으로 공간을 메꿔줘야하는 반면, 연결리스트는 노드의 연결만 끊어주면 메모리에 남지않고 깔끔하게 지워버릴수 있다는 이점을 가지고있었다. 속도를 놓고 비교해보자면 배열이 더 빠르지만 구현할때는 연결리스트가 깔끔하고 적절하다 판단해서 연결리스트로 구현하게 되었다.
![LinkedList](https://user-images.githubusercontent.com/49121469/193202251-d52d2b36-ff07-412d-8822-1a4c2d39245b.png)

* 2  
UILabel 텍스트의 값을 이어서 붙이려 할때
UILabel.text += "1" 여기서 
Value of optional type 'String?' must be unwrapped to a value of type 'String'이러한 에러가 발생하게 되었다.
UILabel의 text는 아무것도 없을때 ""이며 동시에 nil을 나타낸다. +=를 쓸때 자기자신이 nil일수도있기때문에 그렇다는것을 이해했다. 
<img width="934" alt="StringError" src="https://user-images.githubusercontent.com/49121469/193202940-680d99b6-5bcd-4957-a27d-440e8637823b.png">

* 3  
스택뷰에 레이블을 달아줄때 .addSubView를 사용했었다.
하지만 적용이 안되자 addArrangedSubView로 바꾸어주었더니 적용이 되었다.
두개가 어떤점이 다른건가 알아보았더니
.addArrangedSubView()는 .axis, .alignment, .distrbution, .spacing같은 프레임에 맞게 뷰를 정렬해줄 속성들이 있다. 따라서 스택뷰에 이 메서드로 뷰를 추가한다면 스택뷰의 너비만큼 확장시켜준다.
.addSubView()는 스택뷰에 서브뷰로 추가했을경우 오버레이할뿐이며 뷰의 높이가 0으로 설정되어 화면에 보이지 않았던것이다. 
이로써 코드로 스택뷰를 구현할때 어떻게 만들어줘야하는지 알게되었다.
```swift
private func makeHistoryStactView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
    var stackView: UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        return stackView
    }
    
    return stackView
}
```

### 😮알게 된 점
- 함수가 Bool값을 리턴해야한다고 return을 true나 false로 직접 써줄필요가 없다.
```swift
func isEmpty() -> Bool {
    if front == nil {
        return true
    } else {
        return false
    }
} // X

func isEmpty() -> Bool {
    return front == nil
} // O
```

- 고차함수를 사용하여 원하는값을 쉽게 추출할수있다. 이번 프로젝트로 고차함수를 어떻게 활용하면 좋을지 알게 되었다.
```swift
static private func componentsByOperators(from input: String) -> [String] {
    let operators = Operator.allCases.map { String($0.rawValue) }.joined()
    let separators = CharacterSet(charactersIn: operators)
    let operandsArray = input.components(separatedBy: separators)
    return operandsArray
}
```
```swift
let allOperators = Operator.allCases.map { $0.rawValue }
let operatorArray = input.filter { allOperators.contains($0) }.map { Operator.init(rawValue: $0) }
```
