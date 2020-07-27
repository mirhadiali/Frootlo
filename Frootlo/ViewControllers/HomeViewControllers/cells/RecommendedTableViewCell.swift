//
//  RecommendedTableViewCell.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 27/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recommendedCollectionView: UICollectionView! {
        didSet {
            recommendedCollectionView.delegate = self
            recommendedCollectionView.dataSource = self
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

extension RecommendedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCollectionViewCell", for: indexPath) as! FruitCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = recommendedCollectionView.frame.width
        let height = recommendedCollectionView.frame.height
        let cell = CGSize(width: width/3 , height: height)
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
}
