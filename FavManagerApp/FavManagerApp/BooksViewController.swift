//
//  BooksViewController.swift
//  FavManagerApp
//
//  Created by Ayaulym on 06.12.2025.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let books: [FavouriteItem] = [
        FavouriteItem(
            title: "It Didn't Start with You",
            image: .book1,
            description: "Book by Mark Wolynn",
            review: "An eye-opening and compassionate book that makes complex emotional patterns feel understandable and deeply hopeful."
        ),
        FavouriteItem(
            title: "Maisie Hitchins Collection",
            image: .book2,
            description: "Books by Holly Webb",
            review: "A charming and fun mystery series filled with warmth, clever clues, and an adventurous heroine young readers instantly love."
        ),
        FavouriteItem(
            title: "The Call of Cthulhu",
            image: .book3,
            description: "Short story by H. P. Lovecraft",
            review: "A captivating classic of cosmic horror that builds an unforgettable sense of mystery and dread through its eerie storytelling."
        ),
        FavouriteItem(
            title: "Murder on the Orient Express",
            image: .book4,
            description: "Book by Agatha Christie",
            review: "A brilliantly plotted mystery with sharp writing and one of the most satisfying twists in detective fiction."
        ),
        FavouriteItem(
            title: "Nonviolent Communication: A Language of Life",
            image: .book5,
            description: "Book by Marshall Rosenberg",
            review: "A thoughtful and empowering guide that makes meaningful, empathetic communication feel both accessible and transformative."
        ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Books"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookDetail",
           let detailVC = segue.destination as? DetailViewController,
           let selectedIndex = tableView.indexPathForSelectedRow?.row {
            detailVC.item = books[selectedIndex]
        }
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        let book = books[indexPath.row]
        
        var conf = cell.defaultContentConfiguration()
        conf.text = book.title
        conf.image = UIImage(systemName: "book.fill")
        cell.contentConfiguration = conf
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "bookDetail", sender: nil)
    }
}
