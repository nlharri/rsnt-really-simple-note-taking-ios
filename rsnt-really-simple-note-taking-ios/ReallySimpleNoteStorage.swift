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
    private var noteIndexToIdDict : [Int:UUID] = [:]
    private var currentIndex : Int = 0

    private(set) var managedObjectContext : NSManagedObjectContext
    private var managedContextHasBeenSet : Bool = false
    
    private init() {
        notes = [ReallySimpleNote]()
        // we need to init our ManagedObjectContext
        // This will be overwritten when setManagedContext is called from the view controller.
        managedObjectContext = NSManagedObjectContext(
            concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    }
    
    func setManagedContext(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        self.managedContextHasBeenSet = true
        self.notes = ReallySimpleNoteCoreDataHelper.readNotesFromCoreData(fromManagedObjectContext: self.managedObjectContext)
        currentIndex = ReallySimpleNoteCoreDataHelper.count
        let notes = self.notes
        for (index, note) in notes.enumerated() {
            noteIndexToIdDict[index] = note.noteId
        }
    }
    
    func addNote(noteToBeAdded: ReallySimpleNote) {
        // increase index
        currentIndex += 1
        notes.append(noteToBeAdded)
        // add note UUID to the dictionary
        noteIndexToIdDict[currentIndex] = noteToBeAdded.noteId
        if managedContextHasBeenSet {
            ReallySimpleNoteCoreDataHelper.createNoteInCoreData(
                noteToBeCreated:          noteToBeAdded,
                intoManagedObjectContext: self.managedObjectContext)
        }
    }
    
    func removeNote(at: Int) {
        // check input index
        if at < 0 || at > currentIndex-1 {
            // TODO error handling
            return
        }
        // get note UUID from the dictionary
        let noteUUID = noteIndexToIdDict[at]
        // TODO remove by UUID instead of by Note instance itself!!
        //let noteToBeRemoved = notes.remove(at: at)
        if managedContextHasBeenSet {
            ReallySimpleNoteCoreDataHelper.deleteNoteFromCoreData(
                noteIdToBeDeleted:        noteUUID!,
                fromManagedObjectContext: self.managedObjectContext)
            /*
            ReallySimpleNoteCoreDataHelper.deleteNoteFromCoreData(
                noteToBeDeleted:          noteToBeRemoved,
                fromManagedObjectContext: self.managedObjectContext)
            */
        }
        // decrease current index in case of successful remove 
        currentIndex -= 1
    }
    
    func readNote(at: Int) -> ReallySimpleNote {
        // check input index
        if at < 0 || at > currentIndex-1 {
            // TODO error handling
            //eturn nil
        }
        // get note UUID from the dictionary
        let noteUUID = noteIndexToIdDict[at]
        // TODO read by UUID instead of by Note index

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
        //return notes.count
        return ReallySimpleNoteCoreDataHelper.count
    }
}
