//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        textLabel?.text = course.name
        textLabel?.numberOfLines = 2
        guard let stringURL = course.imageUrl else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageView?.image = UIImage(data: imageData)
    }
}
