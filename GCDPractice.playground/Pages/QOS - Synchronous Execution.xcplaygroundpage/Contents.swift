//: [Previous](@previous)

import Foundation

/// 2 synchronously executed work items: 1 executed on a background thread, one on a prioritized thread

DispatchQueue.global(qos: .utility).sync {
    printMultiples(of: 3, upTo: 1000, withEmoji: "🦥")
}

/// This code isn't run until the previous synchronous work in completed
DispatchQueue.global(qos: .userInteractive).sync {
    printMultiples(of: 3, upTo: 1000, withEmoji: "🐇")
}

//: [Next](@next)
