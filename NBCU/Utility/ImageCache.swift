//
//  SharedImageCache.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/28/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import Foundation
import AlamofireImage

class NewsImageCache {
    
    static let shared = NewsImageCache()
    private var autoPurgingImageCache = AutoPurgingImageCache(memoryCapacity: 1500_000_000, preferredMemoryUsageAfterPurge: 1000_1000)
    
    func cache(image: UIImage, withId: String) {
        self.autoPurgingImageCache.add(image, withIdentifier: withId)
    }
    
    func image(withId: String) -> UIImage? {
        return self.autoPurgingImageCache.image(withIdentifier: withId)
    }
}
