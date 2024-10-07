//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Hamzah on 07.10.24.
//

import Foundation

class HomeViewModel : ObservableObject{
    @Published var newDeviceName : String = ""
    @Published var devices : [Device] = []
    
    
    func addDevice(){
        let device = Device(name: newDeviceName)
        devices.append(device)
        newDeviceName=""
    }
    
}
