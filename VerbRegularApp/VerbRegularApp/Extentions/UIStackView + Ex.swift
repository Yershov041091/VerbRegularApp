//
//  UIStackView + Ex.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 31.07.2023.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
