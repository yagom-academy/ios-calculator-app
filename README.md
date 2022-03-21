# 📱ios-calculator-app
> 프로젝트 기간 2022.03.14 ~
> 
> ✏️ 팀원 : [Doogie](https://github.com/doogie97) / 🎤 리뷰어 : [라자냐](https://github.com/wonhee009)

- [프로젝트 규칙](#프로젝트-규칙)
- [UML](#프로젝트-규칙)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
## 프로젝트 규칙
- 🕐 시간
    - 월,화,목 AM09:00 ~ PM08:00 + α
    - 수,금 AM09:00 ~ PM06:00
    - 주말은 필요에 따라

## UML 
![Untitled (1)](https://user-images.githubusercontent.com/82325822/158533449-03543b04-be60-4cfa-8ef9-373f671e7f0d.jpg)

## STEP 1 기능 구현
- DoubleStack을 이용해 Queue구현

## 고민했던 것들
#### *`DoubleStack`* VS *`LinkedList`*
- *`DoubleStack`* 와 비교해 *`LinkedList`* 의 장점은 요소 중간의 값에 접근하기가 더 쉽고 빠르다는 것이다. 그런데 이번 계산기 프로젝트에서는 중간 값에 접근할 필요도 없으니 해당 이점을 사용하지 않는다면 공간복잡도가 더 낮은 Double스택을 사용하는것이 좋다고 생각했다.
(+ EC버튼은 가장 나중에 들어온 요소를 제거해야 하기에 이 부분에서도 DoubleStack이 더 유리하다고 판단)

## 배운 개념
- *`Queue`*
- *`DoubleStack`*
- *`LinkedList`*

## PR 후 개선사항
- Double Stack으로 큐를 구현함에 있으 낮은 이해도로 인해 발생된 문제 들 개선

1. count

변경전
```swift
var count: Int { dequeueList.isEmpty ? enqueueList.count : dequeueList.count }
```
변경 후
```swift
var count: Int { enqueueList.count + dequeueList.count }
```
2. first, last
변경전
```swift
var first: item? { enqueueList.first }
var last: item? { enqueueList.last }
```
변경 후
```swift
var first: item? { dequeueList.isEmpty ? enqueueList.first : dequeueList.last }
var last: item? { enqueueList.isEmpty ? dequeueList.first : enqueueList.last }
```
