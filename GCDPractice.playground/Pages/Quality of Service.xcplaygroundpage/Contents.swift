//: [Previous](@previous)
/*:
 # Quality of Service
 2 work items run on 2 separate queues with different QOS's.
*/
import Foundation

DispatchQueue.global(qos: .background).async {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔴")
}

DispatchQueue.global(qos: .userInitiated).async {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔵")
}

/*:
 #### Result
 The work item on the queue with the higher QOS is prioritized.
*/
//: [Next](@next)
