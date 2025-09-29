import Cocoa
//1
for number in 1...100 {
    // Check if number is divisible by both 3 and 5 first
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    // Check if divisible by 3
    } else if number % 3 == 0 {
        print("Fizz")
    // Check if divisible by 5
    } else if number % 5 == 0 {
        print("Buzz")
    // Otherwise, just print the number
    } else {
        print(number)
    }
}

//2
func isPrime(_ number: Int) -> Bool {
    // 0 and 1 are not prime
    if number < 2 { return false }
    // Check divisibility by numbers less than 'number'
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
// Print prime numbers between 1 and 100
for num in 1...100 {
    if isPrime(num) {
        print(num)
    }
}

//3
func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

let value: Double = 100 // Hardcoded input
let unit: String = "C" // Hardcoded input

if unit == "C" {
    print("\(value)°C = \(celsiusToFahrenheit(value))°F")
    print("\(value)°C = \(celsiusToKelvin(value))K")
} else if unit == "F" {
    print("\(value)°F = \(fahrenheitToCelsius(value))°C")
    print("\(value)°F = \(fahrenheitToKelvin(value))K")
} else if unit == "K" {
    print("\(value)K = \(kelvinToCelsius(value))°C")
    print("\(value)K = \(kelvinToFahrenheit(value))°F")
} else {
    print("Invalid unit! Use C, F, or K.")
}

//4
var shoppingList: [String] = []

func addItem(_ item: String) {
    shoppingList.append(item)
    print("Added \(item)")
}

func removeItem(_ item: String) {
    if let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("Removed \(item)")
    } else {
        print("\(item) not found in the list")
    }
}

func displayList() {
    print("Shopping List:")
    if shoppingList.isEmpty {
        print("   (empty)")
    } else {
        for (i, item) in shoppingList.enumerated() {
            print("   \(i+1). \(item)")
        }
    }
}
// Hardcoded input
addItem("Milk")
addItem("Bread")
addItem("Eggs")
displayList()

removeItem("Bread")
displayList()

//5
let sentence = "Ayau is great, and Ayau is cool! Ayau is powerful."

// Convert to lowercase, remove punctuation
let cleaned = sentence
    .lowercased()
    .components(separatedBy: CharacterSet.punctuationCharacters)
    .joined()

// Split into words
let words = cleaned.split(separator: " ").map { String($0) }

// Dictionary to store word
var wordCount: [String: Int] = [:]

for word in words {
    wordCount[word, default: 0] += 1
}

print("Word frequencies:")
for (word, count) in wordCount {
    print("\(word): \(count)")
}

//6
func fibonacci(_ n: Int) -> [Int] {
    // Handle edge case
    if n <= 0 {
        return []
    }
    // Only first number
    if n == 1 {
        return [0]
    }
    
    // Start with 0, 1
    var sequence = [0, 1]
    
    // Build sequence up to n terms
    for _ in 2..<n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }
    
    return sequence
}

print(fibonacci(0))
print(fibonacci(1))
print(fibonacci(5))
print(fibonacci(10))

//7
func gradeCalculator(students: [String: Int]) {
    if students.isEmpty {
        print("No student data provided")
        return
    }
    
    let scores = Array(students.values)
    let total = scores.reduce(0, +)
    let average = Double(total) / Double(scores.count)
    
    // Find highest and lowest scores
    if let highest = scores.max(), let lowest = scores.min() {
        print("Average score: \(average)")
        print("Highest score: \(highest)")
        print("Lowest score: \(lowest)\n")
    }
    
    // Check each student against average
    for (name, score) in students {
        if Double(score) >= average {
            print("\(name): \(score) → Above or equal to average")
        } else {
            print("\(name): \(score) → Below average")
        }
    }
}

let studentScores = [
    "Ayau": 85,
    "Bob": 72,
    "Charlie": 90,
    "Diana": 60
]

gradeCalculator(students: studentScores)

//8
func isPalindrome(text: String) -> Bool {
    // Remove spaces/punctuation, convert to lowercase
    let filtered = text.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Compare string with its reverse
    return filtered == String(filtered.reversed())
}

print(isPalindrome(text: "Racecar"))
print(isPalindrome(text: "A man, a plan, a canal, Panama"))
print(isPalindrome(text: "Hello"))

//9
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    return b != 0 ? a / b : nil
}

// Loop for continuous calculations
while true {
    print("Enter first number:")
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Invalid input")
        continue
    }
    
    print("Enter second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input")
        continue
    }
    
    print("Choose operation (+, -, *, /) or type 'exit' to quit:")
    if let operation = readLine() {
        if operation.lowercased() == "exit" {
            print("Goodbye!")
            break
        }
        
        var result: Double?
        
        switch operation {
        case "+":
            result = add(num1, num2)
        case "-":
            result = subtract(num1, num2)
        case "*":
            result = multiply(num1, num2)
        case "/":
            if let divisionResult = divide(num1, num2) {
                result = divisionResult
            } else {
                print("Error: Division by zero is not allowed")
                continue
            }
        default:
            print("Invalid operation")
            continue
        }
        
        if let res = result {
            print("Result: \(res)")
        }
    }
}

//10
func hasUniqueCharacters(_ text: String) -> Bool {
    var seenChars = Set<Character>() // Stores already seen characters
    
    for char in text {
        if seenChars.contains(char) {
            return false   // Duplicate found
        }
        seenChars.insert(char)
    }
    
    return true   // All unique
}

print(hasUniqueCharacters("Swift"))
print(hasUniqueCharacters("Programming"))
print(hasUniqueCharacters("AaBbCc"))

