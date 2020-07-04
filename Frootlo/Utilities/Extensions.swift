//
//  Extensions.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 01/07/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Show message in alert
    ///
    /// - Parameters:
    ///   - title: String
    ///   - text: String
    ///   - completion: Closure
    func showMessage(_ title: String, _ text: String, _ cancelHandler: ((UIAlertAction) -> Void)? = nil, _ completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: cancelHandler)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: completion)
    }
    
    /// Trim text field data
    ///
    /// - Parameter textFields: [UITextField]
    func trimTextFieldData(_ textFields: [UITextField]) {
        // Enumerating textFields array
        for textField in textFields {
            // Trimming text field data
            textField.text?.trim()
        }
    }
    
    ///return back bar button which are using in whole app
    func backBarButton() -> UIBarButtonItem {
        let backButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action: #selector(BackButtonTapped))
        return backButtonItem
    }
    
    ///Back Btn Action
    @objc func BackButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIWindow.key?.rootViewController) -> UIViewController? {
        
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = viewController as? UITabBarController {
            
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
            
        }
        
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
    
}

extension UIColor {
    
    convenience init(hexString: String) {
        
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    struct Theme {
        static let orange   = UIColor(red: 254.0 / 255.0, green: 127.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
        static let grey     = UIColor(red: 249.0 / 255.0, green: 250.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0)
        static let yellow   = UIColor(red: 242.0 / 255.0, green: 184.0 / 255.0, blue: 75.0 / 255.0, alpha: 1.0)
    }
}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIView {
    func round() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadowWithOffset(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadowDown() {
        dropShadow(color: .black, opacity: 0.4, offSet: CGSize(width: 0.0, height: 2.0), radius: 2, scale: true)
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    //
    @IBInspectable var borderColor: UIColor {
        
        
        get {
            
            if layer.borderColor == nil {
                return UIColor.clear
            }
            else {
                //   return UIColor(CGColor: layer.borderColor!)
                return UIColor(cgColor: layer.borderColor!)
            }
        }
        set {
            
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        set {
            
            if newValue < 0 {
                layer.borderWidth = 0
            }
            else {
                layer.borderWidth = newValue
                clipsToBounds = true
            }
        }
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?,  paddingX: CGFloat, paddingY: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: paddingX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: paddingY).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
//Mark:- Custom Font
extension UILabel {
    @objc public var substituteFontName : String {
        get {
            return self.font.fontName;
        }
        set {
            let fontNameToTest = self.font.fontName.lowercased();
            var fontName = newValue;
            if fontNameToTest.range(of: "Bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "SemiBold") != nil {
                fontName += "-SemiBold";
            } else if fontNameToTest.range(of: "Light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "Regular") != nil {
                fontName += "-Regular";
            }
            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}

extension UITextView {
    @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "Bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "SemiBold") != nil {
                fontName += "-SemiBold";
            } else if fontNameToTest.range(of: "Light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "Regular") != nil {
                fontName += "-Regular";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UITextField {
    @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UIButton {
    @objc public var substituteFontName : String {
        get {
            return self.titleLabel?.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.titleLabel?.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "Bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "SemiBold") != nil {
                fontName += "-SemiBold";
            } else if fontNameToTest.range(of: "Light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "Regular") != nil {
                fontName += "-Regular";
            }
            self.titleLabel?.font = UIFont(name: fontName, size: self.titleLabel?.font?.pointSize ?? 17)
        }
    }
}

extension UIImageView{
    
    //    func setImageTroughNet(path:String){
    //        self.kf.indicatorType = .activity
    //        self.kf.setImage(with: URL(string: path), placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, url) in
    //            self.stopAnimating()
    //            if image != nil {
    //                self.image = image!
    //            }else{
    //                self.image =  UIImage()
    //            }
    //        })
    //    }
    //
    @IBInspectable var randeringColor: UIColor {
        get {
            return UIColor.white
        }
        set {
            self.image = self.image!.withRenderingMode(.alwaysTemplate)
            self.tintColor = newValue
        }
    }
}

extension TimeInterval {
    var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }
    
    var seconds: Int {
        return Int(self) % 60
    }
    
    var minutes: Int {
        return (Int(self) / 60 ) % 60
    }
    
    var hours: Int {
        return Int(self) / 3600
    }
    
    var stringTime: String {
        if hours != 0 {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes != 0 {
            return "\(minutes)m \(seconds)s"
        } else if milliseconds != 0 {
            return "\(seconds)s \(milliseconds)ms"
        } else {
            return "\(seconds)s"
        }
    }
}

extension Double {
    
    func toRadian() -> Double {
        return self * .pi / 180
    }
    
    func toDegree() -> Double {
        return self * 180 / .pi
    }
    
    func secondsToDays() -> Int {
        return Int(self / 60 / 60 / 24)
    }
    
}

extension Int {
    var minutesFromSeconds: Int {
        return self / 60
    }
}

// MARK: - String extension

extension String {
    // If string is numeric
    var isNumeric : Bool {
        return NumberFormatter().number(from: self) != nil
    }
    
    /// Trim string by itself
    mutating func trim() {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // Change mobile number to contain country code
    mutating func addCountryCode() {
        self = self.replacingOccurrences(of: "0", with: "92", options: .caseInsensitive, range: self.startIndex..<self.index(after: self.startIndex))
    }
    
    // Exclude country code from mobile number
    mutating func removeCountryCode() {
        if self.count == 0 {
            return
        }
        if self.contains("+") {
            self = self.replacingOccurrences(of: "+92", with: "0", options: .caseInsensitive, range: self.startIndex..<self.index(self.startIndex, offsetBy: 3))
        } else {
            self = self.replacingOccurrences(of: "92", with: "0", options: .caseInsensitive, range: self.startIndex..<self.index(self.startIndex, offsetBy: 2))
        }
        
    }
    
    mutating func camelCase() {
        if self.count > 0 {
            let upperCased = self.prefix(1).uppercased()
            self.removeFirst()
            self = upperCased.appending(self)
        }
    }
    
    mutating func formatCurrencyValue() {
        guard  let intValue = Int(self) else {
            return
        }
        let number = NSNumber(value: intValue)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedCurrency = numberFormatter.string(from: number) else {
            return
        }
        self = formattedCurrency
    }
    
    mutating func lowerCase() {
        self = self.lowercased()
    }
    
    //    var dateTimeConverted: Date? {
    //        let d = DateFormatter(
    //        let dateFormatter = DateFormatter(withFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", locale: Locale.current.identifier)
    //        return dateFormatter.date(from: self)
    //    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
}


extension Date {
    var yearsFromNow:   Int { return Calendar.current.dateComponents([.year],       from: self, to: Date()).year        ?? 0 }
    var monthsFromNow:  Int { return Calendar.current.dateComponents([.month],      from: self, to: Date()).month       ?? 0 }
    var weeksFromNow:   Int { return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear  ?? 0 }
    var daysFromNow:    Int { return Calendar.current.dateComponents([.day],        from: self, to: Date()).day         ?? 0 }
    var hoursFromNow:   Int { return Calendar.current.dateComponents([.hour],       from: self, to: Date()).hour        ?? 0 }
    var minutesFromNow: Int { return Calendar.current.dateComponents([.minute],     from: self, to: Date()).minute      ?? 0 }
    var secondsFromNow: Int { return Calendar.current.dateComponents([.second],     from: self, to: Date()).second      ?? 0 }
    var relativeTime: String {
        if yearsFromNow   > 0 { return "\(yearsFromNow) year"    + (yearsFromNow    > 1 ? "s" : "") }
        if monthsFromNow  > 0 { return "\(monthsFromNow) month"  + (monthsFromNow   > 1 ? "s" : "") }
        if weeksFromNow   > 0 { return "\(weeksFromNow) week"    + (weeksFromNow    > 1 ? "s" : "") }
        if daysFromNow    > 0 { return "\(daysFromNow) days" }
        if hoursFromNow   > 0 { return "\(hoursFromNow) hour"     + (hoursFromNow   > 1 ? "s" : "") }
        if minutesFromNow > 0 { return "\(minutesFromNow) minute" + (minutesFromNow > 1 ? "s" : "") }
        if secondsFromNow > 0 { return "\(secondsFromNow) second" + (secondsFromNow > 1 ? "s" : "") }
        return ""
    }
    
    //    static var currentDateTimeStamp: String {
    //        let dateFormatter = DateFormatter(withFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", locale: Locale.current.identifier)
    //        return dateFormatter.string(from: Date())
    //    }
}

// This will set title and image vertically align

extension UIButton {
    
    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
                return
        }
        
        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageViewSize.height),
            left: 0.0,
            bottom: 0.0,
            right: -titleLabelSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageViewSize.width,
            bottom: -(totalHeight - titleLabelSize.height),
            right: 0.0
        )
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 5.0,
            left: 0.0,
            bottom: titleLabelSize.height,
            right: 0.0
        )
    }
    
    func hide(after duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }) { (finished) in
            self.isHidden = true
        }
    }
    
    func show(after duration: TimeInterval) {
        self.isHidden = false
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = 1
            }
        }
    }
    
    /// set text and image alignments
    ///
    /// - Parameters:
    ///   - textAlignment: NSTextAlignment
    ///   - imageAlignment: NSTextAlignment
    func align(text textAlignment: NSTextAlignment, image imageAlignment: NSTextAlignment) {
        
        switch (textAlignment, imageAlignment) {
            
        case (.left, .right):
            if self.imageView != nil {
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.bounds.width - 45, bottom: 0, right: 5)
                self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: (self.imageView?.frame.width)!)
                self.contentHorizontalAlignment = .left
            }
            
        default:
            break
            
        }
        
    }
    
}
