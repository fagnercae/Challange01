//
//  ListImageViewController.swift
//  Challange01
//
//  Created by Fagner Caetano on 12/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import UIKit

class ListImageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let album = Album()
    
    func registerListImageCell() {
        let nib = UINib.init(nibName: "ListImageTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ListImageTableViewCell")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerListImageCell()
        tableView.dataSource = self
        tableView.delegate = self
                
    }
    
    
}

extension ListImageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        album.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListImageTableViewCell", for: indexPath) as! ListImageTableViewCell
        let imageName = UIImage(named: album.posts[indexPath.row].imageName)
        cell.photoImageView.image = imageName
        cell.positiveLabel.text = "0"
        cell.negativeLabel.text = "0"
        cell.likesDelegate = self
        return cell
    }
}

extension ListImageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
}

extension ListImageViewController: ListImageTableViewCellDelegate {
    func touchPositiveButton(cell: ListImageTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let post = album.posts[indexPath.row]
        post.positiveLikes += 1
        cell.positiveLabel.text = String(post.positiveLikes)
        
    }
    
    func touchNegativeButton(cell: ListImageTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let post = album.posts[indexPath.row]
        post.negativeLikes += 1
        cell.negativeLabel.text = String(post.negativeLikes)
        
    }
    
    
}
