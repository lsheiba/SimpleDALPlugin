//
//  Plugin.swift
//  SimpleDALPlugin
//
//  Created by 池上涼平 on 2020/04/25.
//  Copyright © 2020 com.seanchas116. All rights reserved.
//

import Foundation

class Plugin: Object {
    var objectID: CMIOObjectID = 0
    let name = "SimpleDALPlugin"

    func isPropertySettable(address: CMIOObjectPropertyAddress) -> Bool {
        return false
    }

    func getPropertyDataSize(address: CMIOObjectPropertyAddress) -> UInt32 {
        switch (Int(address.mSelector)) {
        case kCMIOObjectPropertyName:
            return String.dataSize
        default:
            return 0
        }
    }

    func getPropertyData(address: CMIOObjectPropertyAddress, dataSize: inout UInt32, data: UnsafeMutableRawPointer) {
        dataSize = getPropertyDataSize(address: address)

        switch (Int(address.mSelector)) {
        case kCMIOObjectPropertyName:
            name.toData(data: data)
        default: break
        }
    }

    func setPropertyData(address: CMIOObjectPropertyAddress, data: UnsafeRawPointer) {
    }
}
