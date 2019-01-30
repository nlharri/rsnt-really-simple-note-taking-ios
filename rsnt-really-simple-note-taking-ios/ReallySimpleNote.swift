//
//  Item.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import Foundation

class ReallySimpleNote {
    private(set) var noteId        : UUID
    private(set) var noteTitle     : String
    private(set) var noteText      : String
    private(set) var noteTimeStamp : Int64
    
    init(noteTitle:String, noteText:String, noteTimeStamp:Int64) {
        self.noteId        = UUID()
        self.noteTitle     = noteTitle
        self.noteText      = noteText
        self.noteTimeStamp = noteTimeStamp
    }

    init(noteId: UUID, noteTitle:String, noteText:String, noteTimeStamp:Int64) {
        self.noteId        = noteId
        self.noteTitle     = noteTitle
        self.noteText      = noteText
        self.noteTimeStamp = noteTimeStamp
    }
}
