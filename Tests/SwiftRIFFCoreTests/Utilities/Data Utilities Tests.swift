//
//  Data Utilities Tests.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

import Foundation
@testable import SwiftRIFFCore
import Testing

@Suite
struct Data_Utilities_Tests {
    @Test
    func nullTerminatedASCIIString() {
        #expect(Data().nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x00]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x00]).nullTerminatedASCIIString(in: 0 ..< 1) == "")

        #expect(Data([0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 1) == "")
        #expect(Data([0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 2) == "")
        #expect(Data([0x00, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x00, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 1) == "")
        #expect(Data([0x00, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 2) == "")
        #expect(Data([0x00, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 3) == "")

        #expect(Data([0x31]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x31]).nullTerminatedASCIIString(in: 0 ..< 1) == "1")
        #expect(Data([0x31, 0x00]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x31, 0x00]).nullTerminatedASCIIString(in: 0 ..< 1) == "1")
        #expect(Data([0x31, 0x00]).nullTerminatedASCIIString(in: 0 ..< 2) == "1")
        #expect(Data([0x31, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x31, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 1) == "1")
        #expect(Data([0x31, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 2) == "1")
        #expect(Data([0x31, 0x00, 0x00]).nullTerminatedASCIIString(in: 0 ..< 3) == "1")

        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 0 ..< 0) == "")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 0 ..< 1) == "1")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 0 ..< 2) == "1")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 0 ..< 3) == "1")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 1 ..< 1) == "")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 1 ..< 2) == "")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 1 ..< 3) == "")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 2 ..< 2) == "")
        #expect(Data([0x31, 0x00, 0x32]).nullTerminatedASCIIString(in: 2 ..< 3) == "2")

        #expect(Data([0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 2 ..< 2) == "")
        #expect(Data([0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 2 ..< 3) == "2")
        #expect(Data([0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 2 ..< 4) == "23")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 2 ..< 2) == "")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 2 ..< 3) == "2")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 2 ..< 4) == "23")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 2 ..< 5) == "23")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 4) == "3")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 5) == "3")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 4 ..< 4) == "")
        #expect(Data([0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 4 ..< 5) == "")

        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 3 ..< 3) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 3 ..< 4) == "2")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 3 ..< 5) == "23")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 0 ..< 4) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33]).nullTerminatedASCIIString(in: 0 ..< 5) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 3) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 4) == "2")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 5) == "23")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 3 ..< 6) == "23")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 4 ..< 5) == "3")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 4 ..< 6) == "3")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 5 ..< 5) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 5 ..< 6) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 0 ..< 5) == "")
        #expect(Data([0x00, 0x31, 0x00, 0x32, 0x33, 0x00]).nullTerminatedASCIIString(in: 0 ..< 6) == "")
    }
}
