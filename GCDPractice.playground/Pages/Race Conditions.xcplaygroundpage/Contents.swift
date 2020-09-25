//: [Previous](@previous)

import Foundation

class AccessTokenLoader {
    let queue = DispatchQueue(label: "concurrent queue", attributes: .concurrent)
    func load(completion: @escaping (Result<String, Error>) -> Void) {
        queue.async {
            let workDuration = Double.random(in: 0...1)
            Thread.sleep(forTimeInterval: workDuration)
            print("finished async work")
            completion(.success(UUID().uuidString))
        }
    }
}

class AccessTokenService {
    typealias Handler = (Result<String, Error>) -> Void

    var token: String?
    private let loader: AccessTokenLoader
    private let queue: DispatchQueue
    private var pendingHandlers = [Handler]()

    init(loader: AccessTokenLoader,
         queue: DispatchQueue = .init(label: "AccessToken")) {
        self.loader = loader
        self.queue = queue
    }

    func retrieveToken(then handler: @escaping Handler) {
        
        performRetrieval(with: handler)
//        if let token = self.token {
//            return handler(.success(token))
//        }
//
//        loader.load { [weak self] result in
//            switch result {
//            case .success(let token):
//                self?.token = token
//            case .failure:
//                break
//            }
//            handler(result)
//        }
        
//        queue.async { [weak self] in
//            self?.performRetrieval(with: handler)
//        }
    }
    
    private func performRetrieval(with handler: @escaping Handler) {
        if let token = token {
            return handler(.success(token))
        }

        pendingHandlers.append(handler)

        guard pendingHandlers.count == 1 else {
            return
        }
        
        loader.load { [weak self] result in
            // Whenever we are mutating our class' internal
            // state, we always dispatch onto our queue. That
            // way, we can be sure that no concurrent mutations
            // will occur.
            self?.queue.async {
                self?.handle(result)
            }
        }
    }
    
    private func handle(_ result: Result<String, Error>) {
        switch result {
        case .success(let token):
            self.token = token
        case .failure(let error):
            print(error.localizedDescription)
            return
        }

        let handlers = pendingHandlers
        pendingHandlers = []
        handlers.forEach { $0(result) }
    }
}

let loader = AccessTokenLoader()
let service = AccessTokenService(loader: loader)
var firstToken: String? {
    didSet {
        print(firstToken!)
    }
}

let workItem = DispatchWorkItem {
    service.retrieveToken { (result) in
        switch result {
        case .success(let token):
            firstToken = token
        case .failure:
            return
        }
    }
}

//DispatchQueue.global(qos: .background).async(execute: workItem)
//DispatchQueue.global(qos: .utility).async(execute: workItem)
//DispatchQueue.global(qos: .userInitiated).async(execute: workItem)
//DispatchQueue.global(qos: .userInteractive).async(execute: workItem)

//: [Next](@next)
