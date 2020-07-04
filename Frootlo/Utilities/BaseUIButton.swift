//
//  BaseUIButton.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 01/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import UIKit

class BaseUIButton: UIButton {
    
    /*
    @IBInspectable public var signikaBold: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaRegular = false
                signikaSemiBold = false
                self.titleLabel?.font = UIFont(name: Constants.Fonts.Signika.Bold, size: fontSize)
                
            }
        }
    }
    @IBInspectable public var signikaSemiBold: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaRegular = false
                signikaBold = false
                self.titleLabel?.font = UIFont(name: Constants.Fonts.Signika.SemiBold, size: fontSize)
            }
        }
    }
    @IBInspectable public var signikaRegular: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaLight = false
                signikaSemiBold = false
                signikaBold = false
                self.titleLabel?.font = UIFont(name: Constants.Fonts.Signika.Regular, size: fontSize)
            }
        }
    }
    @IBInspectable public var signikaLight: Bool = false {
        willSet(isBold) {
            if isBold {
                signikaSemiBold = false
                signikaRegular = false
                signikaBold = false
                self.titleLabel?.font = UIFont(name: Constants.Fonts.Signika.Light, size: fontSize)
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
            self.titleLabel?.font = UIFont(name: Constants.Fonts.Signika.Light, size: _fontSize)
        }
    }
 */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
//        self.configureLabel()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        configureLabel()
    }
    
    func configureLabel() {

        guard let customFont = UIFont(name: Constants.Fonts.Signika.Light, size: UIFont.buttonFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        self.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
}

