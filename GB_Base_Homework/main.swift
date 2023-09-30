//
//  main.swift
//  GB_Base_Homework
//
//  Created by Тимофей Соломатин on 19.08.2023.
//

import Foundation

//MARK: Enums
enum Status: String{
    case closed = "закрыт"
    case opened = "открыт"
}

//MARK: Protocols

protocol CarStatus {
    var doorsStatus: Status { get set }
    var trunkStatus: Status { get set }
    var centralLock: Status { get set }
}

//MARK: Classes

class Car: CarStatus {
    let carModel: String
    let carColor: String
    var doorsStatus: Status
    var trunkStatus: Status
    var centralLock: Status
    var horsePower: Int
    
    init(carModel: String,
         carColor: String,
         doorsStatus: Status,
         trunkStatus: Status,
         centralLock: Status,
         horsePower: Int)
    {
        self.carModel = carModel
        self.carColor = carColor
        self.doorsStatus = doorsStatus
        self.trunkStatus = trunkStatus
        self.centralLock = centralLock
        self.horsePower = horsePower
    }
    
}



 
