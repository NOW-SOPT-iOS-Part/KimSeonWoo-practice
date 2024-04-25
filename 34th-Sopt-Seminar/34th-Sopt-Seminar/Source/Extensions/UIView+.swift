//
//  UIView+.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/20/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
}
