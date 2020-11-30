//
////: [Previous](@previous)
//
//import Foundation
//import UIKit
//
////struct SpotifyPlaylist: Codable {
////    var items: [PlaylistItem]
////}
////
//
//struct AccessToken: Codable {
//    var access_token: String
//}
//
//struct Recommendations: Codable {
//    var tracks: [Track]
//}
//
//struct Track: Codable {
//    var id: String
//    var name: String
//    var popularity: Int
//    var artists: [Artist]
//    var album: Album
//    
//}
//struct Artist: Codable {
//    var name: String
//}
//
//struct Album: Codable {
//    var images: [Image]
//}
//
//struct Image: Codable {
//    var url: String
//}
//
//struct TrackAudioDetails: Codable {
//    var audio_features: [AudioFeature]
//}
//
//struct AudioFeature: Codable {
//    var danceability: Float
//    var energy: Float
//    var tempo: Float
//    var id: String
//}
//
////struct Genre {
////    var name: String
////    var seedArtists: [Int: Set<String>]
////    var seedTracks: [Int: Set<String>]
////
////    init(name: String, seedArtists: [Int:Set<String>], seedTracks: [Int: Set<String>]) {
////        self.name = name
////        self.seedArtists = seedArtists
////        self.seedTracks = seedTracks
////    }
////}
//
////            "https://api.spotify.com/v1/recommendations?market=US&seed_artists=" + seedArtists + "&seed_genres=" + seedGenres + "&seed_tracks=" +  seedTracks + "&min_danceability=" + filter.danceability.min + "&max_danceability=" + filter.danceability.max + "&target_danceability=" + filter.danceability.target + "&min_energy=" + filter.energy.min + "&max_energy=" + filter.energy.max + "&target_energy=" + filter.energy.target + "&min_tempo=" + filter.tempo.min + "&max_tempo=" + filter.tempo.max + "&target_tempo=" + filter.tempo.target
//
//
//class JSONParser {
//    
//    var result: [Song]? {
//        didSet {
////            print(resultDict ?? [:])
//        }
//    }
//    
//    var tracks: [Track]?
//    var audioFeatures: [AudioFeature]?
//    
//    func getToken(genre: Genre, filter: FilterParameters, completion: @escaping (_ completion: String?)->()) {
//        if let url = URL(string: "https://accounts.spotify.com/api/token") {
//            var postRequest = URLRequest(url: url)
//            postRequest.httpMethod = "POST"
//            let bodyParams = "grant_type=client_credentials"
//            postRequest.httpBody = bodyParams.data(using: String.Encoding.ascii, allowLossyConversion: true)
//
//            let id = "1d04d7043b8b4e1bb187011cc95a91df"
//            let secret = "d2c382a9ee614bf49166b5e9d47b9705"
//            let combo = "\(id):\(secret)".toBase64()
//            postRequest.addValue("Basic \(combo)", forHTTPHeaderField: "Authorization")
//
//            let task = URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
//                guard let data = data else {
//                    return
//                }
//                do {
//                      let json = try JSONDecoder().decode(AccessToken.self, from: data)
//                    completion(json.access_token)
//                    self.parse(genre: genre, filter: filter, token: json.access_token)
//                    
////                    self.token = json.access_token
////                    print("\nAcess Token: \(self.token)")
//                  } catch {
//                      print("Failed. \(error)")
//                      return
//                  }
//                //print(String(data: data, encoding: String.Encoding.utf8)!)
//            }
//            task.resume()
//        }
//    }
//    
//    func parse(genre: Genre, filter: FilterParameters, token: String) {
//       
//        
//        let seedArtists: String = Array(genre.seedArtists[filter.hypeLvl]!).joined(separator: "%2C")
//        let seedGenres: String = genre.title
//        let seedTracks: String = Array(genre.seedTracks[filter.hypeLvl]!).joined(separator: "%2C")
//        let URLArray: [String] = ["https://api.spotify.com/v1/recommendations?market=US&seed_artists=",
//                        seedArtists,
//                        "&seed_genres=", seedGenres,
//                        "&seed_tracks=", seedTracks,
//                        "&min_danceability=", String(filter.danceability.min),
//                        "&max_danceability=", String(filter.danceability.max),
//                        "&target_danceability=", String(filter.danceability.target),
//                        "&min_energy=", String(filter.energy.min),
//                        "&max_energy=", String(filter.energy.max),
//                        "&target_energy=", String(filter.energy.target),
//                        "&min_tempo=", String(filter.tempo.min),
//                        "&max_tempo=", String(filter.tempo.max),
//                        "&target_tempo=", String(filter.tempo.target)]
//        
//        let urlString = URLArray.joined(separator: "")
//        //print("\nURLString: \(urlString)")
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//            
//            // parses JSON from URL Request
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data else {
//                    print("URL request did not work")
//                    return
//                }
//                do {
//                    let json = try JSONDecoder().decode(Recommendations.self, from: data)
// 
//                    self.tracks = json.tracks
//                    
//                    var trackIDs = [String]()
//                    for track in json.tracks {
//                        trackIDs.append(track.id)
//                    }
//                    let joined = trackIDs.joined(separator: "%2C")
//                    self.getAudioFeatures(trackIDs: joined, token: token)
////                    print("\nTracks: \n\(String(describing: self.tracks))")
//                    
//                } catch {
//                    print("JSON Playlist object not decodable.")
//                    print("Error \(error)")
//                    return
//                }
//            }.resume()
//        } else {
//            print("Invalid URL")
//            return
//        }
//        // Getting audio feature details for tracks
//        
//    }
//    
//    func getAudioFeatures(trackIDs: String, token: String) {
//         let urlString = "https://api.spotify.com/v1/audio-features?ids=" + trackIDs
//        
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//            
//            // parses JSON from URL Request
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                   guard let data = data else {
//                       print("URL request did not work")
//                       return
//                   }
//                   do {
//                       let json = try JSONDecoder().decode(TrackAudioDetails.self, from: data)
//    
//                       self.audioFeatures = json.audio_features
//                       //print("\n\nAudio Features: \n\(String(describing: self.audioFeatures))")
//                       
//                        
//                        self.createRecList(tracksList: self.tracks!, audioFeaturesList: self.audioFeatures!)
//                   } catch {
//                       print("JSON object not decodable. Error: \(error)")
//                       return
//                   }
//               }.resume()
//        } else {
//            print("Invalid URL")
//        }
//    }
//    
//    func createRecList(tracksList: [Track], audioFeaturesList: [AudioFeature]) -> [Song] {
//        var recList: [Song] = []
//        
//        print("\nNumber of tracks: \(tracksList.count)")
//         print("\nNumber of audio features: \(audioFeaturesList.count)")
//        
//        // zips the tracks and audio features into one song object
//        for (track, features) in zip(tracksList, audioFeaturesList) {
//            if track.id == features.id {
//                let song = Song(id: track.id, title: track.name, artist: track.artists[0].name, danceability: features.danceability, energy: features.energy, tempo: features.tempo, imgUrl: track.album.images[0].url, popularity: track.popularity)
//                recList.append(song)
//            }
//        }
//        print("\nNumber of recommended songs: \(recList.count)")
//        self.result = recList
//        return recList
//        
//    }
//    
//}
//
//extension String {
//    func toBase64() -> String {
//        return Data(self.utf8).base64EncodedString()
//    }
//}
//
////let kpop = Genre(name: "k-pop",
////                 seedArtists: [5: Set(["4gOc8TsQed9eqnqJct2c5v", "2dIgFjalVxs4ThymZ67YCE"])],
////                 seedTracks: [5: Set(["1M9qmt6EFa0RJJV8C7Y3HO", "60M8FSYZP8MA0Wy2huOADL"])])
////
////let parser = JSONParser()
////let filter = FilterParameters(hypeLvl: 5, energy: (min: 0.8, max: 1.0, target: 0.9), danceability: (min: 0.8, max: 1.0, target: 0.9), tempo: (min: 100, max: 20000, target: 170))
////parser.parse(genre: kpop, filter: filter)
////: [Next](@next)
