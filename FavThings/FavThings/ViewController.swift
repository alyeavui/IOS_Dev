//
//  ViewController.swift
//  FavThings
//
//  Created by Ayaulym on 15.11.2025.
//

import UIKit

struct Sections {
    let sectionTitle: String
}

let sections: [Sections] = [
        Sections(sectionTitle: "Favourite Movies/Series"),
        Sections(sectionTitle: "Favourite Music"),
        Sections(sectionTitle: "Favourite Books"),
        Sections(sectionTitle: "Favourite Courses")
]

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    let movies: [MovieItem] = [
        MovieItem(title: "Anne with an E", subtitle: "2017 ‧ Drama ‧ 3 seasons", image: .film1, review: "A beautifully heartwarming and thoughtful series that celebrates imagination, kindness, and finding your place in the world."),
        MovieItem(title: "Desperate Housewives", subtitle: "2004 ‧ Drama ‧ 8 seasons", image: .film2, review: "A clever, addictive drama full of wit, intrigue, and unforgettable characters that keep you hooked from start to finish."),
        MovieItem(title: "Knives Out", subtitle: "2019 ‧ Mystery/Comedy ‧ 2h 10m", image: .film3, review: "A stylish and brilliantly crafted mystery that keeps you guessing with sharp humor and smart twists."),
        MovieItem(title: "Forgotten", subtitle: "2017 ‧ Thriller/Mystery ‧ 1h 49m", image: .film4, review: "A gripping thriller with an eerie atmosphere and a twist that stays in your mind long after the credits roll."),
        MovieItem(title: "All of Us Are Dead", subtitle: "2022 ‧ Horror ‧ 1 season", image: .film5, review: "A fast-paced and emotional zombie series that mixes intense action with surprisingly deep character moments.")
    ]
    
    let musics: [MusicItem] = [
        MusicItem(cover: .music1, title: "Temporary", artist: "Eminem, Skylar Grey", releaseYear: "2024"),
        MusicItem(cover: .music2, title: "Вороны", artist: "Nervy", releaseYear: "2012"),
        MusicItem(cover: .music3, title: "Твоё имя", artist: "Монеточка", releaseYear: "2018"),
        MusicItem(cover: .music4, title: "The Line", artist: "Twenty One Pilots", releaseYear: "2024"),
        MusicItem(cover: .music5, title: "Drift Away", artist: "Sarah Stiles", releaseYear: "2019")
    ]
    
    let books: [BookItem] = [
        BookItem(bookCover: .book1, bookTitle: "It Didn't Start with You", bookAuthor: "Book by Mark Wolynn", bookReview: "An eye-opening and compassionate book that makes complex emotional patterns feel understandable and deeply hopeful."),
        BookItem(bookCover: .book2, bookTitle: "Maisie Hitchins Collection", bookAuthor: "Books by Holly Webb", bookReview: "A charming and fun mystery series filled with warmth, clever clues, and an adventurous heroine young readers instantly love."),
        BookItem(bookCover: .book3, bookTitle: "The Call of Cthulhu", bookAuthor: "Short story by H. P. Lovecraft", bookReview: "A captivating classic of cosmic horror that builds an unforgettable sense of mystery and dread through its eerie storytelling."),
        BookItem(bookCover: .book4, bookTitle: "Murder on the Orient Express", bookAuthor: "Book by Agatha Christie", bookReview: "A brilliantly plotted mystery with sharp writing and one of the most satisfying twists in detective fiction."),
        BookItem(bookCover: .book5, bookTitle: "Nonviolent Communication: A Language of Life", bookAuthor: "Book by Marshall Rosenberg", bookReview: "A thoughtful and empowering guide that makes meaningful, empathetic communication feel both accessible and transformative.")
    ]
    
    let courses: [CourseItem] = [
        CourseItem(courseBook: .course1, title: "iOS Development", professor: "Myrzakanurov A.", reason: "Interesting tasks and good explanation on lectures."),
        CourseItem(courseBook: .course2, title: "Computer Networks", professor: "Imanbaev A.", reason: "Very detailed explanation of material on practices, easy"),
        CourseItem(courseBook: .course3, title: "Unity Game Engine I", professor: "Tuchashvili D.", reason: "I have fun by creating the game"),
        CourseItem(courseBook: .course4, title: "Web Development", professor: "Bobur A.", reason: "Helped to get my first internship"),
        CourseItem(courseBook: .course5, title: "Computer Architecture", professor: "Yoldash Suhrab", reason: "Kind teacher, got full attestation")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return movies.count
            case 1: return musics.count
            case 2: return books.count
            case 3: return courses.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
                let currentMovie = movies[indexPath.row]
                movieCell.configure(movie: currentMovie)
                return movieCell
            case 1:
                let musicCell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicTableViewCell
                let currentMusic = musics[indexPath.row]
                musicCell.configure(music: currentMusic)
                return musicCell
            case 2:
                let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
                let currentBook = books[indexPath.row]
                bookCell.configure(movie: currentBook)
                return bookCell
            case 3:
                let courseCell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
                let currentCourse = courses[indexPath.row]
                courseCell.configure(course: currentCourse)
                return courseCell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
}
