//
//  ViewController.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    MovieSearchManager().request(from: "스타워즈") { movies in
      print(movies)
    }
  }
}
