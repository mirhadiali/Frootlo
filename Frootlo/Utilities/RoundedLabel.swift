//
//  RoundedLabel.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 01/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 */
//    override func draw(_ rect: CGRect) {
//
//    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
