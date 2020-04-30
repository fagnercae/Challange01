//
//  ImageViewContoller.swift
//  Challange01
//
//  Created by Fagner Caetano on 20/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
        	
    var post: Post?
    var album = Album.shared
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var negativeLabel: UILabel!
    
    override func viewDidLoad() {
        configureUI()
    }
    
    func configureUI(){
        guard let postUnwrapped = post else {
            print("Post is nil and it shouldn't")
            return
        }
        imageView.image = UIImage(named: postUnwrapped.imageName)
        positiveLabel.text = String(postUnwrapped.positiveLikes)
        negativeLabel.text = String(postUnwrapped.negativeLikes)
        
        
    }
    
    @IBAction func didTouchPositiveButton(_ sender: Any) {
        post?.positiveLikes += 1
        configureUI()
    }
    
    @IBAction func didTouchNegativeButton(_ sender: Any) {
        post?.negativeLikes += 1
        configureUI()
    }
    
}

