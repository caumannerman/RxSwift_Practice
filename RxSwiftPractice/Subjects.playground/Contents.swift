import RxSwift


let disposeBag = DisposeBag()

print("------publishSubject------")
let publishSubject = PublishSubject<String>()

publishSubject.onNext("1.여러분 안녕하세요?")

let 구독자1 = publishSubject.subscribe(onNext:{
    print("첫 번쨰 구독자: \($0)")
})
    

publishSubject.onNext("2.들리시나요?")

publishSubject.onNext("2-1.안 들리시나요?")

//구독자1.dispose()

let 구독자2 = publishSubject
    .subscribe(onNext:{
        print("두 번쨰 구독자: \($0)")
    })
    
publishSubject.onNext("3.여보세요?")
publishSubject.onCompleted()

publishSubject.onNext("4.끝났나요")

구독자2.dispose()


publishSubject.subscribe{
    print("세번쨰 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

publishSubject.onNext("6. 찍힐까요?")

print("------behaviorSubject------")
enum SubjectError: Error{
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "0. 초기값")

behaviorSubject.onNext("1. 첫번쨰값")

behaviorSubject.subscribe{
    print("첫번째구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)

//behaviorSubject.onError(SubjectError.error1)


behaviorSubject.subscribe{
    print("두번째구독: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

//들어있는 값을 꺼내볼 수 있다. behavior. value()로 .
let value = try? behaviorSubject.value()
print(value)

print("------ReplaySubject------")
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("1. 여러분")
replaySubject.onNext("2. 힘내세요")
replaySubject.onNext("3. 어렵지만")
//bufferSize 덕에 2번 이벤트부터 그대로 받아올 수 있다.
replaySubject.subscribe{
    print("첫 번째 구독: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe{
    print("두 번째 구독: ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("4. 할 수 있어요.")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()

replaySubject.subscribe{
    print("세 번째 구독:", $0.element ?? $0)
}
.disposed(by: disposeBag)
