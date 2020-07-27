//
//  HomeHeaderView.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 27/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// loadNib
    ///
    /// - Returns: instance of current class
    class func loadNib() -> HomeHeaderView {
        return Bundle.main.loadNibNamed("HomeHeaderView", owner: self, options: nil)?.first as! HomeHeaderView
    }
    
}
