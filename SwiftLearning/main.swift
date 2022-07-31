//
//  main.swift
//  SwiftLearning
//
//  Created by ganyu on 2022/7/30.
//

import Foundation

// The Basic
// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html


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

// MARK: 类型注释
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
// 理由：1、可能需要进行类型转换 2、可维护性差 3、匹配整数类型推断

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

