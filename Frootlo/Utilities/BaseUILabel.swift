//
//  BaseUILabel.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 01/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

@IBDesignable class BaseUILabel: UILabel {

    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0

    /*
    @IBInspectable public var signikaBold: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaRegular = false
                signikaSemiBold = false
                self.font = UIFont(name: Constants.Fonts.Signika.Bold, size: fontSize)

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

    fileprivate var _fontSize: CGFloat = 17
    @IBInspectable var fontSize: CGFloat {
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
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
        
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
    
//    func configureLabel() {
//
//        guard let customFont = UIFont(name: Signika.Regular.rawValue, size: _fontSize) else {
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
