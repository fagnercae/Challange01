//
//  ImagePhotoCell.swift
//  Challange01
//
//  Created by Fagner Caetano on 19/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import UIKit

class ImagePhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var positiveLabel: UILabel!
    
    override func awakeFromNib() {
        
    }
}

//
//let likesLabel = UILabel()
//        likesLabel.text = String(album.posts[indexPath.row].positiveLikes)
//        cell.addSubview(likesLabel)
//        likesLabel.sizeToFit()
//        likesLabel.center = cell.imageView.center
//        print(cell.center)
////        likesLabel.translatesAutoresizingMaskIntoConstraints = false
////        likesLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
////        likesLabel.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
//
