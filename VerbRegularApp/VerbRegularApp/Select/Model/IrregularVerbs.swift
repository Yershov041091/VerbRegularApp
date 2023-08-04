//
//  IrregularVerbs.swift
//  MVClesson
//
//  Created by Artem Yershov on 24.07.2023.
//

import Foundation

class IrregularVerbs {
    //Singeltone
    static var shared = IrregularVerbs()
    private init() {
            configeVerb()
    }
    
    private(set) var verbs: [Verb] = []
    var selectedVerbs: [Verb] = []
    
    func configeVerb() {
        verbs = [
        Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
        Verb(infinitive: "draw", pastSimple: "drew", participle: "drawn"),
        Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
        Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen")
        ]
    }
}
