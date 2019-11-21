//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favouriteButton: UIButton!
    
    var course: Course!
    
    private var isFavourite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavouriteStatus()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavourite.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
        DataManager.shared.saveFavouriteStatus(for: course.name ?? "", with: isFavourite)
    }
    
    private func setupUI() {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests ?? 0)"
        
        guard let imageURL = URL(string: course.imageUrl!) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        courseImage.image = UIImage(data: imageData)
        
        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavourite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
    
    private func loadFavouriteStatus() {
        isFavourite = DataManager.shared.loadFavouriteStatus(for: course.name ?? "")
    }
}
