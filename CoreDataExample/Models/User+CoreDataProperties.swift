//
//  User+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by ruslan on 05.12.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var user: String?
    @NSManaged public var age: Int16
    @NSManaged public var name: String
    @NSManaged public var company: Company?

}

extension User : Identifiable {

}
