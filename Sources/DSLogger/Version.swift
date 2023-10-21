//  Version.swift

import AppKit

enum PreRelease: String {
    case none = ""
    case alpha = "alpha"
    case beta = "beta"
    case RC = "RC"
}

// https://semver.org/
// Swift package PackageDescription also supports Sever2 Version struct defined, but we will be using ver 1.0.0

// Hard coded app version:
let DSLOGGER_NAME_STR : String = "DSLogger"

// String fields allow only alphanumerics and a hyphen (-)
let DSLOGGER_BUILD_NR : Int = 17
let DSLOGGER_BUILD_VERSION = DSLoggerSemver (
    major: 0,
    minor: 1,
    patch: 0,
    prerelease: "\(PreRelease.alpha.rawValue)",
    metadata: [String(format: "%04X", DSLOGGER_BUILD_NR)]
)
