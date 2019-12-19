//
//  logoCell.swift
//  UICollectionViewDemo
//
//  Created by MINI01 ACCELERON on 12/12/19.
//  Copyright © 2019 MINI01 ACCELERON. All rights reserved.
//

import UIKit

class logoCell: UICollectionViewCell {

    @IBOutlet var logoText: UILabel!
    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var logoLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet var logoImageTopConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.logoImage.image = nil
       self.logoText.text = nil
        //self.logoLabelTopConstraint.constant = 10.0
        //self.logoImageTopConstraint.constant = 10.0
        //self.layoutIfNeeded()
    }
    func bind(logoObject: Logo, index: Int, nextDo: @escaping (() -> Void)) {
        if logoObject.imageName == nil && logoObject.text == nil { return }
        
        else if logoObject.imageName == nil && logoObject.text != nil {
            self.logoImage.isHidden = true
            self.logoText.isHidden = false
            //self.logoImageTopConstraint.constant = 0.0
            //self.logoLabelTopConstraint.constant = 10.0
            self.logoText.text = "\(index) \(logoObject.text!)"
        }
        else if logoObject.imageName != nil && logoObject.text == nil {
            self.logoImage.isHidden = false
            self.logoText.isHidden = true
            //self.logoLabelTopConstraint.constant = 0.0
            //self.logoImageTopConstraint.constant = 10.0
            self.logoImage.image = UIImage(named: logoObject.imageName!)
        }
        else {
            self.logoImage.isHidden = false
            self.logoText.isHidden = false
            //self.logoLabelTopConstraint.constant = 10.0
            //self.logoImageTopConstraint.constant = 10.0
            self.logoText.text = "\(index) \(logoObject.text!)"
            self.logoImage.image = UIImage(named: logoObject.imageName!)
        }
        //self.contentView.layoutIfNeeded()
        self.layoutIfNeeded()
        nextDo()
    }
}
