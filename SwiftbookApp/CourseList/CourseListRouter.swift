//
//  CourseListRouter.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

// Input Router
protocol CourseListRouterProtocol {
    init(viewController: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterProtocol {
    
    unowned let viewController: CourseListViewController
    
    required init(viewController: CourseListViewController) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: Segues.showDetails.rawValue, sender: course)
    }
}
