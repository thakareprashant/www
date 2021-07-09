import Foundation

// MARK: - Result
struct Result: Codable {
    let resultCount: Int
    let results: [ResultElement]
}

// MARK: - ResultElement
struct ResultElement: Codable {
    let wrapperType: WrapperType
    let kind: Kind?
    let collectionID, trackID: Int?
    let artistName: String
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let collectionViewURL, feedURL, trackViewURL: String?
    let artworkUrl30: String?
    let artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness: Explicitness
    let trackExplicitness: Explicitness?
    let trackCount: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let contentAdvisoryRating: String?
    let artworkUrl600: String?
    let genreIDS, genres: [String]?
    let previewURL: String?
    let trackTimeMillis: Int?
    let shortDescription, longDescription: String?
    let artistID: Int?
    let artistViewURL: String?
    let discCount, discNumber, trackNumber: Int?
    let isStreamable: Bool?
    let collectionArtistID: Int?
    let collectionArtistName: String?
    let collectionArtistViewURL: String?
    let copyright, resultDescription: String?
    let amgArtistID: Int?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionViewURL = "collectionViewUrl"
        case feedURL = "feedUrl"
        case trackViewURL = "trackViewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackCount, country, currency, primaryGenreName, contentAdvisoryRating, artworkUrl600
        case genreIDS = "genreIds"
        case genres
        case previewURL = "previewUrl"
        case trackTimeMillis, shortDescription, longDescription
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case discCount, discNumber, trackNumber, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case copyright
        case resultDescription = "description"
        case amgArtistID = "amgArtistId"
    }
}

enum Explicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case podcast = "podcast"
    case song = "song"
    case tvEpisode = "tv-episode"
}

enum WrapperType: String, Codable {
    case audiobook = "audiobook"
    case track = "track"
}
