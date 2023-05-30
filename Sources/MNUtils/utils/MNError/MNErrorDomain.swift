//
// AppErrorDomain.swift
//
// Autogenerated for Bricks on Vapor / Leaf as swift. on:18/02/2023, 23:24:04
// Autogenerator using transfer_error_codes_to_domains.py
import Foundation

// Autogenerated by script
public enum MNErrorDomain : Int {

	case unknown =	0
	case http =	100
	case cancel =	8000
	case misc =	9000
	case web =	1000
	case cmd =	1500
	case doc =	2000
	case layer =	2100
	case user =	2500
	case db =	3000
	case ui =	5000

//	== END OF CASES ==

	var name : String {
		switch self {
		case .unknown: return "mnerror"
		case .http:		return "http"
		case .cancel:	return "cancel"
		case .misc:		return "misc"
		case .web:		return "web"
		case .cmd:		return "cmd"
		case .doc:		return "doc"
		case .layer:	return "layer"
		case .user:		return "user"
		case .db:		return "db"
		case .ui:		return "ui"
		}
	}

	var range : Range<Int> {
		switch self {
		case .unknown:		return 0..<99
		case .http:		return 100..<599
		case .cancel:		return 600..<8999
		case .misc:		return 9000..<9999
		case .web:		return 1000..<1199
		case .cmd:		return 1200..<1600
		case .doc:		return 1601..<2029
		case .layer:		return 2030..<2090
		case .user:		return 2091..<2500
		case .db:		return 2500..<3000
		case .ui:		return 3000..<5000
		}
	}

	static func domain(for code:MNErrorCode)->MNErrorDomain {
		return self.domain(forIntCode: code.rawValue)
	}

	static func domain(forIntCode code:Int)->MNErrorDomain {
		switch code {
		case 0..<99: return .unknown
		case 100..<599: return .http
		case 600..<8999: return .cancel
		case 9000..<9999: return .misc
		case 1000..<1199: return .web
		case 1200..<1600: return .cmd
		case 1601..<2029: return .doc
		case 2030..<2090: return .layer
		case 2091..<2500: return .user
		case 2500..<3000: return .db
		case 3000..<5000: return .ui
		default: return .unknown
		}
	}
}
