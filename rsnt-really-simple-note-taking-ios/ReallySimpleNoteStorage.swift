//
//  ReallySimpleNoteStorage.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import CoreData

class ReallySimpleNoteStorage {
    static let storage : ReallySimpleNoteStorage = ReallySimpleNoteStorage()
    
    private var notes : [ReallySimpleNote]
    private(set) var managedObjectContext : NSManagedObjectContext
    private var managedContextHasBeenSet : Bool = false
    
    private init() {
        notes = [ReallySimpleNote]()
        managedObjectContext = NSManagedObjectContext(
            concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    }
    
    func setManagedContext(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        self.managedContextHasBeenSet = true
        self.notes = ReallySimpleNoteCoreDataHelper.readNotesFromCoreData(fromManagedObjectContext: self.managedObjectContext)
    }
    
    func addNote(noteToBeAdded: ReallySimpleNote) {
        notes.append(noteToBeAdded)
        if managedContextHasBeenSet {
            ReallySimpleNoteCoreDataHelper.createNoteInCoreData(
                noteToBeCreated:          noteToBeAdded,
                intoManagedObjectContext: self.managedObjectContext)
        }
    }
    
    func removeNote(at: Int) {
        let noteToBeRemoved = notes.remove(at: at)
        if managedContextHasBeenSet {
            ReallySimpleNoteCoreDataHelper.deleteNoteFromCoreData(
                noteToBeDeleted:          noteToBeRemoved,
                fromManagedObjectContext: self.managedObjectContext)
        }
    }
    
    func readNote(at: Int) -> ReallySimpleNote {
        let noteRead = notes[at]
        if managedContextHasBeenSet {
            let noteReadFromCoreData: ReallySimpleNote?
            noteReadFromCoreData = ReallySimpleNoteCoreDataHelper.readNoteFromCoreData(
                noteToBeRead:             noteRead,
                fromManagedObjectContext: self.managedObjectContext)
            return noteReadFromCoreData ?? noteRead
        }
        return noteRead
    }
    
    func count() -> Int {
        return notes.count
    }
}
