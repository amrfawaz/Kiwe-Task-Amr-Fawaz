//
//  UIView+Extension.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            // the masksToBound property if a shadow is needed in addition to the cornerRadius
            if self.layer.shadowOpacity > 0.0 {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var borderWidth: Float {
        get {
            return Float(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            if let currentShadowColor = self.layer.borderColor {
                return  UIColor(cgColor: currentShadowColor)
            } else {
                return  UIColor.black
            }
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }

}
