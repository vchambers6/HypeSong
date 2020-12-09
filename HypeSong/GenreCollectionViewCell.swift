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
    
     
    func updateUI() {
        if let genre = genre {
            iconView.image = genre.featuredImage
            genreTitle.text = genre.title
            
        } else {
            iconView.image = nil
            genreTitle.text = nil
             print("genre not found")
        }
        
    }
    
    @objc func genreTapped(_ sender: UIButton) {
          sender.backgroundColor = .systemGray
              print("genre tapped")
              
    }
    
    
    
}
