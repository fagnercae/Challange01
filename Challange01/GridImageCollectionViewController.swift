//
//  GridImageCollectionViewController.swift
//  Challange01
//
//  Created by Fagner Caetano on 19/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import UIKit

class GridImageCollectionViewController: UICollectionViewController, UIAdaptivePresentationControllerDelegate {
    
    let album = Album.shared
    let reuseIdentifier = "ImageCell"
    let spacing: CGFloat = 10
    let numberOfCollumns = 2
    
    
    // MARK: - LIFE CICLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //collectionView.setCollectionViewLayout(layout, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return album.posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagePhotoCell
        let imageName = UIImage(named: album.posts[indexPath.row].imageName)
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = imageName
        cell.positiveLabel.text = String(album.posts[indexPath.row].positiveLikes)
        
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postDetails" {
            let destinationViewController = segue.destination as? ImageViewController
            destinationViewController?.presentationController?.delegate = self
            let indexPaths = collectionView.indexPathsForSelectedItems
            guard let firstIndexPath = indexPaths?.first else {
                print("No indexPath selected")
                return
            }
            let post = album.posts[firstIndexPath.row]
            destinationViewController?.post = post
        }
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        collectionView.reloadData()
        
    }
    
//    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        collectionView.reloadData()
//    }
    
}

extension GridImageCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacingSize = (CGFloat(numberOfCollumns + 1)) * spacing
        let availableWidth = self.collectionView.frame.size.width - CGFloat(totalSpacingSize)
        let itemWidth = availableWidth / CGFloat(numberOfCollumns)
        let itemHeight = itemWidth
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
