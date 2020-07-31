//: [Previous](@previous)

import Foundation

/// Perform work on a single custom queue with a serial (FIFO) execution order
let serialBackgroundQueue = DispatchQueue(label: "com.example.serial")
let firstWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔴")
}
let secondWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔵")
}

serialBackgroundQueue.async(execute: firstWorkItem)
serialBackgroundQueue.async(execute: secondWorkItem)

/// Result: The work items are executed in the order they are called.

//: [Next](@next)
