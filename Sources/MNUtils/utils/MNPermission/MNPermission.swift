//
//  MNPermission.swift
//  
//
//  Created by Ido on 06/12/2022.
//

import Foundation
import DSLogger
fileprivate let dlog : MNLogger? = MNLog.forClass("MNPermission")


public typealias MNAllowed = Hashable
public typealias MNForbidden = Hashable

public protocol MNPermissionable : Hashable, Equatable {
    associatedtype Allowed : MNAllowed
    associatedtype Forbidden : MNForbidden
    
    var isAllowed : Bool { get }
    var isForbidden : Bool { get }
    var allowedValue : Allowed? { get }
    var forbiddenValue : Forbidden? { get }
}

@frozen public enum MNPermission<Allowed : MNAllowed, Forbidden: MNForbidden> : MNPermissionable where Forbidden : Error {
    
    /// A success, storing a `Success` value.
    case allowed(Allowed)
    
    /// A failure, storing a `Failure` value.
    case forbidden(Forbidden)
    
    public var isAllowed : Bool {
        switch self {
        case .allowed:    return true
        case .forbidden:  return false
        }
    }
    
    public var isForbidden : Bool {
        return !self.isAllowed
    }
    
    public var allowedValue : Allowed? {
        switch self {
        case .allowed(let success): return success
        case .forbidden:  return nil
        }
    }
    
    public var forbiddenValue : Forbidden? {
        switch self {
        case .allowed: return nil
        case .forbidden(let forbidden): return forbidden
        }
    }
    
    // MARK: Hashable
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .allowed(let allow):    hasher.combine(allow)
        case .forbidden(let forbid): hasher.combine(forbid)
        }
    }
    
    // MARK: Equatable
    public static func ==(lhs:MNPermission, rhs:MNPermission)->Bool {
        guard lhs.isAllowed == rhs.isAllowed else {
            return false
        }
        if lhs.isForbidden && lhs.forbiddenValue == rhs.forbiddenValue {
            return true
        } else if lhs.isAllowed && lhs.allowedValue == rhs.allowedValue {
            return true
        }
        
        return false
    }
}