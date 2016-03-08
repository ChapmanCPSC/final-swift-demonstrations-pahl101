//: Playground - noun: a place where people can play

import UIKit

//=============================================================================================//
//Optional Types


//These two are interchangeable
var optionalInt : Int?
var optionalInt2 : Optional<Int> //is an enumeration can mean none or something(wrappd)

var opt : Int
print(optionalInt2)

optionalInt2 = 25

print(optionalInt2)

var someWord = Optional("hello") //wraps hello in an optional, just incase the value becomes nil
print(someWord)

someWord.dynamicType
someWord = nil

print(someWord)


//cant do this...
//var str = "Hello"
//str = nil

func someFunc(word: String?)
{
    print(word)
}

someFunc("This is wrapped")

//to unwrap
func someFuncUnwrap(word: String?)
{
    print(word!)
}

someFuncUnwrap("This is unwrapped")

//note if you were to input an optional into an unwrapped function that has a nil value, it will cause error

//just as the func you can use ! to unwrap directly from value

var str : String? = "A String"
var aStr = str!

var maybe : String?
maybe = "A String Thing"

//you can check for nil

if maybe == nil
{
    print("It was nil")
}
else
{
    print(maybe!.uppercaseString) //exclamation unwraps if you use a ? then it will be conditional wrap
                                 //maybe?.uppercaseString
}


func occurences(ofNum x : Int, inArray arr: Array<Int>)->Int
{
    var count = 0
    for num in arr
    {
        if num == x
        {
            count+=1
        }
    }
    return count
}
var myArr : [Int] = [4,6,7,4,9,8,5,7,7,9]
occurences(ofNum: 7, inArray: myArr)

var myArr2 = [Int]?() //?() makes it empty and optional to begin with
myArr2 = [9,5,4,6,7,7,7,8,]
occurences(ofNum: 7, inArray: myArr2!) //need exclamation because myArr2 is optional

let num1 : Int? = 25
let num2 : Int! = 25

num1 == num2

class Course
{
    var title : String?
    
    func attendance()
    {
        print("Going to class")
    }
}

var course1 : Course? = nil
course1?.attendance()
course1 = Course()
course1?.title?.lowercaseString

//you can compare an optional to a non-optional
optionalInt2==24
optionalInt2==25


//================================================================================================//
//Object Types

class GreetWorld
{
    class func helloGreet(name: String){
        print("The world says hello \(name)!")
    }
    class func goodbyeGreet(name: String){
        print("The world says goodbye \(name)!")
    }
}

GreetWorld.helloGreet("Madison")
GreetWorld.goodbyeGreet("Madison")



class Weather
{
    var type : String
    var inches : Float
    
    init?(type : String, inches: Float = 0)
    {
        self.type=type
        self.inches=inches
        
        if inches<=0{
            return nil
        }
        
        self.fall()
    }
    
    func fall()
    {
        print("It is \(type)ing.")
    }
}

var rain = Weather(type: "rain", inches: 1.22)
var snow = Weather(type: "snow") //since nil donesnt execute fall function
snow?.fall()


class Month {
    private var months = ["Jan", "Feb", "March", "April", "May", "June", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
    subscript(idx: Int)->String {
        return months[idx]
    }
}

let fallSemester = Month()
print("I have school from \(fallSemester[8]) to \(fallSemester[11])")


class PhoneNumber {
    
    var phoneNumber : Int
    
    init(phoneNumber:Int) {
        self.phoneNumber = phoneNumber
    }
    
    subscript(idx : Int)->Int{
        
        get {
            let phoneString = String(phoneNumber)
            return Int(String(phoneString.characters[phoneString.startIndex.advancedBy(idx)]))!
        }
        set {
            var originalPhone = String(phoneNumber)
            let range = originalPhone.startIndex.advancedBy(idx)..<originalPhone.startIndex.advancedBy(idx+1)
            originalPhone.replaceRange(range, with: String(newValue))
            self.phoneNumber = Int(originalPhone)!
        }
    }
}

let homePhone = PhoneNumber(phoneNumber: 7608345566)
homePhone[2]

homePhone[4] = 9



//enums
enum Animals
{
    case Elephant
    case Penguin
    case Dog
    case Turtle
    
}

let favorite = Animals.Elephant

enum Flower : String {
    
    case rose = "Rose/Red"
    case sunflower = "Sunflower/Yellow"
    case daisy = "Daisy/White"
}

let flowerStr = "Sunflower/Yellow"
let flower = Flower(rawValue: flowerStr)
let random = Flower(rawValue: "palm tree") //not viable option returns nill

enum RaceRanking : Int
{
    case First = 1
    case Second = 2
    case Third = 3
    case Fourth = 4
    
    mutating func advance() {
        let nextRank = RaceRanking(rawValue: self.rawValue-1)
        self = nextRank!
    }
}

var myRanking = RaceRanking.Second
myRanking.advance()

class Sports
{
    class var mostPopularSport : String {
        return "Soccer"
    }
    var sportType = ""
    var equipment = ""
    
    func description()
    {
        print("\(sportType) is played with \(equipment)")
    }
}

struct Softball
{
    var arenaType : String
    var equipmentType : String
}

let sport1 = Sports()
let sb = Softball(arenaType: "Field", equipmentType: "Ball, Bat, Glove")

let sport2 = sport1

sport2.sportType = "Baseball"
sport2.equipment = "Glove, Bat, Ball"

sport1
sport2.description()

sport1.sportType = "Soccer"
sport1.equipment = "Ball"

sport2
sport1.description()


var sb2 = sb
sb2.arenaType = "Diamond"
sb

let softball=Softball(arenaType: "", equipmentType: "") //cant assign variable after this point
let aSport = Sports()
aSport.sportType="basketball" //can do this beause not yet initialized


struct name
{
    static let firstName = "Madison"
    static let lastName = "Pahl"
}

print ("My name is \(name.firstName) \(name.lastName).")


class Animal
{
    var name : String
    var age : Int
    
    init(name: String, age: Int=0)
    {
        self.name=name
        self.age=age
    }
    
    convenience init()
    {
        self.init(name : "An animal", age: 0)
        print("Initialized Conveniently.")
    }
    
    func eat()
    {
        print("NOM NOM NOM")
    }
}

class Fish : Animal
{
    final override func eat()
    {
        super.eat()
        print("SLURP SLURP")
    }
    func swim()
    {
        print("Just keep swimming. Just keep swimming")
    }
}

final class clownFish : Fish
{
    func tellJoke()
    {
        print("Fish are friends, not food!")
    }
}

let marlin = clownFish(name: "Marlin", age: 30)
marlin.eat()
marlin.swim()
marlin.tellJoke()

class Cat
{
    class var WhatCatsSay : String {
        return "meow"
    }
    var name=""
    var age=0
    
    func meow()
    {
        print("meow")
    }
}

class MeanCat : Cat
{
    override static var WhatCatsSay : String {
        return "HISS"
    }
    override func meow()
    {
        super.meow()
        super.meow()
        super.meow()
    }
    
    func beNice()
    {
        print("Purrr")
    }
}

let normalCat = Cat()
let meanCat = MeanCat()

func makeCatMeow( cat: Cat)
{
    cat.meow()
    
    let meanCat = cat as? MeanCat
    
    meanCat?.beNice()
}

makeCatMeow(normalCat)
makeCatMeow(meanCat)
print(Cat.WhatCatsSay)
print(MeanCat.WhatCatsSay)


//=================================================================================//
//Protocols and Extensions

protocol Question
{
    var questionType : String {get}
    func answer()
    func counterQuestion() ->Void
}

class StupidQuestion : Question
{
    var questionType : String = "What is the answer to 5-4?"
    
    func answer()
    {
        print("1.")
    }
    func counterQuestion()
    {
        print("What is the answer to life?")
    }
}

struct GoodQuestion : Question
{
    var questionType : String = "What is for dinner?"
    func answer()
    {
        print("Whatever you are making.")
    }
    func counterQuestion() {
        print("What are you making?")
    }
}

let stupid=StupidQuestion()
let good=GoodQuestion()

func tellToAnswer(q: Question)
{
    print("The answer to: \n \(q.questionType) is:")
    q.answer()
}

tellToAnswer(stupid)
tellToAnswer(good)

//umbrella types

func anyObject(obj: AnyObject) {}
//this does pretty much any object...
anyObject("Hello")
anyObject(stupid)
anyObject(UIButton)
anyObject(Cat)


func anyClass(cls : AnyClass){}
anyClass(Cat)
anyClass(clownFish)

func anything(a: Any) {}
anything(String)
anything(Cat)
anything(Cat())
anything("Hello")

extension Double {
    
    func toFahrenheit() ->Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() ->Double {
        return (self-32) * 5/9
    }
}

let bodyTempF = 97.0
let bodyTempC = bodyTempF.toCelsius()

print(bodyTempC)


//=======================================================================//
//error handling

enum ATMError : ErrorType {
    case InvalidRequest
    case OutOfRequestType
    case CardError(cardType : String)
}

//throw ATMError.InvalidPin(request: "Must enter 1,10,20,50 or 100")
//throw ATMError.CardError(cardType: "US Bank card ONLY")

//above is commented out because takes extremely long time to run assignment

struct Cash
{
    var numericValue: Int
    var count: Int
}

class ATM
{
    var cashChoice = ["Ones": Cash(numericValue : 1, count: 1000), "Tens": Cash(numericValue: 10, count: 1000), "Twenties": Cash(numericValue: 20, count: 1000), "Fifties": Cash(numericValue: 50, count: 1000),"Hundreds": Cash(numericValue:100, count: 1000)]
    
    func dispense(amount: String)
    {
        print("Dispensing \(amount)")
    }
    
    func vend(itemChoice cashing: String) throws {
        guard let item = cashChoice[cashing] else{
            throw ATMError.InvalidRequest
        }
        guard item.count > 0 else{
            throw ATMError.OutOfRequestType
        }
    }
    
}

var atm = ATM()

do{
    try atm.vend(itemChoice: "Millions")
} catch ATMError.InvalidRequest{
    print("We dont have that amount")
}




func someThrowingFunc() throws -> Int {
    //enter coding here
    return 0
}

let x = try? someThrowingFunc()

let y: Int?
do{
    y = try someThrowingFunc()
} catch {
    y = nil
}

//comverts errors to optional values


//============================================================================//
//swift flow control


enum Toys
{
    case Legos
    case RaceCars
    case Barbies
}

let toyType : Toys = .Legos

switch toyType {
case .Legos:
    print("Legos are Life")
    fallthrough //falls to racecar so it prints legos and racecars
case .RaceCars:
    print("Racecars Rule")
case .Barbies:
    print("Barbies are Best")
}

let num = 25
let specification = (num < 0) ? "Negative" : "Positive"

//the above is the same as using an if else statement inside a function

let spec2 : String = {
    if num < 0{
        return "Negative"
    }
    else {
        return "Positive"
    }
}()

//=====================================================================================//
//collection types

var myArr1 : [Int] = [5,4,6,7,8]
var myStrArr : [String] = ["Madison","Anne","Pahl"]

while let me = myArr1.popLast()
{
    print(me)
}

while let name = myStrArr.popLast()
{
    print(name)
}

struct Person
{
    var name : String
    var age : Int
}

let p1 = Person(name: "Madison", age: 20)
let p2 = Person(name: "Jami", age: 19)
let p3 = Person(name: "Katie", age: 21)
let p4 = Person(name: "Jake", age: 20)

let friendArr : [Person] = [p1,p2,p3,p4]

for friend in friendArr where friend.age<20
{
    print(friend.name)
}

outer: for friend in friendArr where friend.age>20
{
    if friend.name == "Madison"
    {
        break outer
    }
}

friendArr[0...2]
friendArr[3]

let goodFriend = friendArr.filter { (p : Person) -> Bool in
    return p.age > 20
}

let oldFriend = friendArr.contains { (p) -> Bool in
    return p.age < 21
}

friendArr.forEach { (p) -> () in
    print(p.name)
}

let freindAges = friendArr.map { (p) -> Int in
    return p.age
}

for (index, friend) in friendArr.enumerate()
{
    print("\(index+1): \(friend.name)")
}

//dictionary
var friendRanking = [Int:String]()
friendRanking[1]="Jami"
friendRanking[99]="Josh"
friendRanking[8]="Jessi"






