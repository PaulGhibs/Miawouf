//
//  RoundedButtons.swift
//  Miawouf
//
//  Created by Paul Ghibeaux on 21/07/2021.
//

import UIKit


@IBDesignable

class RoundedButtons: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
            didSet{
            self.layer.cornerRadius = cornerRadius
            }
        }

        @IBInspectable var borderWidth: CGFloat = 0{
            didSet{
                self.layer.borderWidth = borderWidth
            }
        }

        @IBInspectable var borderColor: UIColor = UIColor.clear{
            didSet{
                self.layer.borderColor = borderColor.cgColor
            }
        }
}
