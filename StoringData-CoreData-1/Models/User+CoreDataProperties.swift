//
//  User+CoreDataProperties.swift
//  StoringData-CoreData-1
//
//  Created by ruslan on 11.12.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var anyBool: NSNumber?
    @NSManaged public var isMain: Bool
    @NSManaged public var name: String?
    @NSManaged public var company: Company?

}

extension User : Identifiable {

}
