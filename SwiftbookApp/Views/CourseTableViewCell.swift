//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course?) {
        textLabel?.text = course?.name
        textLabel?.numberOfLines = 2
        guard let imageData = ImageManager.shared.getImageData(from: course?.imageUrl) else { return }
        imageView?.image = UIImage(data: imageData)
    }
}
