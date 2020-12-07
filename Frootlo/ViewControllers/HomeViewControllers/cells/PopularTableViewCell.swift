//
//  PopularTableViewCell.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 27/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    @IBOutlet weak var popularCollectionView: UICollectionView! {
        didSet {
            popularCollectionView.delegate = self
            popularCollectionView.dataSource = self
            popularCollectionView.register(PopularItemsCollectionViewCell.nib, forCellWithReuseIdentifier: "PopularItemsCollectionViewCellID")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension PopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularItemsCollectionViewCellID", for: indexPath) as! PopularItemsCollectionViewCell
        if indexPath.row == 2 {
            cell.subCategories.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let width = popularCollectionView.frame.width
        let cell = CGSize(width: width , height: 120)
        return cell
        
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 40)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PopularHeaderID", for: indexPath)
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.sectionHeadersPinToVisibleBounds = true
//        }
//        return headerView
//    }
    
}
