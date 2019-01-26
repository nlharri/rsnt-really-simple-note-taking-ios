//
//  ReallySimpleNoteCoreDataHelper.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 25..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import Foundation
import CoreData

class ReallySimpleNoteCoreDataHelper {
    
    static func createNoteInCoreData(
        noteToBeCreated:          ReallySimpleNote,
        intoManagedObjectContext: NSManagedObjectContext) {
        
        // Let’s create an entity and new note record
        let noteEntity = NSEntityDescription.entity(
            forEntityName: "Note",
            in:            intoManagedObjectContext)!
        
        let newNoteToBeCreated = NSManagedObject(
            entity:     noteEntity,
            insertInto: intoManagedObjectContext)
        
        newNoteToBeCreated.setValue(
            noteToBeCreated.noteTopic,
            forKey: "noteTitle")
        
        newNoteToBeCreated.setValue(
            noteToBeCreated.noteText,
            forKey: "noteText")
        
        newNoteToBeCreated.setValue(
            noteToBeCreated.noteDate,
            forKey: "noteTimeStamp")
        
        do {
            try intoManagedObjectContext.save()
        } catch let error as NSError {
            // TODO error handling
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    static func readNotesFromCoreData(fromManagedObjectContext: NSManagedObjectContext) -> [ReallySimpleNote] {

        var returnedNotes = [ReallySimpleNote]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        fetchRequest.predicate = nil
        
        do {
            let fetchedNotesFromCoreData = try fromManagedObjectContext.fetch(fetchRequest)
            fetchedNotesFromCoreData.forEach { (fetchRequestResult) in
                let noteManagedObjectRead = fetchRequestResult as! NSManagedObject
                returnedNotes.append(ReallySimpleNote.init(
                    noteTopic: noteManagedObjectRead.value(forKey: "noteTitle")     as! String,
                    noteText:  noteManagedObjectRead.value(forKey: "noteText")      as! String,
                    noteDate:  noteManagedObjectRead.value(forKey: "noteTimeStamp") as! String))
            }
        } catch let error as NSError {
            // TODO error handling
            print("Could not read. \(error), \(error.userInfo)")
        }
        
        return returnedNotes
    }
    
    static func readNoteFromCoreData(
        noteToBeRead:             ReallySimpleNote,
        fromManagedObjectContext: NSManagedObjectContext) -> ReallySimpleNote? {

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let noteTitlePredicate = NSPredicate(format: "noteTitle = %@", noteToBeRead.noteTopic)
        
        let noteTextPredicate = NSPredicate(format: "noteText = %@", noteToBeRead.noteText)
        
        let noteTimeStampPredicate = NSPredicate(format: "noteTimeStamp = %@", noteToBeRead.noteDate)
        
        fetchRequest.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [noteTitlePredicate,
                                            noteTextPredicate,
                                            noteTimeStampPredicate])
        do {
            let fetchedNotesFromCoreData = try fromManagedObjectContext.fetch(fetchRequest)
            let noteManagedObjectToBeRead = fetchedNotesFromCoreData[0] as! NSManagedObject
            return ReallySimpleNote.init(
                noteTopic: noteManagedObjectToBeRead.value(forKey: "noteTitle") as! String,
                noteText: noteManagedObjectToBeRead.value(forKey: "noteText") as! String,
                noteDate: noteManagedObjectToBeRead.value(forKey: "noteTimeStamp") as! String)
        } catch let error as NSError {
            // TODO error handling
            print("Could not read. \(error), \(error.userInfo)")
            return nil
        }
    }

    static func deleteNoteFromCoreData(
        noteToBeDeleted:          ReallySimpleNote,
        fromManagedObjectContext: NSManagedObjectContext) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let noteTitlePredicate = NSPredicate(format: "noteTitle = %@", noteToBeDeleted.noteTopic)
        
        let noteTextPredicate = NSPredicate(format: "noteText = %@", noteToBeDeleted.noteText)

        let noteTimeStampPredicate = NSPredicate(format: "noteTimeStamp = %@", noteToBeDeleted.noteDate)
        
        fetchRequest.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [noteTitlePredicate,
                                            noteTextPredicate,
                                            noteTimeStampPredicate])
        
        do {
            let fetchedNotesFromCoreData = try fromManagedObjectContext.fetch(fetchRequest)
            let noteManagedObjectToBeDeleted = fetchedNotesFromCoreData[0] as! NSManagedObject
            fromManagedObjectContext.delete(noteManagedObjectToBeDeleted)
            
            do {
                try fromManagedObjectContext.save()
            } catch let error as NSError {
                // TODO error handling
                print("Could not save. \(error), \(error.userInfo)")
            }
        } catch let error as NSError {
            // TODO error handling
            print("Could not delete. \(error), \(error.userInfo)")
        }
        
    }

}
