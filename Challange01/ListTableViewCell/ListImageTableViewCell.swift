//
//  ListImageTableViewCell.swift
//  Challange01
//
//  Created by Fagner Caetano on 12/04/20.
//  Copyright © 2020 Fagner Caetano. All rights reserved.
//

import UIKit

protocol ListImageTableViewCellDelegate {
    func touchPositiveButton(cell: ListImageTableViewCell)
    
    
    func touchNegativeButton(cell: ListImageTableViewCell)
    
}

class ListImageTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var negativeLabel: UILabel!
    
    var likesDelegate: ListImageTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTouchAtPositiveButton(_ sender: Any) {
        likesDelegate?.touchPositiveButton(cell: self)
    }
    
    
    @IBAction func didTouchAtNegativeButton(_ sender: Any) {
        likesDelegate?.touchNegativeButton(cell: self)
    }
}
