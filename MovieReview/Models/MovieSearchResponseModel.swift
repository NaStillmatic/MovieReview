//
//  MovieSearchResponseModel.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/08/30.
//

import Foundation

struct MovieSearchResponseModel: Decodable {

  var items: [Movie] = []
}

struct Movie: Codable {

  let title: String
  private let image: String
  let userRating: String
  let actor: String
  let director: String
  let pubDate: String

  var isLiked: Bool

  var imageURL: URL? { URL(string: image) }

  private enum CodingKeys: String, CodingKey {
    case title, image, userRating, actor, director, pubDate, isLiked
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    title = (try container.decodeIfPresent(String.self, forKey: .title) ?? "-").withoutHtmlTags
    image = try container.decodeIfPresent(String.self, forKey: .image) ?? "-"
    userRating = try container.decodeIfPresent(String.self, forKey: .userRating) ?? "-"
    actor = try container.decodeIfPresent(String.self, forKey: .actor) ?? "-"
    director = try container.decodeIfPresent(String.self, forKey: .director) ?? "-"
    pubDate = try container.decodeIfPresent(String.self, forKey: .pubDate) ?? "-"

    isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
  }

  init(title: String,
       imageUrl: String,
       userRating: String,
       actor: String,
       director: String,
       pubDate: String,
       isLiked: Bool = false) {
    self.title = title
    self.image = imageUrl
    self.userRating = userRating
    self.actor = actor
    self.director = director
    self.pubDate = pubDate
    self.isLiked = isLiked
  }
}

extension String {
    var withoutHtmlTags: String {
      return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
