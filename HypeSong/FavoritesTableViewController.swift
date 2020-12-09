//
//  FavoritesTableViewController.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/20/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class FavoritesTableViewController: SongListViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Favorites"
        self.fetchData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nFavorites table loaded")
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func fetchData() {
        self.tracks = DBFavorites.favorites
        tableView.reloadData()
        print("\nNumber of tracks in db: \(String(describing: tracks?.count))")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Track", for: indexPath) as? TrackCell
        let track = tracks?[indexPath.row]
        
        cell?.track = track
        //scell?.selectedButton = true
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FavoritesDetail") as? FavoritesDetailController {
            
            let track = tracks?[indexPath.row]
            
            vc.track = track
            vc.selectedButton = true
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        
        if let track = self.tracks?[indexPath.row] {
            //print("Deleted \(track)")
            Database.delete(item: track)
        }
        
        self.tracks?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        DispatchQueue.global(qos: .userInitiated).async {
            DBFavorites.fetchData()
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

struct DBFavorites {
    static var favorites: [Song]? = Database.getFavorites()
    
    static func fetchData() {
        DBFavorites.favorites = Database.getFavorites()
    }
}
