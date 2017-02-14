//
//  Member+CoreDataProperties.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member");
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var created: NSDate?
    @NSManaged public var toImage: Image?
    @NSManaged public var toPlatform: NSSet?

}

// MARK: Generated accessors for toPlatform
extension Member {

    @objc(addToPlatformObject:)
    @NSManaged public func addToToPlatform(_ value: Platform)

    @objc(removeToPlatformObject:)
    @NSManaged public func removeFromToPlatform(_ value: Platform)

    @objc(addToPlatform:)
    @NSManaged public func addToToPlatform(_ values: NSSet)

    @objc(removeToPlatform:)
    @NSManaged public func removeFromToPlatform(_ values: NSSet)

}
