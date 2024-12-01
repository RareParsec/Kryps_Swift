//
//  Errors.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import Foundation

enum fetchPostsError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
