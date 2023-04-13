//
//  ViewController.swift
//  MovieApp
//
//  Created by Alper Canımoğlu on 22.03.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    private let movieImageList = ["inspiration4", "star-wars" ,"interstellar"]
    private let movieNameList = ["Inspiration 4", "Star Wars", "Interstellar"]
    private let movieStorylineList = ["Follow the four civilians as they launch into space on a three-day trip orbiting Earth and reaching an altitude higher than that of the International Space Station (ISS). The SpaceX Dragon mission, dubbed Inspiration4, is the most ambitious step to date in the rapidly-developing age of civilian space exploration, making history as the first all-civilian mission to orbit.", "Jedi Master-in-hiding Luke Skywalker unwillingly attempts to guide young hopeful Rey in the ways of the force, while Leia, former princess turned general, attempts to lead what is left of the Resistance away from the ruthless tyrannical grip of the First Order.", "Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionViewCell
        cell.movieImage.image = UIImage(named: movieImageList[indexPath.row])
        cell.movieImage.layer.cornerRadius = 16
        cell.movieImage.clipsToBounds = true
        
        // MARK - Movie Label
        
        let movieLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 330, height: 54))
        movieLabel.center = CGPoint(x: 178, y: 218)
        movieLabel.textAlignment = .left
        movieLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        movieLabel.layer.cornerRadius = 16
        movieLabel.clipsToBounds = true
        cell.addSubview(movieLabel)
        
        // MARK - Movie Name Label
        
        let movieNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 22))
        movieNameLabel.center = CGPoint(x: 178, y: 208)
        movieNameLabel.text = movieNameList[indexPath.row]
        movieNameLabel.textColor = UIColor.white
        movieNameLabel.font = UIFont(name: "SF Pro Text", size: 30)
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        movieNameLabel.textAlignment = .left
        cell.addSubview(movieNameLabel)
        
        // MARK - Movie Clock Image
        
        let movieClockImage = UIImage(systemName: "clock")
        let clockImage = UIImageView(image: movieClockImage)
        clockImage.frame = CGRect(x: 25.9, y: 220, width: 15, height: 15)
        clockImage.tintColor = UIColor.white
        cell.addSubview(clockImage)
        
        // MARK - Movie Time Label
        
        let movieTimeLabel = UILabel(frame: CGRect(x: 35, y: 220, width: 100, height: 16))
        movieTimeLabel.center = CGPoint(x: 95, y: 227)
        movieTimeLabel.text = "152 minutes"
        movieTimeLabel.textColor = UIColor.white
        movieTimeLabel.font = UIFont(name: "SF Pro Text", size: 15)
        movieNameLabel.textAlignment = .left
        cell.addSubview(movieTimeLabel)
        
        // MARK - Movie Favourite (Star) Image
        
        let movieFavouriteImage = UIImage(systemName: "star.fill")
        let starImage = UIImageView(image: movieFavouriteImage)
        starImage.frame = CGRect(x: 145, y: 220, width: 15, height: 15)
        starImage.tintColor = UIColor.white
        cell.addSubview(starImage)
        
        // MARK - Movie IMDb Label
        
        let movieImdbLabel = UILabel(frame: CGRect(x: 35, y: 220, width: 100, height: 16))
        movieImdbLabel.center = CGPoint(x:213, y: 227)
        movieImdbLabel.text = "7.0 (IMDb)"
        movieImdbLabel.textColor = UIColor.white
        movieImdbLabel.font = UIFont(name: "SF Pro Text", size: 15)
        movieImdbLabel.textAlignment = .left
        cell.addSubview(movieImdbLabel)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as? ThirdViewController {
            navigationController?.pushViewController(thirdVC, animated: true)
            thirdVC.chosenImageItem = UIImage(named: movieImageList[indexPath.row])
            thirdVC.selectedMoviewName = movieNameList[indexPath.row]
            thirdVC.chosenMovieStoryline = movieStorylineList[indexPath.row]

        }
    }

}

