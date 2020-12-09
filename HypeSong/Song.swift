//
//  Song.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/24/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit
class Song {
    var id: String
    var image: UIImage
    var title: String
    var artist: String
    var danceability: Float
    var energy: Float
    var tempo: Float
    var imgUrl: String
    var popularity: Int
    var previewURL: String?

    init(id: String, title: String, artist: String, danceability: Float, energy: Float, tempo: Float, imgUrl: String, popularity: Int, previewURL: String?) {
        self.id = id
        self.title = title
        self.artist = artist
        self.danceability = danceability
        self.energy = energy
        self.tempo = tempo
        self.imgUrl = imgUrl
        self.popularity = popularity
        self.previewURL = previewURL
        
        let url = URL(string: imgUrl)
        if let data = try? Data(contentsOf: url!) {
            self.image = UIImage(data: data) ?? UIImage(named: "hiphop")!
        } else {
            self.image = UIImage(named: "hiphop")!
        }//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
    }
    
    
}


