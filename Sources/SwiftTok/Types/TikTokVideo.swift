
import Foundation

// MARK: - TikTokVideo
public struct TikTokVideo: Codable {
    public let id, desc, createTime: String
    public let scheduleTime: Int
    public let video: TikTokVideoInfo
    public let author: String
    public let music: TikTokMusic
    public let stats: TikTokStats
    public let isActivityItem: Bool
    public let originalItem, officalItem: Bool
    public let secret, forFriend, digged: Bool
    public let itemCommentStatus: Int
    public let showNotPass, vl1: Bool
    public let takeDown: Int
    public let itemMute: Bool
    public let authorStats: TikTokAuthorStats
    public let privateItem, duetEnabled, stitchEnabled: Bool
    public let stickersOnItem: [TikTokStickersOnItem]
    public let isAd, shareEnabled: Bool
    public let duetDisplay, stitchDisplay: Int
    public let indexEnabled: Bool
    public let diversificationLabels: [String]
    public let adAuthorization: Bool
    public let adLabelVersion: Int
    public let locationCreated, nickname, authorID, authorSECID: String
    public let avatarThumb: URL
    public let downloadSetting: Int
    public let authorPrivate: Bool

    enum CodingKeys: String, CodingKey {
        case id, desc, createTime, scheduleTime, video, author, music, stats, isActivityItem, originalItem, officalItem, secret, forFriend, digged, itemCommentStatus, showNotPass, vl1, takeDown, itemMute, authorStats, privateItem, duetEnabled, stitchEnabled, stickersOnItem, isAd, shareEnabled, duetDisplay, stitchDisplay, indexEnabled, diversificationLabels, adAuthorization, adLabelVersion, locationCreated, nickname
        case authorID = "authorId"
        case authorSECID = "authorSecId"
        case avatarThumb, downloadSetting, authorPrivate
    }

    public init(id: String, desc: String, createTime: String, scheduleTime: Int, video: TikTokVideoInfo, author: String, music: TikTokMusic, stats: TikTokStats, isActivityItem: Bool, originalItem: Bool, officalItem: Bool, secret: Bool, forFriend: Bool, digged: Bool, itemCommentStatus: Int, showNotPass: Bool, vl1: Bool, takeDown: Int, itemMute: Bool, authorStats: TikTokAuthorStats, privateItem: Bool, duetEnabled: Bool, stitchEnabled: Bool, stickersOnItem: [TikTokStickersOnItem], isAd: Bool, shareEnabled: Bool, duetDisplay: Int, stitchDisplay: Int, indexEnabled: Bool, diversificationLabels: [String], adAuthorization: Bool, adLabelVersion: Int, locationCreated: String, nickname: String, authorID: String, authorSECID: String, avatarThumb: URL, downloadSetting: Int, authorPrivate: Bool) {
        self.id = id
        self.desc = desc
        self.createTime = createTime
        self.scheduleTime = scheduleTime
        self.video = video
        self.author = author
        self.music = music
        self.stats = stats
        self.isActivityItem = isActivityItem
        self.originalItem = originalItem
        self.officalItem = officalItem
        self.secret = secret
        self.forFriend = forFriend
        self.digged = digged
        self.itemCommentStatus = itemCommentStatus
        self.showNotPass = showNotPass
        self.vl1 = vl1
        self.takeDown = takeDown
        self.itemMute = itemMute
        self.authorStats = authorStats
        self.privateItem = privateItem
        self.duetEnabled = duetEnabled
        self.stitchEnabled = stitchEnabled
        self.stickersOnItem = stickersOnItem
        self.isAd = isAd
        self.shareEnabled = shareEnabled
        self.duetDisplay = duetDisplay
        self.stitchDisplay = stitchDisplay
        self.indexEnabled = indexEnabled
        self.diversificationLabels = diversificationLabels
        self.adAuthorization = adAuthorization
        self.adLabelVersion = adLabelVersion
        self.locationCreated = locationCreated
        self.nickname = nickname
        self.authorID = authorID
        self.authorSECID = authorSECID
        self.avatarThumb = avatarThumb
        self.downloadSetting = downloadSetting
        self.authorPrivate = authorPrivate
    }
}

// MARK: - TikTokAuthorStats
public struct TikTokAuthorStats: Codable {
    public let followerCount, followingCount, heart, heartCount: Int
    public let videoCount, diggCount: Int

    public init(followerCount: Int, followingCount: Int, heart: Int, heartCount: Int, videoCount: Int, diggCount: Int) {
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.heart = heart
        self.heartCount = heartCount
        self.videoCount = videoCount
        self.diggCount = diggCount
    }
}

// MARK: - TikTokMusic
public struct TikTokMusic: Codable {
    public let id, title: String
    public let playURL: URL
    public let coverLarge, coverMedium, coverThumb: String
    public let authorName: String
    public let original: Bool
    public let duration: Int
    public let album: String?
    public let scheduleSearchTime: Int

    enum CodingKeys: String, CodingKey {
        case id, title
        case playURL = "playUrl"
        case coverLarge, coverMedium, coverThumb, authorName, original, duration, album, scheduleSearchTime
    }

    public init(id: String, title: String, playURL: URL, coverLarge: String, coverMedium: String, coverThumb: String, authorName: String, original: Bool, duration: Int, album: String?, scheduleSearchTime: Int) {
        self.id = id
        self.title = title
        self.playURL = playURL
        self.coverLarge = coverLarge
        self.coverMedium = coverMedium
        self.coverThumb = coverThumb
        self.authorName = authorName
        self.original = original
        self.duration = duration
        self.album = album
        self.scheduleSearchTime = scheduleSearchTime
    }
}

// MARK: - TikTokStats
public struct TikTokStats: Codable {
    public let diggCount, shareCount, commentCount, playCount: Int

    public init(diggCount: Int, shareCount: Int, commentCount: Int, playCount: Int) {
        self.diggCount = diggCount
        self.shareCount = shareCount
        self.commentCount = commentCount
        self.playCount = playCount
    }
}

// MARK: - TikTokStickersOnItem
public struct TikTokStickersOnItem: Codable {
    public let stickerText: [String]
    public let stickerType: Int

    public init(stickerText: [String], stickerType: Int) {
        self.stickerText = stickerText
        self.stickerType = stickerType
    }
}

// MARK: - TikTokVideoInfo
public struct TikTokVideoInfo: Codable {
    public let id: String
    public let height, width, duration: Int
    public let ratio: String
    public let cover, originCover, dynamicCover: String
    public let playAddr, downloadAddr: URL
    public let shareCover: [String]
    public let reflowCover: String
    public let bitrate: Int
    public let encodedType, format, videoQuality, encodeUserTag: String
    public let codecType, definition: String
    public let subtitleInfos: [TikTokSubtitleInfo]
    public let zoomCover: [String: String]
    public let volumeInfo: TikTokVolumeInfo
    public let bitrateInfo: [TikTokBitrateInfo]

    public init(id: String, height: Int, width: Int, duration: Int, ratio: String, cover: String, originCover: String, dynamicCover: String, playAddr: URL, downloadAddr: URL, shareCover: [String], reflowCover: String, bitrate: Int, encodedType: String, format: String, videoQuality: String, encodeUserTag: String, codecType: String, definition: String, subtitleInfos: [TikTokSubtitleInfo], zoomCover: [String: String], volumeInfo: TikTokVolumeInfo, bitrateInfo: [TikTokBitrateInfo]) {
        self.id = id
        self.height = height
        self.width = width
        self.duration = duration
        self.ratio = ratio
        self.cover = cover
        self.originCover = originCover
        self.dynamicCover = dynamicCover
        self.playAddr = playAddr
        self.downloadAddr = downloadAddr
        self.shareCover = shareCover
        self.reflowCover = reflowCover
        self.bitrate = bitrate
        self.encodedType = encodedType
        self.format = format
        self.videoQuality = videoQuality
        self.encodeUserTag = encodeUserTag
        self.codecType = codecType
        self.definition = definition
        self.subtitleInfos = subtitleInfos
        self.zoomCover = zoomCover
        self.volumeInfo = volumeInfo
        self.bitrateInfo = bitrateInfo
    }
}

// MARK: - TikTokBitrateInfo
public struct TikTokBitrateInfo: Codable {
    public let gearName: String
    public let bitrate, qualityType: Int
    public let playAddr: TikTokPlayAddr
    public let codecType: String

    enum CodingKeys: String, CodingKey {
        case gearName = "GearName"
        case bitrate = "Bitrate"
        case qualityType = "QualityType"
        case playAddr = "PlayAddr"
        case codecType = "CodecType"
    }

    public init(gearName: String, bitrate: Int, qualityType: Int, playAddr: TikTokPlayAddr, codecType: String) {
        self.gearName = gearName
        self.bitrate = bitrate
        self.qualityType = qualityType
        self.playAddr = playAddr
        self.codecType = codecType
    }
}

// MARK: - TikTokPlayAddr
public struct TikTokPlayAddr: Codable {
    public let uri: URL
    public let urlList: [URL]
    public let dataSize, urlKey, fileHash, fileCS: String

    enum CodingKeys: String, CodingKey {
        case uri = "Uri"
        case urlList = "UrlList"
        case dataSize = "DataSize"
        case urlKey = "UrlKey"
        case fileHash = "FileHash"
        case fileCS = "FileCs"
    }

    public init(uri: URL, urlList: [URL], dataSize: String, urlKey: String, fileHash: String, fileCS: String) {
        self.uri = uri
        self.urlList = urlList
        self.dataSize = dataSize
        self.urlKey = urlKey
        self.fileHash = fileHash
        self.fileCS = fileCS
    }
}

// MARK: - TikTokSubtitleInfo
public struct TikTokSubtitleInfo: Codable {
    public let languageID, languageCodeName: String
    public let url: URL
    public let urlExpire: String
    public let format: TikTokFormat
    public let version: String
    public let source: TikTokSource
    public let videoSubtitleID: Int
    public let size: String

    enum CodingKeys: String, CodingKey {
        case languageID = "LanguageID"
        case languageCodeName = "LanguageCodeName"
        case url = "Url"
        case urlExpire = "UrlExpire"
        case format = "Format"
        case version = "Version"
        case source = "Source"
        case videoSubtitleID = "VideoSubtitleID"
        case size = "Size"
    }

    public init(languageID: String, languageCodeName: String, url: URL, urlExpire: String, format: TikTokFormat, version: String, source: TikTokSource, videoSubtitleID: Int, size: String) {
        self.languageID = languageID
        self.languageCodeName = languageCodeName
        self.url = url
        self.urlExpire = urlExpire
        self.format = format
        self.version = version
        self.source = source
        self.videoSubtitleID = videoSubtitleID
        self.size = size
    }
}

public enum TikTokFormat: String, Codable {
    case webvtt = "webvtt"
}

public enum TikTokSource: String, Codable {
    case asr = "ASR"
    case mt = "MT"
}

// MARK: - TikTokVolumeInfo
public struct TikTokVolumeInfo: Codable {
    public let loudness: Double
    public let peak: Double

    enum CodingKeys: String, CodingKey {
        case loudness = "Loudness"
        case peak = "Peak"
    }

    public init(loudness: Double, peak: Double) {
        self.loudness = loudness
        self.peak = peak
    }
}
