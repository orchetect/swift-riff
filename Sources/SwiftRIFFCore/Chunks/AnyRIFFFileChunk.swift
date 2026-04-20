//
//  AnyRIFFFileChunk.swift
//  swift-riff • https://github.com/orchetect/swift-riff
//  © 2026 Steffan Andrews • Licensed under MIT License
//

/// Type-erased box containing a specialized concrete ``RIFFFileChunk`` instance.
public struct AnyRIFFFileChunk {
    /// The chunk instance stored within the type-erased box.
    public var base: any RIFFFileChunk

    public init(base: any RIFFFileChunk) {
        self.base = base
    }
}

extension AnyRIFFFileChunk: Equatable {
    public static func == (lhs: AnyRIFFFileChunk, rhs: AnyRIFFFileChunk) -> Bool {
        lhs.base.hashValue == rhs.base.hashValue
    }
}

extension AnyRIFFFileChunk: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(base.hashValue)
    }
}

extension AnyRIFFFileChunk: Sendable { }

extension AnyRIFFFileChunk: CustomStringConvertible {
    public var description: String {
        "\(base)"
    }
}

extension AnyRIFFFileChunk /* : RIFFFileChunk */ {
    /// Chunk ID.
    ///
    /// 4-Byte ASCII identifier, padded with ASCII 32 (space) if less than 4 characters.
    ///
    /// This identifier determines the specification outlining the structure and format of this chunk.
    public var id: RIFFFileChunkID {
        base.id
    }

    /// The total byte offset range of the entire chunk.
    public var range: ClosedRange<UInt64> {
        base.range
    }

    /// The byte offset range of the chunk's usable data portion.
    public var dataRange: ClosedRange<UInt64>? {
        base.dataRange
    }
}

extension AnyRIFFFileChunk /* : RIFFFileChunkHasSubID */ {
    public var subID: String? {
        base.getSubID
    }
}

extension AnyRIFFFileChunk /* : RIFFFileChunkHasChunks */ {
    public var chunks: [AnyRIFFFileChunk]? {
        base.getChunks
    }
}

// MARK: - Collection Methods

extension Sequence<AnyRIFFFileChunk> {
    /// Returns an array containing chunk(s) matching the given chunk ID string.
    public func filter(id: String) -> [Element] {
        filter { $0.id.id == id }
    }

    /// Returns an array containing chunk(s) matching the given chunk IDs.
    public func filter(id: RIFFFileChunkID) -> [Element] {
        filter { $0.id == id }
    }

    /// Returns the first chunk matching the given chunk ID string.
    public func first(id: String) -> Element? {
        first { $0.id.id == id }
    }

    /// Returns the first chunk matching the given chunk ID.
    public func first(id: RIFFFileChunkID) -> Element? {
        first { $0.id == id }
    }
}
