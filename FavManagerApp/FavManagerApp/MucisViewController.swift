//
//  MucisViewController.swift
//  FavManagerApp
//
//  Created by Ayaulym on 06.12.2025.
//
import UIKit

class MusicViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let music: [FavouriteItem] = [
        FavouriteItem(
            title: "Temporary",
            image: .music1,
            description: "Eminem, Skylar Grey",
            review: "none"
        ),
        FavouriteItem(
            title: "Вороны",
            image: .music2,
            description: "Nervy",
            review: "none"
        ),
        FavouriteItem(
            title: "Твоё имя",
            image: .music3,
            description: "Монеточка",
            review: "none"
        ),
        FavouriteItem(
            title: "The Line",
            image: .music4,
            description: "Twenty One Pilots",
            review: "none"
        ),
        FavouriteItem(
            title: "Drift Away",
            image: .music5,
            description: "Sarah Stiles",
            review: "none"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Music"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "musicDetail",
           let detailVC = segue.destination as? DetailViewController,
           let selectedIndex = tableView.indexPathForSelectedRow?.row {
            detailVC.item = music[selectedIndex]
        }
    }
}

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        let song = music[indexPath.row]
        
        var conf = cell.defaultContentConfiguration()
        conf.text = song.title
        conf.image = UIImage(systemName: "play.fill")
        cell.contentConfiguration = conf
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "musicDetail", sender: nil)
    }
}
