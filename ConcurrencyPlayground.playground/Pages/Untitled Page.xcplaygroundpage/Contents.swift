import Foundation

actor Counter {
    private let name: String
    private var count = 0
    
    init(name: String) {
        self.name = name
    }
    
    func increment() -> Int {
        count += 1
        return count
    }
    
    // However, if you look closely, the getName() method just accesses the Counter's name constant; it does not change the Counter's state, so a race condition cannot be created.
    // In this case, we can mark the getName() function as nonisolated and so remove it from the actor's protection.
    nonisolated func getName() -> String {
        return name
    }
}

let counter = Counter(name: "My Counter")
Task {
    await counter.increment()
}

let name = counter.getName()
print("name: \(name)")
