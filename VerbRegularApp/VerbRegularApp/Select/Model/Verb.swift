//
//  Verb.swift
//  MVClesson
//
//  Created by Artem Yershov on 24.07.2023.
//

import Foundation

struct Verb {
    let infinitive: String
    let pastSimple: String
    let participle: String
    var translate: String {
        NSLocalizedString(self.infinitive, comment: "")
    }
}
