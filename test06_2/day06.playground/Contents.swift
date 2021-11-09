import UIKit

struct Sample {
    //생성자(이니셜라이저)
    //오버로딩(함수이름 동일하게 쓸 수 있다.)
    var name : String = ""   //멤버변수(인스턴스변수
    var age : Int = 100
    static var count : Int = 0 //스태틱변수
    
    //멤버함수(일반함수)
    func play(_ hour : Int) -> String{
        return "나는 " + String(hour) + "시간 놀거에오..!"//+연산자는 타입이 다 동일해야 함
    }
    
    //스태틱함수
    //자주 사용하는 함수를 static으로 만들면 얼마나 좋게오
    static func getCount() -> Int {
        return count
    }
    //this 대신 self
    
    //인스턴스 생성시 인스턴스 변수만 복사되고 스태틱은 복사가 안됨
}

//Sample s1 = new Sample() 자바는 이러케 해오
var s1 : Sample = Sample() //스위프트는 이러케 해오(Struct의 객체 소환) 정식으로는 Sample strunt의 인스턴스
var s2 : Sample = Sample() //인스턴스

s1.name = "홍길동"
s1.age = 200

print(s1.name, s1.age)

s2.name = "김길동"
s2.age = 300
print(s2.name, s2.age)

//struct Int {
//    static var min = -222222
//    static var max = 22222
//}
//
//print(Int.max)

//구조체를 만들어보자.
//Student 구조체, name, depart, subject
//학생 인스턴스 2명 만들어서 프린트

struct Student{
    var name : String = ""
    var depart : String = ""
    var subject : String = ""
}

var student1 : Student = Student()
var student2 : Student = Student()

student1.name = "몰랑이"
student1.depart = "수의학과"
student1.subject = "동물보건학"

student2.name = "익명이"
student2.depart = "관광경영학"
student2.subject = "여행사경영론"


class Student2 {
    var name : String = ""
    var age : Int = 0
    
    init() {
        print("객체가 생성됨.")
    }
    
    init(_ name : String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
    func study(){
        print("공부하다")
    }
    
    func print2() {
        print("이름은 " + name + ", 나이는 " + String(age))
    }
}

var ss1 = Student2()
ss1.name = "송길동"
ss1.age = 400

var ss2 = Student2("정길동", 300)
ss1.print2()
ss2.print2()

ss1.study()

//상속을 받아봅시다.
class High : Student2{
    //인스턴스 변수 2개 추가, hour, location
    var hour : Int = 0
    var location : String = ""
    
    override init(){
        //부모 생성호출은 첫줄에 써야한다
        //자바는 묵시적으로 자동으로 부모의 기본 생성자를 호출된다.
        //자바는 생략가능
        //스위프트는 생략 불가능
        super.init()
        print("고등학생 객체가 생성하였음")
    }
    
    init(_ name : String, _ age : Int, _ hour : Int, _ location : String) {
        super.init(name, age)
        self.hour = hour
        self.location = location
    }

    //일반 함수 2개 추가, nightSelfStudy(), go()
    func nightSelfStudy(){
        print("오늘은 \(hour)시간 야자했어요")
    }
    
    func go(){
        print("야자를 빼고 \(location)으로 갔어요.")
    }
    
    //overrid study(), print2()
    override func study(){
        print(name, age, hour, location)
    }
    
    override func print2() {
        print("이름이 " + name + ", 나이가 " + String(age))
    }
}

//객체 생성, 멤버변수 프린트

var highSs = High()
highSs.hour = 3
highSs.location = "분식집"
highSs.name = "너구리"
highSs.age = 17
highSs.go()
highSs.nightSelfStudy()
highSs.study()
highSs.print2()

var highSs2 = High("박박박", 666, 5, "학교 실습실")
highSs2.nightSelfStudy()
//highSs2.go("콘서트")
highSs2.study()
highSs2.print2()

//상속시
//자식 객체가 생성되는 경우 생성자가 자동 호출된다
//자식 객체는 부모 객체가 먼저 만들어지고 그것을 확장해서 만드는 개념이기 때문에
//자식의 생성자가 호출될 때 부모의 생성자가 먼저!! 반드시 호출된다.


var value2 : String?
var value1 = "I am defalut value"
var value3 = value2 ?? value1
