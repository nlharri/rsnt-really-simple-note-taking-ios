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
    
    var notes : [ReallySimpleNote]
    private(set) var managedObjectContext : NSManagedObjectContext
    
    private init() {
        notes = [ReallySimpleNote]()
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    }
    
    func setManagedContext(managedObjectContext : NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
}
