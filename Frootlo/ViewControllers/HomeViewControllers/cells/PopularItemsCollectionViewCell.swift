//
//  PopularItemsCollectionViewCell.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 24/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class PopularItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var subCategories: UILabel!
    @IBOutlet weak var itemStatus: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var buyNowBtn: UIButton!
    
    static let nib = UINib(nibName: "PopularItemsCollectionViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func buyNowBtn(_ sender: Any) {
    }
    
}
