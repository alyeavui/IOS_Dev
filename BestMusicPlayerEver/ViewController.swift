//
//  ViewController.swift
//  BestMusicPlayerEver
//
//  Created by Ayaulym on 02.11.2025.
//

import UIKit
import AVFoundation

struct TrackItem {
    let title: String
    let artist: String
    let image: UIImage?
    let soundFileName: String
    let backgroundImage: UIImage?
}

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var currentIndex = 0
    var isPlaying = false 

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var trackArtistLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let tracks: [TrackItem] = [
        TrackItem(title: "My Name Is", artist: "Eminem", image: UIImage(named: "track1_cover"), soundFileName: "track1", backgroundImage: UIImage(named: "track1_bg")),
        TrackItem(title: "Till I Collapse", artist: "Eminem", image: UIImage(named: "track2_cover"), soundFileName: "track2", backgroundImage: UIImage(named: "track2_bg")),
        TrackItem(title: "Ma Meilleure Ennemie", artist: "Stromae, Pomme", image: UIImage(named: "track3_cover"), soundFileName: "track3", backgroundImage: UIImage(named: "track3_bg")),
        TrackItem(title: "Sweather Weather", artist: "The Neighbourhood", image: UIImage(named: "track5_cover"), soundFileName: "track5", backgroundImage: UIImage(named: "track5_bg")),
        TrackItem(title: "Fate", artist: "i-dle", image: UIImage(named: "track6_cover"), soundFileName: "track6", backgroundImage: UIImage(named: "track6_bg"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(for: currentIndex)
        trackImageView.layer.cornerRadius = 20
        playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        guard let url = Bundle.main.url(forResource: tracks[0].soundFileName, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("could not set initial song")
        }
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
            isPlaying = false
            playPauseButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % tracks.count
        setupUI(for: currentIndex)
        playSound(name: tracks[currentIndex].soundFileName)
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        setupUI(for: currentIndex)
        playSound(name: tracks[currentIndex].soundFileName)
    }

    private func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
        } catch {
            print("Error loading audio file")
        }
    }
    
    private func setupUI(for index: Int) {
        let track = tracks[index]
        trackTitleLabel.text = track.title
        trackArtistLabel.text = track.artist
        trackImageView.image = track.image
        backgroundImageView.image = track.backgroundImage
    }
}

