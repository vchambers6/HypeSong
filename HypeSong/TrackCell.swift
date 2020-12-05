//
//  TrackCell.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/20/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet var trackImage: UIImageView!
    @IBOutlet var trackTitle: UILabel!
    @IBOutlet var artistName: UILabel!
    @IBOutlet var trackDetails: UILabel?
    @IBOutlet var favButton: UIButton?
    
    var track: Song! {
        didSet {
            self.updateUI()
        }
    }
    var selectedButton: Bool! {
        didSet {
            favButton?.isSelected = selectedButton
        }
    }

    var index: IndexPath!
    
    @IBAction func didFavorite(_ sender: UIButton) {
        print("\nFavorited")
        
        let isSelected = favoritedTracks.favoritesList[index] ?? false
        
        if isSelected {
            favoritedTracks.favoritesList[index] = false
            selectedButton = false
            // enter song into DB
            Database.delete(item: track)
        } else {
            favoritedTracks.favoritesList[index] = true
            selectedButton = true
            // remove song from DB
            Database.insert(item: track)
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            DBFavorites.fetchData()
        }
        
        
        
    print(favoritedTracks.favoritesList)
        
        
    }
    
    override func prepareForReuse() {
//        selectedButton = favoritedTracks.favoritesList[index] ?? false
//
//        if selected {
//            favButton.isSelected = true
//        }
//        else {
//            favButton.isSelected = false
//        }
//        super.prepareForReuse()
//        if favoritedTracks.cellList.contains(self.track.id) {
//            favButton.isSelected = true
//        } else {
//            favButton.isSelected = false
//        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (favButton != nil) {
            self.selectedButton = favoritedTracks.favoritesList[index] ?? false
        }
        
    }
    
    func updateUI() {
        if let track = track{
            trackImage.image = track.image
            trackTitle.text = track.title
            artistName.text = track.artist
            let danceability = track.danceability
            let tempo = track.tempo
            let energy = track.energy
            trackDetails?.text = "Song Details: \nDanceability: \(danceability) \nTempo: \(tempo) \nEnergy: \(energy)"
            let heart = UIImage(systemName: "suit.heart")
            let filledHeart = UIImage(systemName: "suit.heart.fill")
            favButton?.setImage(heart, for: .normal)
            favButton?.setImage(filledHeart, for: .selected)
//            favButton?.isSelected = selectedButton
            
            
        } else {
            trackImage.image = nil
            trackTitle.text = nil
            artistName.text = nil
            trackDetails?.text = "hiii"
        }
        
        
    }
    
}

class FavoritesTrackCell: TrackCell {
    override var selectedButton: Bool! {
        didSet {
            return
        }
    }
    
    override func didFavorite(_ sender: UIButton) {
        return
    }
}
