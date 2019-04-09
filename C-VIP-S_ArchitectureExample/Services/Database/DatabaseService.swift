//
//  DatabaseService.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/29/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import Foundation

final class DatabaseService:DatabaseServiceProtocol {
    private init() {}
    static let sharedInstance = DatabaseService()
}
