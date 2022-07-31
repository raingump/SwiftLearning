//
//  main.swift
//  SwiftLearning
//
//  Created by ganyu on 2022/7/30.
//

import Foundation

// The Basic
// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics

// MARK: 常量和变量
/**
 初始化
 1. 直接复制
 2. 在名字后面添加冒号再空格添加类型
 */

// MARK: 声明
// 常量
let maxNumberOfLoginAttempts = 10

// 变量
var currentLoginAttempt = 0

// MARK: 类型注解
// 可以在同一行多次声明变量，使用逗号分开即可
var a: Int, b: Int, c: String, d = 1.1

a = 1
b = 2
c = "A String"

// 字符串可以使用\()的形式引用值，也可以使用加号
print("a = \(a), b = \(b), c = \(c), " + "d = \(d)")

// 可以在同一行定定义多个关联变量，使用逗号隔开即可，在最后一个变量后面添加类型注释
var red, green, blue: Double
red = 255.0
green = 255.0
blue = 255.0
print("rgb = (\(red),\(green),\(blue))")

// MARK: 命名规则
// 常量和变量可以使用unicode当作名字
let π = 3.14159
let 你好 = "你好世界" // 甚至中文也可以有代码提示
let 🐮🐎 = "cowhorse" // emoji 是没有代码补全提示的
print("π = \(π), 你好世界 = \(你好)， 🐮🐎 = \(🐮🐎)")

/**
 常量和变量不能包含空格，数学字符，箭头，横杠等
 也不能以数字开头，当然数字可以包含在变量里面
 变量常量一旦声明了，就不能改变值的类型，或者变量和常量之间互换
 */

/// 尽量别用Swift保留的关键字，一定要用的话用``包围起来
let `let` = "aa"

// MARK: 打印
// 打印可以用这两种形式
// print(_:separator:terminator:)函数是一个全局函数，可将一个或多个值打印到适当的输出。例如，在 Xcode 中，该print(_:separator:terminator:)函数在 Xcode 的“控制台”窗格中打印其输出。separatorand参数有默认值，调用该terminator函数时可以省略。
print("a","b","c", separator: ":", terminator: "")
print("a","b","c", separator: ":")
print("let = \(`let`)")
print("let = " + `let`)

// MARK: 注释
/*
 可以嵌套注释，有时候可以嵌套在大段代码里面
 /*
  第一层嵌套
  /*
   第二层嵌套
   */
  */
 */

// MARK: 整数
// Swift 提供 8、16、32 和 64 位形式的有符号和无符号整数。
//
let minValueInt8 = Int8.min
let minValueInt16 = Int16.min
let minValueInt32 = Int32.min
let minValueInt64 = Int64.min
let minValueInt = Int.min

// 绝大多数情况下，使用 Int 就可以了，在 32 位平台上就是 Int32，在 64 位平台上就是 Int64
print(minValueInt8, minValueInt16, minValueInt32, minValueInt64, minValueInt, separator: "\n")

// 为了保证代码的可维护性，在项目里面请使用 Int 而不是 UInt，即使你知道你需要存的数据都是正数。
// 理由：1、可能需要进行类型转换 2、可复用差 3、匹配整数类型推断

// MARK: 浮点数
// Double 是 64位 的浮点数， Float 是 32 位。优先使用 Double，因为精度更高。


// MARK: 类型安全和类型推断

/**
 Swift 是一种类型安全的语言。类型安全的语言鼓励你清楚你的代码可以使用的值的类型。
 因为 Swift 是类型安全的，所以它会在编译代码时执行类型检查，并将任何不匹配的类型标记为错误。
 当您使用不同类型的值时，类型检查可帮助您避免错误。但是，这并不意味着您必须指定您声明的每个常量和变量的类型。如果你没有指定你需要的值的类型，Swift 会使用类型推断来计算出合适的类型。
 */

// 如果你给42一个新的常量赋值，但没有说明它是什么类型，Swift 会推断你希望这个常量是一个Int，因为你已经用一个看起来像整数的数字来初始化它：
// 所以为什么前面说使用 Int 而不是 UInt，因为有类型推断。
let thisIsAInt = 42 // Int
let pi = 3.14159 // Double
let anotherPi = 3 + 0.14159 // Double
let anotherInt = 1 + 3
let string = "Hello world"
print("thisIsAnt = \(type(of: thisIsAInt))")
print("pi = \(type(of: pi))")
print("anotherPi = \(type(of: anotherPi))")
print("anotherInt = \(type(of: anotherInt))")
print("string = \(type(of: string))")

// MARK: 数字文字
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

var flag = decimalInteger == binaryInteger
print("flag = \(flag)")

// 浮点文字可以是十进制（无前缀）或十六进制（有0x前缀）。它们必须始终在小数点两边都有一个数字（或十六进制数）。十进制浮点数也可以有一个可选的指数，用大写或小写表示e；十六进制浮点数必须有一个指数，用大写或小写表示p。
// 125
let decimalDouble = 12.5e1
// 60
let hexDouble = 0xFp2

// 数字文字可以包含额外的格式以使其更易于阅读。整数和浮点数都可以用额外的零填充，并且可以包含下划线以帮助提高可读性。
let oneMillion = 1_000_000

// MARK: 整数转换

// 下面两个例子会编译报错
// UInt 不存负数，所以会编译报错
//let cannotBeNegative: UInt = -1
// 溢出
//let tooBig: Int = Int.max + 1

// 不同类型的整数不能直接相加，比如 UInt16 和 UInt8 不能直接相加，需要先进行类型转换
var twoThousand: UInt16 = 2_000
var one: UInt8 = 1
var twoThousandAndOne = twoThousand + UInt16(one)

print(twoThousandAndOne)

// SomeType(ofInitialValue) 是 Swfit 里面默认的构造方法。幕后 UInt16 有个初始化方法来接收 UInt8 的类型。

print("Int8.min = \(Int8.min)")//10000000，第一个1代表是负数，而且还代表了2^7，所以最小的是-128
print("Int8.max = \(Int8.max)")//01111111,0代表正数，后面
print("UInt8.min = \(UInt8.min)")//00000000
print("UInt8.max = \(UInt8.max)")//11111111

// MARK: 类型别名
// 类型别名（type aliases）就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
print("maxAmplitudeFound = \(maxAmplitudeFound)")

// MARK: 布尔值
// Swift 有一个基本的布尔（Boolean）类型，叫做 Bool。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true 和 false
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// 输出“Eww, turnips are horrible.”

// 不像 Obejctive-C，在Swift中，if 里面需要是 bool 类型，不能是数值类型，否则可能报错
//let i = 1
//if i {
//    print("报错")
//}

// MARK: 元组 tuples

// (404, "Not Found") 元组把一个 Int 值和一个 String 值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为 (Int, String) 的元组”。
let http404Error = (404, "not found")

// 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出“The status code is 404”
print("The status message is \(statusMessage)")
// 输出“The status message is Not Found”

// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// 输出“The status code is 404”

// 此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
// 输出“The status code is 404”
print("The status message is \(http404Error.1)")
// 输出“The status message is Not Found”

// 你可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// 输出“The status code is 200”
print("The status message is \(http200Status.description)")
// 输出“The status message is OK”

// 作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。
// 当遇到一些相关值的简单分组时，元组是很有用的。元组不适合用来创建复杂的数据结构。如果你的数据结构比较复杂，不要使用元组，用类或结构体去建模。

// MARK: 可选类型
// 使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。
let possibleNumber = "123"
let convertedNum = Int(possibleNumber)
print("convertedNum = \(type(of: convertedNum))") // Optional<Int>

// MARK: if 语句以及强制解析
if convertedNum != nil {
    // 使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一个非 nil 的值。
    // 也就是，先判断 nil，再使用强制解析
    print("convertedNumber has an integer value of \(convertedNum!).")
}

var serverResponseCode: Int? = 404
serverResponseCode = 1
print("serverResponseCode = \(serverResponseCode!)")
serverResponseCode = nil
// 强制解析又没做判断会在运行时报错
// print("serverResponseCode = \(serverResponseCode!)")

// MARK: 可选绑定

// 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
// 注意这里的常量或者变量是临时的
if var actualNumber = Int(possibleNumber) {
    actualNumber += 1
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

// 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为 nil，或者任意一个布尔条件为 false，则整个 if 条件判断为 false。下面的两个 if 语句是等价的：
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出“4 < 42 < 100”

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出“4 < 42 < 100”

// MARK: 隐式解析可选类型
// Swift中的可选类型?和隐式解析可选类型!: https://hisoka0917.github.io/swift/2017/10/17/swift-implicitly-unwrapped-optionals/
// 使用可选类型的时候，每次复制都要强制解析一下，也太麻烦了
// 如下

func optional() {
    let dog: String? = "wangcai"    //dog变量想要给一个非可选类型的cat变量赋值
    let cat: String = dog!          //cat说，嗯，我已经拿到啦，么么哒！
    let tiger: String = dog!        //hello，我是旺财～
    let fish: String = dog!         //我是旺财～
    let bird: String = dog!         //旺财。。。
    let sheep: String = dog!        //为什么每次都得验证一遍
    let mouse: String = dog!        //心好累
    print(dog!, cat, tiger, fish, bird, sheep, mouse)
}

optional();

func implictUnwarppedOption() {
    // 为了不出现满屏的!，我们可以采用隐式解析可选类型
    let dog: String! = "wangca"    //dog变量想要给一个非可选类型的cat变量赋值
    let cat: String = dog           //cat说，嗯，我已经拿到啦，么么哒！
    let tiger: String = dog         //ok
    let fish: String = dog          //ok
    let bird: String = dog          //ok
    let sheep: String = dog         //ok
    let mouse: String = dog         //ok
    // 那么我们是否一直使用隐式解析可选类型就万事大吉了呢？答案是No。因为隐式解析可选类型还是可选类型，它是可以为空的。
    print(dog!, cat, tiger, fish, bird, sheep, mouse)
}

implictUnwarppedOption()

// 什么时候使用隐式解析可选类型？ 初始化过程中不能定义的常量
// 比如：获取一个按钮的宽度，需要先等按钮初始化之后才能获取
// 在大多数情况下，要避免使用隐式解析可选类型，因为一旦使用错误就会造成程序Crash。如果不确定一个变量是否会是nil，就默认使用普通可选类型。去解包一个不会是nil的变量不会有什么副作用。

// MARK: 错误处理
func canThrowAnError(num: Int) throws {
    // 这个函数有可能抛出错误
    if num == 1 {
        print("OK")
        return
    }
    throw NSError.init(domain: "invalid input", code: 1001, userInfo: nil)
}

do {
    try canThrowAnError(num: 2)
} catch {
    print(error)
}


// MARK: 断言和先决条件
// 断言的好处： 只在 debug 下应用；防止数据被进一步破坏；分析效率更高
// 先决条件：先决条件则在调试环境和生产环境中运行
var age = 11
// age = -1
// age < 0，断言会触发
//assert(age >= 0, "A person's age cannot be less than zero")
//assert(age >= 0)

if age > 10 {
    print("你可以玩过山车🎢，坐摩天轮🎡")
} else if age > 0 {
    print("你可以坐摩天轮🎡")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// MARK: 强制执行先决条件
var index = 1
// 在一个下标的实现里...
//assert(index > 0, "Index must be greater than zero.")
precondition(index > 0, "Index must be greater than zero.")

