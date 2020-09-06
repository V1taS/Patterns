//
//  CourseListInteractor.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

// Interactor Input
protocol CourseListInteractorProtocol: class {
    init(presenter: CourseListInteractirOutputProtocol)
    func fetchCourses()
}

// Interactor Output
protocol CourseListInteractirOutputProtocol: class {
    func coursesDidRecive(_ courses: [Course])
}

class CourseListInteractor: CourseListInteractorProtocol {
    
    unowned let presenter: CourseListInteractirOutputProtocol
    
    required init(presenter: CourseListInteractirOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { courses in
            self.presenter.coursesDidRecive(courses)
        }
    }
}
