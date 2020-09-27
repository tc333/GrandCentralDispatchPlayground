//: [Previous](@previous)
/*:
 # Dispatch Semaphore
*/
import Foundation

class ViewController {
    
    private var sharedResource: [String] = []
    private let semaphore = DispatchSemaphore(value: 1)
    private let queue = DispatchQueue.global(qos: .utility)
    
    func viewDidLoad() {
        let group = DispatchGroup()
        
        group.enter()
        queue.async(group: group) {
            self.getNextString {
                group.leave()
            }
        }
        
        group.enter()
        queue.async {
            self.removeFirstString {
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            print("All work completed.")
        }
    }
    
    func getNextString(completion: @escaping () -> Void) {
//        semaphore.wait()
        let randomNum = Int.random(in: 1...4)
        asyncWork(withDelay: randomNum) {
            let nextString = UUID().uuidString
            print("Added new string: \(nextString)")
            self.sharedResource.append(nextString)
//            self.semaphore.signal()
            completion()
        }
    }
    
    func removeFirstString(completion: @escaping () -> Void) {
//        semaphore.wait()
        let randomNum = Int.random(in: 1...4)
        asyncWork(withDelay: randomNum) {
            print("Removing first string")
            self.sharedResource.remove(at: 0)
//            self.semaphore.signal()
            completion()
        }
    }
}

let controller = ViewController()
controller.viewDidLoad()
/*:
 #### Result
 Since the `sharedResource` is being accessed and mutated from 2 asynchronous blocks run from the same queue, a race condition is created that sometimes causes a fatal error and sometimes executes as intended.
*/
//: [Next](@next)
