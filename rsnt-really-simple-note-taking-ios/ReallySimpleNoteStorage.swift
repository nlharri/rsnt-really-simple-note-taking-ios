//
//  ReallySimpleNoteStorage.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

class ReallySimpleNoteStorage {
    static let storage : ReallySimpleNoteStorage = ReallySimpleNoteStorage()
    
    var notes : [ReallySimpleNote]
    
    private init() {
        notes = [ReallySimpleNote]()
    }
}
