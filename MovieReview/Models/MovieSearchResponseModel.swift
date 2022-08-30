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

struct Movie: Decodable {
  let title: String
  let link: String
  private let image: String
  let subtitle: String
  let pubDate: String
  let director: String
  let actor: String
  let userRating: String

  var imageURL: URL? { URL(string: image) }
}
