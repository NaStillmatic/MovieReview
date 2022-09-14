//
//  MovieListPresenterTests.swift
//  MovieReviewTests
//
//  Created by HwangByungJo  on 2022/09/14.
//

import XCTest

@testable import MovieReview

class MovieListPresenterTests: XCTestCase {
  var sut: MovieListPresenter!

  var viewController: MockMovieListViewController!
  var userDefaultsManager: MockUserDefaultsManager!
  var movieSearchManager: MockMovieSearchManager!

  override func setUp() {
    super.setUp()

    viewController = MockMovieListViewController()
    userDefaultsManager = MockUserDefaultsManager()
    movieSearchManager = MockMovieSearchManager()

    sut = MovieListPresenter(viewController: viewController,
                             movieSearchManager: movieSearchManager,
                             userDefaultsManager: userDefaultsManager)
  }

  override func tearDown() {
    sut = nil

    viewController = nil
    userDefaultsManager = nil
    movieSearchManager = nil
  }

  func test_searchBar_textDidChange가_호출될때_request가_성공하면() {
    movieSearchManager.needToSuccessRequest = true
    sut.searchBar(UISearchBar(), textDidChange: "")
    XCTAssertTrue(viewController.isCalledUpdateSearchTableView, "updateSearchTableView 가 실행 된다.")
  }

  func test_searcchBar_textDidChange가_호출될떼_request가_실패하면() {
    movieSearchManager.needToSuccessRequest = false
    sut.searchBar(UISearchBar(), textDidChange: "")
    XCTAssertFalse(viewController.isCalledUpdateSearchTableView, "updateSearchTableView 가 실행되지 않는다..")
  }

  func test_viewDidLoad가_호출되면() {
    sut.viewDidLoad()

    XCTAssertTrue(viewController.isCalledSetupNavigationBar)
    XCTAssertTrue(viewController.isCalledSetupSearchBar)
    XCTAssertTrue(viewController.isCalledSetupViews)
  }

  func test_viewWillAppear가_호출되면() {
    sut.viewWillAppear()

    XCTAssertTrue(userDefaultsManager.isCalledGetMoves)
    XCTAssertTrue(viewController.isCalledUpdateCollectionView)
  }

  func test_searchBarTextDidBeginEditing이_호출되면() {
    sut.searchBarTextDidBeginEditing(UISearchBar())
    XCTAssertTrue(viewController.isCalledUpdateSearchTableView)
  }

  func test_searchBarCancelButtonClicked가_호출되면() {
    sut.searchBarCancelButtonClicked(UISearchBar())
    XCTAssertTrue(viewController.isCalledUpdateSearchTableView)
  }
}
