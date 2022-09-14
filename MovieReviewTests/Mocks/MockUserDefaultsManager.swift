//
//  MockUserDefaultsManager.swift
//  MovieReviewTests
//
//  Created by HwangByungJo  on 2022/09/14.
//

import Foundation

@testable import MovieReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {

  var isCalledGetMoves = false
  var isCalledAddMovie = false
  var isCalledRemoveMovie = false

  func getMovies() -> [Movie] {
    isCalledGetMoves = true
    return []
  }

  func addMovie(_ newValue: Movie) {
    isCalledAddMovie = true
  }

  func removeMovie(_ movie: Movie) {
    isCalledRemoveMovie = true
  }
}
