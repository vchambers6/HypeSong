
//: [Previous](@previous)

import Foundation
import UIKit


struct AccessToken: Codable {
    var access_token: String
}

struct Recommendations: Codable {
    var tracks: [Track]
}

struct Track: Codable {
    var id: String
    var name: String
    var popularity: Int
    var artists: [Artist]
    var album: Album
    var preview_url: String?
    
}
struct Artist: Codable {
    var name: String
}

struct Album: Codable {
    var images: [Image]
}

struct Image: Codable {
    var url: String
}

struct TrackAudioDetails: Codable {
    var audio_features: [AudioFeature]
}

struct AudioFeature: Codable {
    var danceability: Float
    var energy: Float
    var tempo: Float
    var id: String
}

class JSONParser {
    
    var result: [Song]? {
        didSet {
//            print(resultDict ?? [:])
        }
    }
    
    var tracks: [Track]?
    var audioFeatures: [AudioFeature]?
    
    func parse(genre: Genre, filter: FilterParameters, completion: @escaping (_ completion: [Song]?)->()) {
        //var token: String?
        self.getToken(genre: genre, filter: filter) { tokenCompletion in
            guard let token = tokenCompletion else { return }
            
            self.getSongRecs(genre: genre, filter: filter, token: token) { recsCompletion in
                guard let tracksList = recsCompletion else { return }
                
                // Prepare list of track IDs for audio analysis
                var trackIDs = [String]()
                for track in tracksList {
                        trackIDs.append(track.id)
                }
                let joined = trackIDs.joined(separator: "%2C")
                
                self.getAudioFeatures(trackIDs: joined, tracksList: tracksList, token: token) { AFcompletion in
                    guard let validSongs = AFcompletion else  { return }
                    completion(validSongs)
                }
                 
            }
            
        }
    }
    
    func getToken(genre: Genre, filter: FilterParameters, completion: @escaping (_ completion: String?)->()) {
        if let url = URL(string: "https://accounts.spotify.com/api/token") {
            var postRequest = URLRequest(url: url)
            postRequest.httpMethod = "POST"
            let bodyParams = "grant_type=client_credentials"
            postRequest.httpBody = bodyParams.data(using: String.Encoding.ascii, allowLossyConversion: true)

            let id = "1d04d7043b8b4e1bb187011cc95a91df"
            let secret = "d2c382a9ee614bf49166b5e9d47b9705"
            let combo = "\(id):\(secret)".toBase64()
            postRequest.addValue("Basic \(combo)", forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
                guard let data = data else {
                    return
                }
                do {
                      let json = try JSONDecoder().decode(AccessToken.self, from: data)
                    completion(json.access_token)
                  } catch {
                      print("Failed. \(error)")
                      return
                  }
            }
            task.resume()
        }
    }
    
    func getSongRecs(genre: Genre, filter: FilterParameters, token: String, completion: @escaping (_ completion: [Track]?)->()) {
       
        let seedArtists: String = Array(genre.seedArtists[filter.hypeLvl]!).joined(separator: "%2C")
        let seedGenres: String = genre.title
        let seedTracks: String = Array(genre.seedTracks[filter.hypeLvl]!).joined(separator: "%2C")
        let URLArray: [String] = ["https://api.spotify.com/v1/recommendations?market=US&seed_artists=",
                        seedArtists,
                        "&seed_genres=", seedGenres,
                        "&seed_tracks=", seedTracks,
                        "&min_danceability=", String(filter.danceability.min),
                        "&max_danceability=", String(filter.danceability.max),
                        "&target_danceability=", String(filter.danceability.target),
                        "&min_energy=", String(filter.energy.min),
                        "&max_energy=", String(filter.energy.max),
                        "&target_energy=", String(filter.energy.target),
                        "&min_tempo=", String(filter.tempo.min),
                        "&max_tempo=", String(filter.tempo.max),
                        "&target_tempo=", String(filter.tempo.target)]
        
        let urlString = URLArray.joined(separator: "")
        //print("\nURLString: \(urlString)")
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            // parses JSON from URL Request
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("URL request did not work")
                    return
                }
                do {
                    let json = try JSONDecoder().decode(Recommendations.self, from: data)

                    completion(json.tracks)
                    
//                    var trackIDs = [String]()
//                    for track in json.tracks {
//                        trackIDs.append(track.id)
//                    }
//                    let joined = trackIDs.joined(separator: "%2C")
//                    self.getAudioFeatures(trackIDs: joined, token: token)
//                    print("\nTracks: \n\(String(describing: self.tracks))")
                    
                } catch {
                    print("JSON Playlist object not decodable.")
                    print("Error \(error)")
                    return
                }
            }.resume()
        } else {
            print("Invalid URL")
            return
        }
        // Getting audio feature details for tracks
        
    }
    
    func getAudioFeatures(trackIDs: String, tracksList: [Track], token: String, completion: @escaping (_ completion: [Song]?)->()) {
         let urlString = "https://api.spotify.com/v1/audio-features?ids=" + trackIDs
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            // parses JSON from URL Request
            URLSession.shared.dataTask(with: request) { data, response, error in
                   guard let data = data else {
                       print("URL request did not work")
                       return
                   }
                   do {
                       let json = try JSONDecoder().decode(TrackAudioDetails.self, from: data)
    
                       self.audioFeatures = json.audio_features
                       //print("\n\nAudio Features: \n\(String(describing: self.audioFeatures))")
                    completion(self.createRecList(tracksList: tracksList, audioFeaturesList: json.audio_features))
                   } catch {
                       print("JSON object not decodable. Error: \(error)")
                       return
                   }
               }.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func createRecList(tracksList: [Track], audioFeaturesList: [AudioFeature]) -> [Song] {
        var recList: [Song] = []
        
        print("\nNumber of tracks: \(tracksList.count)")
         print("\nNumber of audio features: \(audioFeaturesList.count)")
        
        // zips the tracks and audio features into one song object
        for (track, features) in zip(tracksList, audioFeaturesList) {
            if track.id == features.id {
                let song = Song(id: track.id, title: track.name, artist: track.artists[0].name, danceability: features.danceability, energy: features.energy, tempo: features.tempo, imgUrl: track.album.images[0].url, popularity: track.popularity, previewURL: track.preview_url)
                recList.append(song)
            }
        }
        print("\nNumber of recommended songs: \(recList.count)")
        self.result = recList
        return recList
        
    }
    
}

extension String {
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
