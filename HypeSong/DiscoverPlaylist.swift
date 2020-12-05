//
//  DiscoverPlaylist.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 12/2/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import Foundation

class DiscoverPlaylist {
    var title: String
    var tracks: [Song]
    
    init(title: String, tracks: [Song]) {
        self.title = title
        self.tracks = tracks
    }
    
    static func fetchPlaylists() -> [DiscoverPlaylist] {
        return [
            DiscoverPlaylist(title: "Editor's Pick: Most Hype",
                tracks: [
                    Song(id: "47pgDM5iCb9PYyXYpOPFyF", title: "WINDOWS FT. RICK RO$$", artist: "JOYRYDE", danceability: 0.691, energy: 0.931, tempo: 160.158, imgUrl: "https://i.scdn.co/image/ab67616d0000b27391012b905c6212296dbc9dfe", popularity: 50, previewURL: "https://p.scdn.co/mp3-preview/6eaadcb3df9a6536b6937f2d4d33f1dfc352df77?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "0RzT9tBLcQhofW2TNiHP9B", title: "God’s Menu", artist: "Stray Kids", danceability: 0.689, energy: 0.771, tempo: 157.052, imgUrl: "https://i.scdn.co/image/ab67616d0000b2736e81f5936889abc04508d253", popularity: 76, previewURL: "https://p.scdn.co/mp3-preview/03e474e51e77ba2eb014f0a752a5849631379fb7?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "7DHX1Ng0V186U2idfFfjGi", title: "Burial (feat. Pusha T, Moody Good, TrollPhace)", artist: "Yogi", danceability: 0.689, energy: 0.935, tempo: 145.984, imgUrl: "https://i.scdn.co/image/ab67616d0000b273d6276b9a5a74cdf62183cc86", popularity: 53, previewURL: "https://p.scdn.co/mp3-preview/f4d3ace59628a708921aa9ad21df35bf7f6623e5?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "6OaVWaGfhXn70ZJfdVcabn", title: "NO BYSTANDERS", artist: "NO BYSTANDERS", danceability: 0.731, energy: 0.811, tempo: 147.045, imgUrl: "https://i.scdn.co/image/ab67616d0000b273072e9faef2ef7b6db63834a3", popularity: 74, previewURL: "https://p.scdn.co/mp3-preview/858540a3a175a219743ff3903c9caf0374525166?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "55CHeLEfn5iJ0IIkgaa4si", title: "Savage", artist: "Megan Thee Stallion", danceability: 0.843, energy: 0.741, tempo: 168.983, imgUrl: "https://i.scdn.co/image/ab67616d0000b27320fbc17fcb9376bc76a1b510", popularity: 79, previewURL: "https://p.scdn.co/mp3-preview/c0240762e32d735387bb594760d0d84e44102100?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "75scDPqGs75FotglJSoOI2", title: "75scDPqGs75FotglJSoOI2", artist: "BTS", danceability: 0.606, energy: 0.848, tempo: 170.01, imgUrl: "https://i.scdn.co/image/ab67616d0000b2736feb6d9ed7891f40e9a524dd", popularity: 76, previewURL: "https://p.scdn.co/mp3-preview/b47d17ded8e53b76ac6aaf36ccaef9c8cd095b66?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "1ZtYQ0Xa0FceWOEYOjshui", title: "The Difference - Extended", artist: "Flume", danceability: 0.657, energy: 0.906, tempo: 160.024, imgUrl: "https://i.scdn.co/image/ab67616d0000b273c82543e2f3925f37f29bdb3f", popularity: 52, previewURL: "https://p.scdn.co/mp3-preview/322c90857eef2982c8fe2b274698b47655000cbb?cid=774b29d4f13844c495f206cafdad9c86"),
            ]),
            DiscoverPlaylist(title: "Editor's Pick: Most Chill",
                tracks: [
                    Song(id: "2k9N4caeCIJLOWwWwssrEM", title: "Easily", artist: "Bruno Major", danceability: 0.772, energy: 0.256, tempo: 118.902, imgUrl: "https://i.scdn.co/image/ab67616d0000b273e6dfaed2104e0512b7f22256", popularity: 76, previewURL: "https://p.scdn.co/mp3-preview/553a07ba23de181462a42649a917f6a7f21b1ae9?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "4bOr88BuLILM22g8FKQWrG", title: "Will He (Medasin Remix)", artist: "Joji", danceability: 0.686, energy: 0.539, tempo: 123.929, imgUrl: "https://i.scdn.co/image/ab67616d0000b2738e947f66f6d4eeaa56a28767", popularity: 52, previewURL: "https://p.scdn.co/mp3-preview/e1e4aa46a0cfe02ef674d8e9c50a634c0929d41b?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "6z1kLsntE7FuzKZHZWrXYN", title: "instagram", artist: "DEAN", danceability: 0.463, energy: 0.566, tempo: 93.921, imgUrl: "https://i.scdn.co/image/ab67616d0000b2734ee9dc60013d5648d0f23bcc", popularity: 69, previewURL: "https://p.scdn.co/mp3-preview/3c4094d10d4dc36b4603802d09bab2361b852c63?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "54zabsCSFJQ5Cobk2V0HEN", title: "Ji-Eun's Favorite", artist: "City Girl", danceability: 0.815, energy: 0.475, tempo: 125.919, imgUrl: "https://i.scdn.co/image/ab67616d0000b273269717acb6da971871b069a4", popularity: 39, previewURL: "https://p.scdn.co/mp3-preview/7b9cd71615492065ce223613bbba02c57122afa9?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "0pxqnY8qEjtG4bcjy0QVTI", title: "Morning Jam", artist: "LAKEY INSPIRED", danceability: 0.718, energy: 0.355, tempo: 140.004, imgUrl: "https://i.scdn.co/image/ab67616d0000b273339850142b40f1df48b672da", popularity: 35, previewURL: "https://p.scdn.co/mp3-preview/170c6db421894a69f5f5b3c05d02d6fab222d852?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "35feJdP3v1wFBECgYDhXjD", title: "Sleep Away", artist: "Lexie Liu", danceability: 0.757, energy: 0.534, tempo: 132.932, imgUrl: "https://i.scdn.co/image/ab67616d0000b273676ffbc4ef8232d37e9310f9", popularity: 47, previewURL: "https://p.scdn.co/mp3-preview/bf1f45e05453f257c5ac724dc6b5252ec1177a24?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "7y3uqmsAIB03D3gK3IR9It", title: "Sunflower", artist: "Zach Farache", danceability: 0.825, energy: 0.596, tempo: 136.96, imgUrl: "https://i.scdn.co/image/ab67616d0000b2732f34326552a50ce23b6034ec", popularity: 49, previewURL: "https://p.scdn.co/mp3-preview/649834dd58902e7d47d55dc16a3f2e73cc996482?cid=774b29d4f13844c495f206cafdad9c86"),
                    Song(id: "6GCIYIWUBSLontW6divqsw", title: "Stay Flo", artist: "Solange", danceability: 0.823, energy: 0.558, tempo: 155.974, imgUrl: "https://i.scdn.co/image/ab67616d0000b273b1150f77ae2fbf0d5b4715fc", popularity: 66, previewURL: "https://p.scdn.co/mp3-preview/4a16371bce8ccab4da2bc15982b9835e0eb2a64d?cid=774b29d4f13844c495f206cafdad9c86")
                    
            
            ])
        
        ]
    }
}
