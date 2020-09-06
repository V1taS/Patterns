//
//  CourseListPresenter.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

class CourseListPresenter: CourseListOutputProtocol {
    
    unowned let view: CourseListViewProtocol
    var interactor: CourseListInteractorProtocol!
    var router: CourseListRouterProtocol!
    
    var coursesCount: Int {
        courses.count
    }
    
    var course: Course? {
        guard let indexPath = indexPath else { return nil }
        return getCourse(at: indexPath)
    }
    
    private var courses: [Course] = []
    private var indexPath: IndexPath?
    
    required init(view: CourseListViewProtocol) {
        self.view = view
    }
    
    func showCourses() {
        interactor.fetchCourses()
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func showCourseDetails() {
        guard let course = course else { return }
        router.openCourseDetailsViewController(with: course)
    }
    
    private func getCourse(at indexPath: IndexPath) -> Course {
        courses[indexPath.row]
    }
}

extension CourseListPresenter: CourseListInteractirOutputProtocol {
    func coursesDidRecive(_ courses: [Course]) {
        self.courses = courses
        view.reloadData()
    }
}
