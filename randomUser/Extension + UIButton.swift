//
//  Extension + UIButton.swift
//  randomUser
//
//  Created by Никита Гвоздиков on 16.11.2020.
//

import UIKit
extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.fromValue = 0.98
        pulse.toValue = 1
        pulse.duration = 0.2
        pulse.autoreverses = true
        pulse.repeatCount = 999999
        layer.add(pulse, forKey: nil)
    }
}
