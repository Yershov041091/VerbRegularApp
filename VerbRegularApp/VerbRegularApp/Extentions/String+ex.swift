//
//  String+ex.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 29.07.2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
