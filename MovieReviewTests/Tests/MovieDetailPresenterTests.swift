//
//  MovieDetailPresenterTests.swift
//  MovieReviewTests
//
//  Created by HwangByungJo  on 2022/09/15.
//

import XCTest
@testable import MovieReview

class MovieDetailPresenterTest: XCTestCase {

  var sut: MovieDetailPresenter!

  var viewController: MockMovieDetailviewController!
  var movie: Movie!
  var userDefaultsManager: MockUserDefaultsManager!

  override func setUp() {
    super.setUp()

    viewController = MockMovieDetailviewController()
    movie = Movie(title: "", imageUrl: "", userRating: "", actor: "", director: "", pubDate: "")
    userDefaultsManager = MockUserDefaultsManager()

    sut = MovieDetailPresenter(viewController: viewController,
                               movie: movie,
                               userDefaultsManager: userDefaultsManager)
  }

  override func tearDown() {
    sut = nil

    viewController = nil
    movie = nil
    userDefaultsManager = nil

    super.tearDown()
  }

  func test_viewDidLoad() {
    sut.viewDidLoad()

    XCTAssertTrue(viewController.isCalledSetViews)
    XCTAssertTrue(viewController.isCalledSetRightBarButton)
  }

  func test_didTapRightBarButtonItem이_호출될때_isLiked가_true가되면() {
    movie.isLiked = false
    sut = MovieDetailPresenter(viewController: viewController,
                               movie: movie,
                               userDefaultsManager: userDefaultsManager)

    sut.didTapRightBarButtonItem()
    XCTAssertTrue(userDefaultsManager.isCalledAddMovie)
    XCTAssertFalse(userDefaultsManager.isCalledGetMoves)
    XCTAssertTrue(viewController.isCalledSetRightBarButton)
  }

  func test_didTapRightBarButtonItem이_호출될때_isLiked가_false가되면() {

    movie.isLiked = true
    sut = MovieDetailPresenter(viewController: viewController,
                               movie: movie,
                               userDefaultsManager: userDefaultsManager)
    sut.didTapRightBarButtonItem()
    XCTAssertFalse(userDefaultsManager.isCalledAddMovie)
    XCTAssertTrue(userDefaultsManager.isCalledRemoveMovie)
    XCTAssertTrue(viewController.isCalledSetRightBarButton)
  }
}
