//
//  StringExtension.swift
//  AcronymApplication
//

import Foundation
public extension String {
    var isValidURL: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.endIndex.utf16Offset(in: self))) {
                return match.range.length == self.endIndex.utf16Offset(in: self)
            } else {
                return false
            }
        } catch _ {
            return false
        }
    }
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
