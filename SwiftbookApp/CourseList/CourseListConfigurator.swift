//
//  CourseListConfigurator.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorProtocol {
    func configure(with viewController: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    func configure(with viewController: CourseListViewController) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
