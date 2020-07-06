//
//  HomeViewController.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 04/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var fruitesCollectionView: UICollectionView!
    @IBOutlet var categoryBtn: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fruitesCollectionView.delegate = self
        fruitesCollectionView.dataSource = self
    }
    
    @IBAction func dropDownBtnTap(_ sender: Any) {
    }
    @IBAction func addLocationBtnTap(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCollectionViewCell", for: indexPath) as! FruitCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
           let width = fruitesCollectionView.frame.width
           let height = fruitesCollectionView.frame.height
           let cell = CGSize(width: width/3 , height: height)
           return cell
       }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 3
    }

}
