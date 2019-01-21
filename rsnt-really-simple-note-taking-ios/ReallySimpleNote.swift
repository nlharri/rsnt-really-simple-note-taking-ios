//
//  Item.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

class ReallySimpleNote {
    private(set) var noteTopic : String
    private(set) var noteText  : String
    
    init(noteTopic:String, noteText:String) {
        self.noteTopic = noteTopic
        self.noteText  = noteText
    }
}
