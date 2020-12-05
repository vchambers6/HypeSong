//
//  SongListViewController.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/13/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class SongListViewController: UITableViewController {
    
    var tracks: [Song]? {
        didSet {
            self.reloadInputViews()
            //tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Number of tracks in table: \(tracks?.count)")

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of tracks \(tracks?.count)")
        return tracks?.count ?? 0
    }
    
    func configure(cell: TrackCell, forRowAt indexPath: IndexPath, with data: Song) {
        cell.trackImage.image = data.image
        cell.trackTitle.text = data.title
        cell.artistName.text = data.artist
        let danceability = data.danceability
        let tempo = data.tempo
        let energy = data.energy

        let heart = UIImage(systemName: "suit.heart")
                   let filledHeart = UIImage(systemName: "suit.heart.fill")
        cell.favButton?.setImage(heart, for: .normal)
        cell.favButton?.setImage(filledHeart, for: .selected)
        
    }
    
    var favorited = Set<TrackCell>()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // remember, we created a tableview with identifier picture in storyboard
        // this lets you dequeue a recycled cell in the container so that you don't have to keep creating cells and instead reuse cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "Track", for: indexPath) as? TrackCell
        // gives the cell text label the same label as the picture. textLabel is an optional.
        
        if let track = tracks?[indexPath.row] {
            configure(cell: cell!, forRowAt: indexPath, with: track)
            cell?.track = track
            
        }
        
        let selected = favoritedTracks.favoritesList[indexPath] ?? false
        
        cell?.selectedButton = favoritedTracks.favoritesList[indexPath] ?? false
        cell?.index = indexPath
        cell?.selectedButton = selected
        
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? SongDetailViewController {
            
            let track = tracks?[indexPath.row]
            
            vc.indexPath = indexPath
            vc.selectedButton = favoritedTracks.favoritesList[indexPath] ?? false
            vc.track = track
            
            navigationController?.pushViewController(vc, animated: true)
        }
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


