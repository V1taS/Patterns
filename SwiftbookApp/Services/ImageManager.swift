//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 06.09.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func getImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
