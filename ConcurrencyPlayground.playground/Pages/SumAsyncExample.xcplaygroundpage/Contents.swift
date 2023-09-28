import Foundation

func taskA() async -> Int {
    // Waiting for 3 seconds
    await Task.sleep(3 * 1000000000)
    return 3
}

func taskB() async -> Int {
    // Waiting for five seconds
    await Task.sleep(5 * 1000000000)
    return 5
}

/*
func sumAsync() async {
    let taskA = await taskA()
    let taskB = await taskB()
    let sum = taskA + taskB
    print("sum: ", sum)
}
await sumAsync()
*/

func sumAsync() {
    Task {
        let taskA = await taskA()
        print("111 Starting taskA")
        let taskB = await taskB()
        print("111 Starting taskB")
        let sum = taskA + taskB
        print("sum: ", sum)
    }
}
sumAsync()


// Structured Concurrency
func doSum() {
    Task {
        // Creating and starting a child task
        async let taskA = taskA()
        print("222 Starting taskA")
        async let taskB = taskB()
        print("222 Starting taskB")
        let sum = await (taskA + taskB)
        print("Structured concurrency Sum: \(sum)")
    }
}

doSum()
