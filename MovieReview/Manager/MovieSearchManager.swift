//
//  MovieSearchManager.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/08/30.
//

import Foundation
import Alamofire

protocol MovieSearchManagerProtocol {
  func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void)
}

struct MovieSearchManager: MovieSearchManagerProtocol {
  func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
    guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }

    let parameters = MovieSearchRequestModel(query: keyword)

    let headers: HTTPHeaders = ["X-Naver-Client-Id": "31Yx_S_nC13mpBeWVt2g",
                               "X-Naver-Client-Secret": "fEq9F0rhZ_"]

    AF.request(url,
               method: .get,
               parameters: parameters,
               headers: headers)
    .responseDecodable(of: MovieSearchResponseModel.self) { response in
      switch response.result {
      case .success(let result):
          completionHandler(result.items)
      case .failure(let error):
          print(error)
      }
    }.resume()
  }
}
