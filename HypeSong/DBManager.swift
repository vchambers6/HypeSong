//
//  DBManager.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/22/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import SQLite
import UIKit

class Database {
    
    static var database: Connection!
    static let favoritesTable = Table("Favorites")
    static let id = Expression<Int>("id")
    static let spotifyID = Expression<String>("spotify ID")
    static let title = Expression<String>("title")
    static let artist = Expression<String>("artist")
    static let danceability = Expression<Double>("danceability")
    static let energy = Expression<Double>("energy")
    static let tempo = Expression<Double>("tempo")
    static let imgURL = Expression<String>("imgURL")
    static let popularity = Expression<Int>("popularity")
    static let previewURL = Expression<String>("previewURL")
    
    static func initFavoritesDirectory() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print("Document directory: \(documentDirectory)")
            let fileUrl = documentDirectory.appendingPathComponent("Favorites").appendingPathExtension("sqlite3")

            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }

    static func createTable() {
        let create = self.favoritesTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.spotifyID)
            table.column(self.title)
            table.column(self.artist)
            table.column(self.danceability)
            table.column(self.energy)
            table.column(self.tempo)
            table.column(self.imgURL)
            table.column(self.popularity)
            table.column(self.previewURL)
        }
        do {
            try self.database.run(create)
            print("Successfully created table")
        } catch {
            print("Could not create table")
        }
    }
    
    static func insert(item: Song) {
        let query = favoritesTable.filter(spotifyID == item.id)
        
        if (try! database.pluck(query)) == nil {
            let insert = self.favoritesTable.insert(spotifyID <- item.id, title <- item.title, danceability <- Double(item.danceability), artist <- item.artist, energy <- Double(item.energy), tempo <- Double(item.tempo), imgURL <- item.imgUrl, popularity <- item.popularity, previewURL <- item.previewURL ?? "")
            try? self.database.run(insert)
        }
    }
    
    static func delete(item: Song) {
        let entry = self.favoritesTable.filter(spotifyID == item.id)
        let res = try? database.run(entry.delete())
        //print("delete: \(String(describing: res))")
    }
    
    static func getFavorites() -> [Song] {
        var songs = [Song]()
        
        for song in try! database.prepare(favoritesTable) {
            let songObject = Song(id: song[spotifyID], title: song[title], artist: song[artist], danceability: Float(song[danceability]), energy: Float(song[energy]), tempo: Float(song[tempo]), imgUrl: song[imgURL], popularity: song[popularity], previewURL: song[previewURL])
            songs.append(songObject)
        }
        return songs
    }
    
    
}
