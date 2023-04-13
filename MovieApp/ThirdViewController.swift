//
//  ThirdViewController.swift
//  MovieApp
//
//  Created by Alper Canımoğlu on 23.03.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var movieDetailImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var movieDetailNameLabel: UILabel!
    @IBOutlet weak var movieDetailTimeLabel: UILabel!
    @IBOutlet weak var movieDetailImdbLabel: UILabel!
    @IBOutlet weak var movieDetailStorylineLabel: UILabel!
    @IBOutlet weak var movieDetailsLabel: UILabel!
    
    var chosenImageItem : UIImage?
    var selectedMoviewName : String?
    var chosenMovieStoryline : String?
    var heartColorFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDetailImage.layer.cornerRadius = 20
        movieDetailImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        movieDetailImage.clipsToBounds = true
        self.movieDetailImage.image = chosenImageItem
        
        // MARK - Movie Details Name Label
        
        movieDetailNameLabel.text = selectedMoviewName
        self.navigationItem.title = selectedMoviewName
        
        // MARK - Movie Details Time Label
        
        movieDetailTimeLabel.text = "152 minutes"
        
        // MARK - Movie Details IMDb Label
        
        movieDetailImdbLabel.text = "7.0 (IMDb)"
        
        // MARK - Movie Details Label
        
        movieDetailsLabel.text = chosenMovieStoryline
        
        // MARK - Movie Details Storyline Label
        
        movieDetailStorylineLabel.text = "Synopsis"
        
    }
    
    // MARK - Favourite (Heart) Button
    
//    @IBAction func favouriteButton(_ sender: Any) {
//        if heartColorFlag == true {
//            heartImage.tintColor = UIColor.red
//            heartColorFlag = false
//        }else{
//            heartImage.tintColor = UIColor.white
//            heartColorFlag = true
//        }
//    }
    
}
