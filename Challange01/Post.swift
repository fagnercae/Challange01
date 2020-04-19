//
//  Post.swift
//  Challange01
//
//  Created by Fagner Caetano on 19/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import Foundation

class Post {
    let imageName: String
    var positiveLikes: Int
    var negativeLikes: Int
    
    init(imageName: String, positiveLikes: Int = 0, negativeLikes: Int = 0) {
        self.imageName = imageName
        self.positiveLikes = positiveLikes
        self.negativeLikes = negativeLikes
        
    }
}
