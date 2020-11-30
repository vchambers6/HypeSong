////
////  GenreViewController.swift
////  HypeSong
////
////  Created by Vanessa Chambers on 11/15/20.
////  Copyright © 2020 Vanessa Chambers. All rights reserved.
////
//
//import UIKit
//import SQLite
//
//class BackupViewController: UIViewController {
//
//    
//
//    @IBOutlet var GoButton: UIButton!
//
//    @IBOutlet var Slider: UISlider!
//    var filterParameters: FilterParameters?
//
//
//    var genres = Genre.fetchGenres()
//
//    var playlist = [PlaylistItem]()
//    var tracksDict = [String: Track]() // key is ID, value is all of the results
//    var trackIDs = [String]()
//    var results = [AudioFeature]()
//    var filteredSet = Set<String>()
//    var displayData = [Track]()
//
//    var selectedGenre: Genre?
//
//    let cellScale: CGFloat = 0.6
//    let token = "BQCwanSxbaoC6OQkUGTlrd6Lhcku7Smhva6nsZnO15fXgc-WUgXfVq88TNrDZ7DBnVg19Bv4W4uuTgLN-HRCoQzA8A_tmh3mHlqZe1Uyo3HA2-VGd16juY3QAtRyGyGQ0BrAusKLKmBBDw"
//
//    let db = Database()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        db.initUserDirectory()
//        db.createTable()
////        initUserDirectory()
////        createTable()
//        //
//    }
//
//    @IBAction func hypeLevelChanged(_ sender: UISlider) {
//        switch sender.value {
//        case 0..<1:
//            filterParameters = FilterParameters(energyLvl: ((min: 0, max: 0.2)), danceLvl: (min: 0, max: 0.2), tempo: (min: 0, max: 50))
//        case 1..<2:
//            filterParameters = FilterParameters(energyLvl: ((min: 0.2, max: 0.4)), danceLvl: (min: 0.2, max: 0.4), tempo: (min: 50, max: 100))
//        case 2..<3:
//            filterParameters = FilterParameters(energyLvl: ((min: 0.4, max: 0.6)), danceLvl: (min: 0.4, max: 0.6), tempo: (min: 100, max: 125))
//        case 3..<4:
//            filterParameters = FilterParameters(energyLvl: ((min: 0.6, max: 0.8)), danceLvl: (min: 0.6, max: 0.8), tempo: (min: 125, max: 150))
//        case 4...5:
//            filterParameters = FilterParameters(energyLvl: ((min: 0.8, max: 1)), danceLvl: (min: 0.8, max: 1), tempo: (min: 150, max: Float.greatestFiniteMagnitude))
//        // set default to middle slider position
//        default:
//            filterParameters = FilterParameters(energyLvl: ((min: 0.4, max: 0.6)), danceLvl: (min: 0.4, max: 0.6), tempo: (min: 100, max: 125))
//        }
//    }
//
//    @IBAction func goButtonTapped(_ sender: UIButton) {
//        //print("hi \(selectedGenre?.title)")
//        self.prepareJson(id: (selectedGenre?.playlistIDs[0])!)
//
//        // First filters through viable tracks, then generates an array of tracks to display in tableview
//
//
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "SongList") as? SongListViewController {
//                       //vc.selectedImage = sorted_pictures[indexPath.row]
//                       //vc.index = indexPath.row
//                       //vc.total_pics = pictures.count
//            vc.tracks = displayData
//            navigationController?.pushViewController(vc, animated: true)
//        }
//
//    }
//
//
//}
//
//
//// Collection View methods
//extension ViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return genres.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Genre", for: indexPath) as! GenreCollectionViewCell
//
//        let genre = genres[indexPath.item]
//        cell.contentView.isUserInteractionEnabled = true
//        cell.genre = genre
//        selectedGenre = cell.genre
//
//        return cell
//    }
//}
//
//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        //print("highlighted")
//           if let cell = collectionView.cellForItem(at: indexPath) {
//               cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
//           }
//       }
//
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) {
//            cell.contentView.backgroundColor = nil
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //print("selected")
//           if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
//            print("selected \(cell.genre.title)")
//            selectedGenre = cell.genre
//           }
//       }
//
//       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//           if let cell = collectionView.cellForItem(at: indexPath) as? GenreCollectionViewCell {
//            selectedGenre = nil
//           }
//       }
//}
//
////// Database Initialization
////extension ViewController {
////    func initUserDirectory() {
////        do {
////            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
////            print("docuemtn directory: \(documentDirectory)")
////            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
////
////            let database = try Connection(fileUrl.path)
////            self.database = database
////        } catch {
////            print(error)
////        }
////    }
////
////    func createTable() {
////        let createTable = self.usersTable.create { (table) in
////            table.column(self.id, primaryKey: true)
////            table.column(self.favorites)
////        }
////        do {
////            try self.database.run(createTable)
////            print("Successfully created table")
////        } catch {
////            print("error")
////        }
////    }
////
////}
//
//// JSON parsing occurs here
//extension ViewController {
//    func prepareJson(id: String) {
//        let urlString = "https://api.spotify.com/v1/playlists/" + id + "/tracks?market=US"
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                self.parsePlaylist(json: data!)
//            }
//            task.resume()
//        }
//    }
//
//    func parsePlaylist(json: Data) {
//        let decoder = JSONDecoder()
//
//        if let playlistTracks = try? decoder.decode(SpotifyPlaylist.self, from: json) {
//            playlist = playlistTracks.items
//            for track in playlist {
//                let id = track.track.id
//                trackIDs.append(id)
//            }
//
//            //print("\(trackIDs)")
//            filterPlaylist(playlist: playlist)
//        } else {
//            print("JSON Playlist object not decodable.")
//        }
//    }
//
//    func parseAudioFeatures(json: Data) {
//        let decoder = JSONDecoder()
//        if let listTrackDetails = try? decoder.decode(TrackAudioDetails.self, from: json) {
//            let testlist = listTrackDetails.audio_features
////            for detail in testlist {
////                print("PARSE WORKED \(detail.id)")
////            }
//            results = testlist
//            //print("\(trackIDs)")
//            filterThis(data: results)
//        } else {
//            print("JSON Track object not decodable")
//        }
//
//    }
//
//    func filterPlaylist(hypeLevel: Float? = nil, playlist: [PlaylistItem]) {
//        var ok = [String]()
//        for i in 0...1 {
//            let track = playlist[i]
//            let id = track.track.id
//            ok.append(id)
//        }
//
//        let parseableList = trackIDs.count <= 100 ? trackIDs : Array(trackIDs[0..<100])
//
//
//        let joined = parseableList.joined(separator: "%2C")
//        //print(joined)
//        //print("Number of tracks in trackID: \(trackIDs.count)")
//
//        let urlString = "https://api.spotify.com/v1/audio-features?ids=" + joined //
//
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                self.parseAudioFeatures(json: data!)
//            }
//            task.resume()
//        } else {
//            print("Invalid URL")
//        }
//
//    }
//}
//
//// Filters results
//extension ViewController {
//    func filterThis(data: [AudioFeature]) {
//        guard let filterParameters = filterParameters else {
//                print("no parameters selected")
//                return
//            }
//        print("Min Danceability: \(filterParameters.danceLvl.min)")
//
//            let filtered = data.filter { $0.danceability >= filterParameters.danceLvl.min && $0.danceability <= filterParameters.danceLvl.max} //
//        for item in filtered {
//            filteredSet.insert(item.id)
//        }
//        //print("Filter results \(filteredSet)")
//        tracksDict = createTrackDict(trackList: playlist, featuresList: results)
//        //print("Tracks Dictionary: \(tracksDict)")
//        displayData = (tracksDict.filter {filteredSet.contains($0.0)}).map {$0.1}
//        print("Data to display in Table View \(displayData)")
//
//    }
//    // creates dictionary to display in table
//    func createTrackDict(trackList: [PlaylistItem], featuresList: [AudioFeature]) -> [String: Track] {
//        var tracks: [String: Track] = [:]
//
//        for (playlistTrack, features) in zip(trackList, featuresList) {
//            let track = Track(id: playlistTrack.track.id, image: UIImage(named: "hiphop")!, title: playlistTrack.track.name, artist: playlistTrack.track.artists[0].name, danceability: features.danceability, energy: features.energy, tempo: features.tempo, imgUrl: playlistTrack.track.album.images[0].url, popularity: playlistTrack.track.popularity)
//            tracks[playlistTrack.track.id] = track
//        }
//        return tracks
//    }
//}
