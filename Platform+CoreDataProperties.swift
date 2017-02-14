//
//  Platform+CoreDataProperties.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import Foundation
import CoreData


extension Platform {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Platform> {
        return NSFetchRequest<Platform>(entityName: "Platform");
    }

    @NSManaged public var platform: String?
    @NSManaged public var toMember: NSSet?
    @NSManaged public var toImage: NSSet?

}

// MARK: Generated accessors for toMember
extension Platform {

    @objc(addToMemberObject:)
    @NSManaged public func addToToMember(_ value: Member)

    @objc(removeToMemberObject:)
    @NSManaged public func removeFromToMember(_ value: Member)

    @objc(addToMember:)
    @NSManaged public func addToToMember(_ values: NSSet)

    @objc(removeToMember:)
    @NSManaged public func removeFromToMember(_ values: NSSet)

}

// MARK: Generated accessors for toImage
extension Platform {

    @objc(addToImageObject:)
    @NSManaged public func addToToImage(_ value: Image)

    @objc(removeToImageObject:)
    @NSManaged public func removeFromToImage(_ value: Image)

    @objc(addToImage:)
    @NSManaged public func addToToImage(_ values: NSSet)

    @objc(removeToImage:)
    @NSManaged public func removeFromToImage(_ values: NSSet)

}
