import Foundation

// Stub for ElevenLabsKit - functionality available when ElevenLabsKit is added back

public struct ElevenLabsVoice: Codable, Sendable {
    public let voiceId: String
    public let name: String
    public let category: String?
    public init(voiceId: String, name: String, category: String? = nil) {
        self.voiceId = voiceId
        self.name = name
        self.category = category
    }
}

public struct ElevenLabsTTSRequest: Codable, Sendable {
    public let text: String
    public let voiceId: String
    public let modelId: String?
    public let optimizeStreamingLatency: Int?
    public let outputFormat: String?
    public let normalization: Bool?
    
    public init(text: String, voiceId: String, modelId: String? = nil, optimizeStreamingLatency: Int? = nil, outputFormat: String? = nil, normalization: Bool? = nil) {
        self.text = text
        self.voiceId = voiceId
        self.modelId = modelId
        self.optimizeStreamingLatency = optimizeStreamingLatency
        self.outputFormat = outputFormat
        self.normalization = normalization
    }
}

public enum TalkTTSValidation: Sendable {
    case valid
    case invalidVoiceId
    case invalidOutputFormat
}

public class ElevenLabsTTSClient: @unchecked Sendable {
    public static func validatedLanguage(_ language: String?) -> String? {
        guard let lang = language?.lowercased() else { return nil }
        if lang.hasPrefix("en") { return "en" }
        return nil
    }
    
    public static func validatedOutputFormat(_ format: String?) -> String? {
        guard let format = format else { return "mp3_44100_128" }
        let validFormats = ["mp3_44100_128", "mp3_44100_64", "pcm_16000", "pcm_22050", "pcm_24000"]
        return validFormats.contains(format) ? format : "mp3_44100_128"
    }
    
    public static func validatedNormalize(_ normalize: String?) -> String? {
        guard let norm = normalize?.lowercased() else { return nil }
        if norm == "auto" || norm == "true" || norm == "false" { return norm }
        return nil
    }
}

public class StreamingAudioPlayer: @unchecked Sendable {
    public static let shared = StreamingAudioPlayer()
    public init() {}
    public func play(data: Data) async throws {}
    public func stop() async {}
}

public class PCMStreamingAudioPlayer: @unchecked Sendable {
    public static let shared = PCMStreamingAudioPlayer()
    public init() {}
    public func play(data: Data) async throws {}
    public func stop() async {}
}

public struct StreamingPlaybackResult: Sendable {
    public let success: Bool
    public let bytesPlayed: Int
}
