//
//  DataStoreManager.swift
//  CoreDataExample
//
//  Created by ruslan on 06.12.2021.
//

import Foundation
import CoreData

class DataStoreManager {
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataExample")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    lazy var viewContext = persistentContainer.viewContext

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func obtainMainUser() -> User {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")
        
        if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
            return users.first!
        } else {
            let company = Company(context: viewContext)
            company.name = "Apple"
            
            let user = User(context: viewContext)
            user.name = "Tommy"
            user.age = 25
            user.company = company
            user.isMain = true
            
            do {
                try viewContext.save()
            } catch let error {
                print("Error: \(error)")
            }
            
            return user
        }
    }
    
    func updateMainUser(with name: String) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")
        
        if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
            
            guard let mainUser = users.first else { return }
            
            mainUser.name = name
            try? viewContext.save()
        }
    }
}
