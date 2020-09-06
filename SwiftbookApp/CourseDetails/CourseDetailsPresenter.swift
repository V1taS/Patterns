//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 02.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseDetails {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    unowned var view: CourseDetailsViewProtocol
    var interactor: CourseDetailsInteractorProtocol!
    
    var isFavorite: Bool {
        interactor.isFavorite
    }
    
    required init(view: CourseDetailsViewProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
        view.displayImageForFavoriteButton(with: isFavorite)
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func reciveCourseDetails(courseDetails: CourseDetails) {
        let numberOfLesson = "Number of lessons: \(courseDetails.numberOfLessons)"
        let numberOfTests = "Number of tests: \(courseDetails.numberOfTests)"
        
        view.displayCourseName(with: courseDetails.courseName)
        view.displayNumberOfLessons(with: numberOfLesson)
        view.displayNumberOfTests(with: numberOfTests)
        view.displayImageForFavoriteButton(with: isFavorite)
        
        guard let imageData = courseDetails.imageData else { return }
        view.displayCourseImage(with: imageData)
    }
}
