//
//  MiButton.swift
//  Course Demo App
//
//  Created by Daniel Alvarez on 10/5/17.
//  Copyright © 2017 ALVAREZ.tech. All rights reserved.
//

import UIKit

class MiButton: UIButton {
    
    override func awakeFromNib() {
        
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 20
        clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [Colores.Amber.cgColor, Colores.AmberLight.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.addSublayer(gradientLayer)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
