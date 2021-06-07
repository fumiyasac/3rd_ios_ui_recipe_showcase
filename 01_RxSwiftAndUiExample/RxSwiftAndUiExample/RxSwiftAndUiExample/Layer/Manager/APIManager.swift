//
//  APIRequestManager.swift
//  RxSwiftAndUiExample
//
//  Created by 酒井文也 on 2021/06/02.
//

import Foundation
import RxSwift
import SwiftyUserDefaults

// MARK: - Enum

// MEMO: APIリクエストに関するEnum定義
enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

// MEMO: APIエラーメッセージに関するEnum定義
enum APIError: Error {
    case error(String)
}

class APIManager {
    
    // MEMO: API Mock ServerへのURLに関する情報
    static let host = "http://localhost:8080/api"
    static let version = "v1"

    private let session = URLSession.shared
    private let apiAuthenticatedToken = Defaults[\.apiAuthenticatedToken]

    // MARK: - Singleton Instance

    static let shared = APIManager()

    private init() {}

    // MARK: - Function

    func executeAPIRequest<T: Decodable>(
        endpointUrl: String,
        withParameters: [String : Any] = [:],
        httpMethod: HTTPMethod = .GET,
        responseFormat: T.Type
    ) -> Single<T> {

        var urlRequest: URLRequest
        switch httpMethod {
        case .GET:
            urlRequest = makeGetRequest(endpointUrl)
        case .POST:
            urlRequest = makePostRequest(
                endpointUrl,
                withParameters: withParameters)
        default:
            fatalError()
        }
        return handleDataTask(T.self, request: urlRequest)
    }

    // MARK: - Private Function

    private func handleDataTask<T: Decodable>(
        _ dataType: T.Type,
        request: URLRequest
    ) -> Single<T> {

        return Single<T>.create(subscribe: { singleEvent in

            // MEMO: API通信結果のハンドリング処理では、成功または失敗かのいずれかのイベントを1度だけ流すことを保証する形にする
            let task = self.session.dataTask(with: request) { data, response, error in
                // MEMO: 通信状態等に起因するエラー発生時のエラーハンドリング
                if let error = error {
                    singleEvent(.failure(error))
                    return
                }
                // MEMO: ステータスコードの精査及びエラーハンドリング
                if let response = response as? HTTPURLResponse, case 400...500 = response.statusCode {

                    // MEMO: ステータスコードが403(Access Denied)の場合には一番最初に表示する画面へ強制的に遷移する
                    if response.statusCode == 403 {
                        print("403 Error Occurs in", request)
                        DispatchQueue.main.async {
                            //
                        }
                        singleEvent(.failure(APIError.error("Error: StatusCodeが403です。")))
                    } else {
                        singleEvent(.failure(APIError.error("Error: StatusCodeが200~399以外です。")))
                    }
                    return
                }

                // MEMO: 取得データの内容の精査及びエラーハンドリング
                guard let data = data else {
                    singleEvent(.failure(APIError.error("Error: レスポンスが空でした。")))
                    return
                }
                // MEMO: 取得できたレスポンスを引数で指定した型の配列に変換して受け取る
                do {
                    let hashableObjects = try JSONDecoder().decode(T.self, from: data)
                    singleEvent(.success(hashableObjects))
                } catch {
                    singleEvent(.failure(APIError.error("Error: JSONからのマッピングに失敗しました。")))
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        })
    }

    // API Mock ServerへのGETリクエストを作成する
    private func makeGetRequest(_ urlString: String) -> URLRequest {

        guard let url = URL(string: urlString) else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(apiAuthenticatedToken , forHTTPHeaderField: "Authorization")
        return urlRequest
    }

    // API Mock ServerへのPOSTリクエストを作成する
    private func makePostRequest(
        _ urlString: String,
        withParameters: [String : Any] = [:]
    ) -> URLRequest {

        guard let url = URL(string: urlString) else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        // MEMO: Dictionaryで取得したリクエストパラメータをJSONに変換している
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: withParameters, options: [])
            urlRequest.httpBody = requestBody
        } catch {
            fatalError("Invalid request body parameters.")
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(apiAuthenticatedToken , forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
