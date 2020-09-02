//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 02.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseDetails {
    
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    unowned var view: CourseDetailsViewProtocol
    var interactor: CourseDetailsInteractorProtocol!
    
    required init(view: CourseDetailsViewProtocol) {
        self.view = view
    }
    
    func showDetails() {
        
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    
}
