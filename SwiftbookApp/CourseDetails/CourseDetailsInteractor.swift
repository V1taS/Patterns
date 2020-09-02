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
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
}

// Intercator Output
protocol CourseDetailsInteractorOutputProtocol: class {
    
}

class CourseDetailsInteractor: CourseDetailsInteractorProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
}
