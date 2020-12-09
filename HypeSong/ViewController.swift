//
//  GenreViewController.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/15/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    @IBOutlet var GoButton: LoadingButton!
    @IBOutlet var Slider: UISlider!
    var filterParameters = FilterParameters(hypeLvl: 3, energy: (min: 0.4, max: 0.6, target: 0.5), danceability: (min: 0.4, max: 0.6, target: 0.5), tempo: (min: 75, max: 150, target: 100))
    
    let parser = JSONParser()
    var selectedGenre: Genre?
    
    let genres = Genre.fetchGenres()
    
    //let db = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.initFavoritesDirectory()
        Database.createTable()
        
        // Adding border to go button
        GoButton.layer.borderWidth = 1
        GoButton.layer.borderColor = UIColor.white.cgColor

    }
    
    @IBAction func hypeLevelChanged(_ sender: UISlider) {
        print("Hype Level: \(sender.value)")
        switch sender.value {
        case 0..<1:
            filterParameters = FilterParameters(hypeLvl: 1, energy: (min: 0, max: 0.2, target: 0.1), danceability: (min: 0, max: 0.2, target: 0.1), tempo: (min: 0, max: 100, target: 50))
        case 1..<2:
            filterParameters = FilterParameters(hypeLvl: 2, energy: (min: 0.2, max: 0.4, target: 0.3), danceability: (min: 0.2, max: 0.4, target: 0.3), tempo: (min: 50, max: 125, target: 75))
        case 2..<3:
            filterParameters = FilterParameters(hypeLvl: 3, energy: (min: 0.4, max: 0.6, target: 0.5), danceability: (min: 0.4, max: 0.6, target: 0.5), tempo: (min: 75, max: 150, target: 100))
        case 3..<4:
            filterParameters = FilterParameters(hypeLvl: 4, energy: (min: 0.6, max: 0.8, target: 0.7), danceability: (min: 0.6, max: 0.8, target: 0.9), tempo: (min: 75, max: 200, target: 150))
        case 4...5:
            filterParameters = FilterParameters(hypeLvl: 5, energy: (min: 0.8, max: 1, target: 0.9), danceability: (min: 0.8, max: 1, target: 1), tempo: (min: 75, max: 20000, target: 170))
        // set default to middle slider position
        default:
            filterParameters = FilterParameters(hypeLvl: 3, energy: (min: 0.4, max: 0.6, target: 0.5), danceability: (min: 0.4, max: 0.6, target: 0.5), tempo: (min: 75, max: 150, target: 100))
        }
    }
    
    @IBAction func goButtonTapped(_ sender: LoadingButton) {
        
        GoButton.showLoading()
        
        // empties favoritedTracks dictionary to prepare for new results
        favoritedTracks.favoritesList.removeAll()
        
        // GET data from Spotify Web API, push data into the SongListViewController when done
        parser.parse(genre: selectedGenre!, filter: filterParameters) { completion in
            guard let data = completion else { return }
            DispatchQueue.main.async {
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SongList") as? SongListViewController {
                                  //vc.selectedImage = sorted_pictures[indexPath.row]
                                  //vc.index = indexPath.row
                                  //vc.total_pics = pictures.count
                       vc.tracks = data
                    if let genre = self.selectedGenre?.title {
                        vc.title = "Results for: \(genre) Hype Level \(self.filterParameters.hypeLvl)"
                    }
                    else {
                        vc.title = "Results for: Hype Level \(self.filterParameters.hypeLvl)"
                    }
                    
                self.navigationController?.pushViewController(vc, animated: true)
                
                    self.GoButton.hideLoading()
                }
            }
            
        }
    }
    
}


// Collection View data methods
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Genre", for: indexPath) as! GenreCollectionViewCell
        
        let genre = genres[indexPath.item]
        cell.contentView.isUserInteractionEnabled = true
        cell.genre = genre
        selectedGenre = cell.genre
        
        return cell
    }
}

// Collection View delegate methods
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //print("highlighted")
           if let cell = collectionView.cellForItem(at: indexPath) {
               cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = nil
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("selected")
           if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
            print("selected \(cell.genre.title)")
            selectedGenre = cell.genre
           }
       }
       
       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
           if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
            selectedGenre = nil
           }
       }
}
