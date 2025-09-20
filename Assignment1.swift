let firstName: String = "Ayaulym"
let lastName: String = "Zhuniskhan"
let birthYear: Int = 2006
let currentYear: Int = 2025
let age: Int = currentYear - birthYear
let isStudent: Bool = true
let height: Double = 1.65
let country: String = "Kazakhstan"
let emoji: String = "🇰🇿"
let hobby: String = "painting"
let numberOfHobbies: Int = 3
let favoriteNumber: Int = 21
let isHobbyCreative: Bool = true
let favoriteSport: String = "swimming"
let futureGoals: String = "In the future, I want to become a skilled iOS developer and travel the world"

let studentStatus = isStudent ? "I am currently a student." : "I am not a student."
let hobbyType = isHobbyCreative ? "It is a creative hobby." : "It is not a creative hobby."

let lifeStory = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). \
\(studentStatus) My height is \(height) meters. I live in \(country) \(emoji).
I enjoy \(hobby). \(hobbyType) I also like \(favoriteSport). \
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
\(futureGoals)
"""

print(lifeStory)
