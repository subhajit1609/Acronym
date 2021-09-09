//
//  Mappables.swift
//  AcronymApplication
//


import Foundation
public enum MappingError: Error {
    /// Thrown when failed to parse parsable object to usable object
    case failedParsableToUsable
    /// Thrown when failed to parse usable object to parsable object
    case failedUsableToParsable
}
public enum CodableError: Error {
    case failedEncoding
    case failedDecoding
}
/// Closure to convert Parsable object to Usable object
public typealias ParsableToUsable = (Parsable) -> (Usable?)
/// Closure to convert array of Parsable objects to array of Usable objects
public typealias ParsablesToUsables = ([Parsable]) -> ([Usable]?)
/// Closure to convert Usable object to Parsable object
public typealias UsableToParsable = (Usable) -> (Parsable?)
/// Closure to convert array of Usable objects to array of Parsable objects
public typealias UsablesToParsables = ([Usable]) -> ([Parsable]?)
public protocol RemoteMappable {
    /// Use this closure to map a parsable object to a usable object
    var mapParsableToUsable: ParsableToUsable { get set }
    /// Use this closure to map an array of parsable objects to an array of usable objects
    var mapParsablesToUsables: ParsablesToUsables { get set }
    /// Use this closure to map a usable object to a parsable object
    var mapUsableToParsable: UsableToParsable { get set }
    /// Use this closure to map an array of usable objects to an array of parsable objects
    var mapUsablesToParsables: UsablesToParsables { get set }
}
