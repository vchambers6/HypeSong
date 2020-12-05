//
//  GenreCollectionViewCell.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/15/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    
    var genre: Genre! {
        didSet {
            self.updateUI()
        }
    }
     override func awakeFromNib() {
           super.awakeFromNib()
           
           self.backgroundView = nil

           let blueView = UIView(frame: bounds)
        blueView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
           self.selectedBackgroundView = blueView
       }
    
//    @IBAction func genreButtonTapped(_ sender: UIButton) {
//        print("genre tapped")
//
//    }
    
     
    func updateUI() {
        
        if let genre = genre {
            iconView.image = genre.featuredImage
            genreTitle.text = genre.title
            //genreButton.addTarget(self, action: #selector(genreTapped), for: .touchUpInside)
            //genreButton.isUserInteractionEnabled = true
            
        } else {
            iconView.image = nil
            genreTitle.text = nil
             print("genre not found")
        }
        
    
    }
    
//    func getInfo() {
//        genreButton.addTarget(self, action: #selector(genreTapped), for: .touchUpInside)
//    }
//    
    @objc func genreTapped(_ sender: UIButton) {
          sender.backgroundColor = .systemGray
              print("genre tapped")
              
    }
    
    
    
}
