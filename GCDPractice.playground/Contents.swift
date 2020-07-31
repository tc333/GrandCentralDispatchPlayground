import Foundation

/// Dummy function to represent computationally intensive work
func printMultiples(of n: Int, upTo: Int, withEmoji: String) {
    for i in 0...upTo {
        if i % n == 0 {
            print("\(withEmoji) \(i)")
        }
    }
}

/// 2 asynchronously executed work items: 1 executed on a background thread, one on a prioritized thread

DispatchQueue.global(qos: .utility).async {
    printMultiples(of: 3, upTo: 1000, withEmoji: "🦥")
}

DispatchQueue.global(qos: .userInteractive).async {
    printMultiples(of: 3, upTo: 1000, withEmoji: "🐇")
}


