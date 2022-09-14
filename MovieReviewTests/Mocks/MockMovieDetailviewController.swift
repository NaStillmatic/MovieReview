//
//  MockMovieDetailviewController.swift
//  MovieReviewTests
//
//  Created by HwangByungJo  on 2022/09/15.
//

import Foundation
@testable import MovieReview

final class MockMovieDetailviewController: MovieDetailProtocol {

  var isCalledSetViews = false
  var isCalledSetRightBarButton = false

  var settedIsLiked = false

  func setViews(with movie: Movie) {
    isCalledSetViews = true
  }

  func setRightBarButton(with isLiked: Bool) {
    settedIsLiked = isLiked
    isCalledSetRightBarButton = true
  }
}
