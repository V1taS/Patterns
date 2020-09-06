//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 02.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

// InteractorInput
protocol CourseDetailsInteractorProtocol: class {
    var isFavorite: Bool { get set }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
    func toggleFavoriteStatus()
}

// Intercator Output
protocol CourseDetailsInteractorOutputProtocol: class {
    func reciveCourseDetails(courseDetails: CourseDetails)
}

class CourseDetailsInteractor: CourseDetailsInteractorProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    
    var isFavorite: Bool {
        get {
            DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
        } set {
            DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let courseDetails = CourseDetails(
            courseName: course.name ?? "",
            numberOfLessons: course.numberOfLessons ?? 0,
            numberOfTests: course.numberOfTests ?? 0,
            imageData: ImageManager.shared.getImageData(from: course.imageUrl)
        )
        presenter.reciveCourseDetails(courseDetails: courseDetails)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
    }
}
