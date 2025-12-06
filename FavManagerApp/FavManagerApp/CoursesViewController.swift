//
//  CoursesViewController.swift
//  FavManagerApp
//
//  Created by Ayaulym on 06.12.2025.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let courses: [FavouriteItem] = [
        FavouriteItem(
            title: "iOS Development",
            image: .course1,
            description: "Myrzakanurov A.",
            review: "Interesting tasks and good explanation on lectures."
        ),
        FavouriteItem(
            title: "Computer Networks",
            image: .course2,
            description: "Imanbaev A.",
            review: "Very detailed explanation of material on practices, easy"
        ),
        FavouriteItem(
            title: "Unity Game Engine I",
            image: .course3,
            description: "Tuchashvili D.",
            review: "I have fun by creating the game"
        ),
        FavouriteItem(
            title: "Web Development",
            image: .course4,
            description: "Bobur A.",
            review: "Helped to get my first internship"
        ),
        FavouriteItem(
            title: "Computer Architecture",
            image: .course5,
            description: "Yoldash Suhrab",
            review: "Kind teacher, got full attestation"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Courses"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courseDetail",
           let detailVC = segue.destination as? DetailViewController,
           let selectedIndex = tableView.indexPathForSelectedRow?.row {
            detailVC.item = courses[selectedIndex]
        }
    }
}

extension CoursesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath)
        let course = courses[indexPath.row]
        
        var conf = cell.defaultContentConfiguration()
        conf.text = course.title
        conf.image = UIImage(systemName: "graduationcap.fill")
        cell.contentConfiguration = conf
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "courseDetail", sender: nil)
    }
}
