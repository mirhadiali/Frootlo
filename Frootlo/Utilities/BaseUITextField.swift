//
//  BaseUITextField.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 01/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

@IBDesignable class BaseUITextField: UITextField {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     */
    //    override func draw(_ rect: CGRect) {
    //
    //    }
    
    /*
    @IBInspectable public var signikaBold: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaRegular = false
                signikaSemiBold = false
                self.font = UIFont(name: Constants.Fonts.Signika.Light, size: fontSize)
                
            }
        }
    }
    @IBInspectable public var signikaSemiBold: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaRegular = false
                signikaBold = false
                self.font = UIFont(name: Constants.Fonts.Signika.SemiBold, size: fontSize)
            }
        }
    }
    @IBInspectable public var signikaRegular: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaSemiBold = false
                signikaBold = false
                self.font = UIFont(name: Constants.Fonts.Signika.Regular, size: fontSize)
            }
        }
    }
    @IBInspectable public var signikaLight: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaSemiBold = false
                signikaRegular = false
                signikaBold = false
                self.font = UIFont(name: Constants.Fonts.Signika.Light, size: fontSize)
            }
        }
    }
    
    fileprivate var _fontSize:CGFloat = 17
    @IBInspectable var fontSize:CGFloat {
        get {
            return _fontSize
        }
        set(value) {
            _fontSize = value
            self.font = UIFont(name: Constants.Fonts.Signika.Light, size: _fontSize)
        }
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
//        configureLabel()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        configureLabel()
    }
    
//    func configureLabel() {
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
//
//        guard let customFont = UIFont(name: Constants.Fonts.Signika.Light, size: UIFont.systemFontSize) else {
//            fatalError("""
//                Failed to load the "CustomFont-Light" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
//        self.font = UIFontMetrics.default.scaledFont(for: customFont)
//        self.adjustsFontForContentSizeCategory = true
//    }
    
}
