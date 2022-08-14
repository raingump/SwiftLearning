//
//  main.swift
//  Basic Opertors
//
//  Created by ganyu on 2022/7/31.
//

import Foundation

// Basic Operators
// https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html
// https://swiftgg.gitbook.io/swift/swift-jiao-cheng/02_basic_operators

// MARK: - 赋值运算符
let b = 10
var a = 5
a = b

// 如果赋值的右边是一个多元组，它的元素可以马上被分解成多个常量或变量：
let (x, y) = (1, 2)
// 现在 x 等于 1，y 等于 2

//if x = y {
    // 此句错误，因为 x = y 并不返回任何值
//}

// MARK: - 一元负号运算符
// 一元负号运算符会改变数值的正负
let ten = 10
let minusTen = -ten
let plusTen = -minusTen
print(ten, minusTen, plusTen)

// MARK: - 一元正号运算符
// 而一元正号运算符并不会改变数值的正负
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
print(minusSix, alsoMinusSix)

// MARK: - 比较运算符
// 太过常见的就不说了，和 JAVA、 Obejective-C 完全一样
// 但是需要特殊说明的是，元组（tuple）也可以用来做比较
// 必要的条件是：两个元组之间的类型一样，长度一样
// 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。

let comparison1 = (1, "zebra") < (2, "apple")// true，因为 1 小于 2
let comparison2 = (2, "apple") < (2, "bird")// true，因为 2 等于 2，但是 apple 小于 bird
let comparison3 = (4, "dog") <= (4, "dog")// true，因为 4 等于 4，dog 等于 dog

print(comparison1, comparison2, comparison3)

// 注意：Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。

// MARK: - 三元运算符

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight 现在是 90

// MARK: - 空合运算符
// 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。
// 空合运算符是对以下代码的简短表达方法：
// a != nil ? a! : b

var optionalImageUrl : URL?
let defaultImageURL : URL = URL(string: "https://your_site/defaultImage.png")!
var imageUrl = optionalImageUrl ?? defaultImageURL
// optionalImageUrl 的值为空，所以 imageUrl 的值为 "https://your_site/defaultImage.png"
print(imageUrl)

optionalImageUrl = URL(string: "https://your_site/server.png")!
imageUrl = optionalImageUrl ?? defaultImageURL
// optionalImageUrl 的值为空，所以 imageUrl 的值为 "https://your_site/server.png"
print(imageUrl)

// 一个更优雅的写法
let imageUrl2 : URL = URL(string: "imageURLFromServer") ?? URL(fileURLWithPath: "local")

// MARK: - 闭区间运算符
// 闭区间运算符（a...b）定义一个包含从 a 到 b（包括 a 和 b）的所有值的区间。a 的值不能超过 b。
for i in 1...5 {
    print(i)
}

// MARK: - 半开区间运算符
// 半开区间运算符（a..<b）定义一个从 a 到 b 但不包括 b 的区间。 之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

// MARK: - 单侧区间
// 闭区间操作符有另一个表达形式，可以表达往一侧无限延伸的区间
for name in names[1...] {// 包含了数组下标第 1 个以及后面所有的
    print(name)
}

for name in names[...1]{// 包含了数组一开始到数组下标第 1 个所有的值
    print(name)
}

for name in names[..<names.count] {
    print(name)
}
