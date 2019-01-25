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
    
    func createData(){
        
//        //As we know that container is set up in the AppDelegates so we need to refer that container.
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        
//        //We need to create a context from this container
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        //Now let’s create an entity and new user records.
//        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
//        
//        //final, we need to add some data to our newly created record for each keys using
//        //here adding 5 data with loop
//        
//        for i in 1...5 {
//            
//            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
//            user.setValue("Ankur\(i)", forKeyPath: "username")
//            user.setValue("ankur\(i)@test.com", forKey: "email")
//            user.setValue("ankur\(i)", forKey: "password")
//        }
//        
//        //Now we have set all the values. The next step is to save them inside the Core Data
//        
//        do {
//            try managedContext.save()
//            
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
    }
}
