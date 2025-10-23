import UIKit

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category {
        case electronics
        case clothing
        case food
        case books
    }
    
    var displayPrice: String {
        return "$" + String(format: "%.2f", price)
    }
    
    init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

struct CartItem {
    let product: Product
    private(set) var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    init?(product: Product, quantity: Int) {
        guard quantity > 0 else {
            return nil
        }
        self.product = product
        self.quantity = quantity
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            return
        }
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else { return }
        quantity += amount
    }
}

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    init() {}
    
    func addItem(product: Product, quantity: Int) {
        guard quantity > 0 else {
            return
        }
        
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        } else {
            if let newItem = CartItem(product: product, quantity: quantity) {
                items.append(newItem)
            }
        }
    }
    
    func removeItem(productId: String) {
        items.removeAll(where: { $0.product.id == productId })
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        if quantity == 0 {
            removeItem(productId: productId)
            return
        }
        
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items[index].updateQuantity(quantity)
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        var sum = 0.0
        for item in items {
            sum += item.subtotal
        }
        return sum
    }
    
    var discountAmount: Double {
        guard let code = discountCode else { return 0 }
        
        let upperCode = code.uppercased()
        if upperCode == "SAVE10" {
            return subtotal * 0.10
        } else if upperCode == "SAVE20" {
            return subtotal * 0.20
        } else if upperCode == "SAVE25" {
            return subtotal * 0.25
        }
        return 0
    }
    
    var total: Double {
        let result = subtotal - discountAmount
        return result > 0 ? result : 0
    }
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        return street + "\n" + city + ", " + zipCode + "\n" + country
    }
}

struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
}

class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order] = []
    
    init(userId: String, name: String, email: String) {
        self.userId = userId
        self.name = name
        self.email = email
    }
    
    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }
    
    var totalSpent: Double {
        var total = 0.0
        for order in orderHistory {
            total += order.total
        }
        return total
    }
}

let laptop = Product(id: "001", name: "MacBook Pro", price: 1999.99, category: .electronics, description: "Powerful laptop")
let book = Product(id: "002", name: "Swift Programming", price: 49.99, category: .books, description: "Learn Swift")
let headphones = Product(id: "003", name: "AirPods Pro", price: 249.99, category: .electronics, description: "Wireless earbuds")

if let laptop = laptop, let book = book, let headphones = headphones {
    
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    
    print("Items in cart: \(cart.itemCount)")
    
    cart.addItem(product: laptop, quantity: 1)
    
    if let laptopItem = cart.items.first(where: { $0.product.id == laptop.id }) {
        print("Laptop quantity: \(laptopItem.quantity)")
    }
    
    print("Subtotal: $\(cart.subtotal)")
    
    cart.discountCode = "SAVE10"
    print("Total with discount: $\(cart.total)")
    
    cart.removeItem(productId: book.id)
    print("Items after removal: \(cart.itemCount)")
    
    func modifyCart(_ c: ShoppingCart) {
        c.addItem(product: headphones, quantity: 1)
    }
    
    let countBefore = cart.itemCount
    modifyCart(cart)
    print("Reference type: \(countBefore) -> \(cart.itemCount)")
    
    var item1 = CartItem(product: laptop, quantity: 1)
    if var item1 = item1 {
        var item2 = item1
        item2.updateQuantity(5)
        print("Value type: item1=\(item1.quantity), item2=\(item2.quantity)")
    }
    
    let address = Address(street: "123 Swift Lane", city: "Cupertino", zipCode: "95014", country: "USA")
    let order = Order(from: cart, shippingAddress: address)
    
    let orderItems = order.itemCount
    cart.clearCart()
    print("Order items: \(orderItems), Cart items: \(cart.itemCount)")
    
    let user = User(userId: "U001", name: "John Doe", email: "john@example.com")
    user.placeOrder(order)
    print("User total spent: $\(user.totalSpent)")
}
