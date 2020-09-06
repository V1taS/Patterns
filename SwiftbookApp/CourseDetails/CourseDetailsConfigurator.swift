//
//  CourseDetailsConfigurator.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 02.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsConfiguratorProtocol {
    func cofigure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorProtocol {
    func cofigure(with view: CourseDetailsViewController, and course: Course) {
        let presentor = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presentor, course: course)
        
        view.presenter = presentor
        presentor.interactor = interactor
    }
}
