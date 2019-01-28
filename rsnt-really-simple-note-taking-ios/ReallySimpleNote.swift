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
    private(set) var noteTopic     : String
    private(set) var noteText      : String
    private(set) var noteDate      : String
    private(set) var noteTimeStamp : Int64
    
    init(noteTopic:String, noteText:String, noteDate:String, noteTimeStamp:Int64) {
        self.noteId        = UUID()
        self.noteTopic     = noteTopic
        self.noteText      = noteText
        self.noteDate      = noteDate
        self.noteTimeStamp = noteTimeStamp
    }

    init(noteId: UUID, noteTopic:String, noteText:String, noteDate:String, noteTimeStamp:Int64) {
        self.noteId        = noteId
        self.noteTopic     = noteTopic
        self.noteText      = noteText
        self.noteDate      = noteDate
        self.noteTimeStamp = noteTimeStamp
    }
}
