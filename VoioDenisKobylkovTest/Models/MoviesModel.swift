// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie
struct Response: Codable {
    let resultCount: Int?
    let results: [Movie]?
}

// MARK: - Result
struct Movie: Codable {
    let wrapperType: WrapperType?
    let kind: Kind?
    let collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName: PrimaryGenreName?
    let contentAdvisoryRating: ContentAdvisoryRating?
    let longDescription: String?
    let hasITunesExtras: Bool?
    let shortDescription: String?
    let artistID: Int?
    let artistViewURL: String?
    

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, longDescription, hasITunesExtras, shortDescription
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
    }
}

enum Explicitness: String, Codable {
    case notExplicit = "notExplicit"
}

enum ContentAdvisoryRating: String, Codable {
    case g = "G"
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
    case unrated = "Unrated"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
}

enum PrimaryGenreName: String, Codable {
    case actionAdventure = "Action & Adventure"
    case comedy = "Comedy"
    case drama = "Drama"
    case kidsFamily = "Kids & Family"
    case romance = "Romance"
    case sciFiFantasy = "Sci-Fi & Fantasy"
}

enum WrapperType: String, Codable {
    case track = "track"
}



class AppMovie{
    var movie: Movie
    var isFavorite: Bool
    init(movie: Movie) {
        self.movie = movie
        self.isFavorite = false
    }
}









