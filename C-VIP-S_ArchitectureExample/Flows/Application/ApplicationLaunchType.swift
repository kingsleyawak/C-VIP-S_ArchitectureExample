//
//  ApplicationLaunchType.swift
//  C-VIP-S_ArchitectureExample
//
//  Created by Kingsley Edem Awak on 3/27/19.
//  Copyright © 2019 Kingsley Edem Awak. All rights reserved.
//

import UIKit

enum ApplicationLaunchType {
    case deepLink(URL)
    case forceTouch
    case defaultOpening
    case pushNotification
}
