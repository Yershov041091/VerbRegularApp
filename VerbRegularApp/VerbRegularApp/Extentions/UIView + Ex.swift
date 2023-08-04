//
//  UIView + Ex.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 30.07.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
