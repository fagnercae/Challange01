//
//  Album.swift
//  Challange01
//
//  Created by Fagner Caetano on 19/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import Foundation

class Album {
    var posts: [Post] = []
    
    init() {
        for i in 1...11 {
            let imageNumber = String(format: "%02d", i)
            let imageName = "pic\(imageNumber)"
            let post = Post(imageName: imageName)
            posts.append(post)
        }
    }
    
}
