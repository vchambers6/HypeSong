//
//  SongDetailViewController.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/13/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    @IBOutlet var trackImage: UIImageView!
    @IBOutlet var trackTitle: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var favButton: UIButton?
    @IBOutlet var trackDetails: UILabel!
    
    var selectedButton: Bool! {
        didSet {
            favButton?.isSelected = selectedButton
        }
    }
    
    var track: Song!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let track = track{
            trackImage.image = track.image
            trackTitle.text = track.title
            artistLabel.text = track.artist
            
            let heart = UIImage(systemName: "suit.heart")
            let filledHeart = UIImage(systemName: "suit.heart.fill")
            favButton?.setImage(heart, for: .normal)
            favButton?.setImage(filledHeart, for: .selected)
            
            if let selected = selectedButton {
                favButton?.isSelected = selected
            }
            
            let danceability = track.danceability
            let tempo = track.tempo
            let energy = track.energy
            trackDetails.text = "Song Details: \nDanceability: \(danceability) \nTempo: \(tempo) \nEnergy: \(energy)"
            
            
        } else {
            trackImage.image = nil
            trackTitle.text = "Track Title"
            artistLabel.text = "Artist"
            trackDetails.text = "Track Details"
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didFavorite(_ sender: UIButton) {
        let isSelected = favoritedTracks.favoritesList[indexPath] ?? false
               
               if isSelected {
                   favoritedTracks.favoritesList[indexPath] = false
                   selectedButton = false
                   // enter song into DB
                   Database.delete(item: track)
               } else {
                   favoritedTracks.favoritesList[indexPath] = true
                   selectedButton = true
                   // remove song from DB
                   Database.insert(item: track)
               }
               
               DispatchQueue.global(qos: .userInitiated).async {
                   DBFavorites.fetchData()
               }
               
               
               
           print(favoritedTracks.favoritesList)
               
               
           }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class FavoritesDetailController: SongDetailViewController {
    override func didFavorite(_ sender: UIButton) {
        return
    }
}