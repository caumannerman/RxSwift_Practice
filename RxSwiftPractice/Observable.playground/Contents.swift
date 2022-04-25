import UIKit
import RxSwift

//하나의 element만 방출
print("----Just----")
Observable<Int>.just(1)

print("----Of1----")
Observable<Int>.of(1, 2, 3, 4, 5)

print("----Of2----")
Observable.of([1, 2, 3, 4, 5])

//받은 array 속 element들을 하나씩 방출
//from은 array만 받음 
print("----From----")
Observable.from([1,2,3,4,5])

