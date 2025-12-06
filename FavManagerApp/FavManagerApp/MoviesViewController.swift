//
//  MucisViewController.swift
//  FavManagerApp
//
//  Created by Ayaulym on 06.12.2025.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let movies: [FavouriteItem] = [
        FavouriteItem(
            title: "Anne with an E",
            image: .film1,
            description: "2017 ‧ Drama ‧ 3 seasons",
            review: "A beautifully heartwarming and thoughtful series that celebrates imagination, kindness, and finding your place in the world."
        ),
        FavouriteItem(
            title: "Desperate Housewives",
            image: .film2,
            description: "2004 ‧ Drama ‧ 8 seasons",
            review: "A clever, addictive drama full of wit, intrigue, and unforgettable characters that keep you hooked from start to finish."
        ),
        FavouriteItem(
            title: "Knives Out",
            image: .film3,
            description: "2019 ‧ Mystery/Comedy ‧ 2h 10m",
            review: "A stylish and brilliantly crafted mystery that keeps you guessing with sharp humor and smart twists."
        ),
        FavouriteItem(
            title: "Forgotten",
            image: .film4,
            description: "2017 ‧ Thriller/Mystery ‧ 1h 49m",
            review: "A gripping thriller with an eerie atmosphere and a twist that stays in your mind long after the credits roll."
        ),
        FavouriteItem(
            title: "All of Us Are Dead",
            image: .film5,
            description: "2022 ‧ Horror ‧ 1 season",
            review: "A fast-paced and emotional zombie series that mixes intense action with surprisingly deep character moments."
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Movies"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetail",
           let detailVC = segue.destination as? DetailViewController,
           let selectedIndex = tableView.indexPathForSelectedRow?.row {
            detailVC.item = movies[selectedIndex]
        }
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        
        var conf = cell.defaultContentConfiguration()
        conf.text = movie.title
        conf.image = UIImage(systemName: "film.fill")
        cell.contentConfiguration = conf
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "movieDetail", sender: nil)
    }
}
