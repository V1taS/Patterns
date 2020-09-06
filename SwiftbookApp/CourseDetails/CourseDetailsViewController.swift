//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

// ViewInput
protocol CourseDetailsViewProtocol: class {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayCourseImage(with imageData: Data)
    func displayImageForFavoriteButton(with favoriteStatus: Bool)
}

// View Output
protocol CourseDetailsViewOutputProtocol {
    var isFavorite: Bool { get }
    init(view: CourseDetailsViewProtocol)
    func showDetails()
    func favoriteButtonPressed()
}


class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var presenter: CourseDetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
}

// MARK: - CourseDetailsViewProtocol
extension CourseDetailsViewController: CourseDetailsViewProtocol {
    func displayCourseName(with title: String) {
        courseNameLabel.text = title
    }
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessonsLabel.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTestsLabel.text = title
    }
    
    func displayCourseImage(with imageData: Data) {
        let image = UIImage(data: imageData)
        courseImage.image = image
    }
    
    func displayImageForFavoriteButton(with favoriteStatus: Bool) {
        favoriteButton.tintColor = favoriteStatus ? .red : .gray
    }
}
