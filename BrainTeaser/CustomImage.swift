//
//  CustomImage.swift
//  BrainTeaser
//
//  Created by Andrew Foster on 3/1/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImage: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
