//
//  main.swift
//  GB_Base_Homework
//
//  Created by Тимофей Соломатин on 18.08.2023.
//

import Foundation

//MARK: Enum

//enum CarModel: String {
//    case small = "Седан"
//    case middle = "Джип"
//    case big = "Фура"
//}
//
//func modelOutput(for name: CarModel) {
//    switch name {
//    case .big:
//        print (CarModel.big.rawValue)
//    case .middle:
//        print (CarModel.big.rawValue)
//    case .small:
//        print (name.rawValue)
//    }
//}
//
//modelOutput(for: .small)

//MARK: Struct

//enum DoorStatus: String {
//    case opened = "Открыты"
//    case closed = "Закрыты"
// }
//
//struct Car {
//    let name: String
//    let color: String
//    var km: Int
//    var doors: DoorStatus
//}
//
//
//var car1 = Car(name: "БМВ", color: "красная", km: 3000, doors: .closed)
//
//print(car1.doors.rawValue)

//MARK: Homework

enum TypeCar: String {
    case Big = "Грузовой"
    case Jeep = "Джип"
    case sedan = "Седан"
}

enum EngineStatus: String {
    case work = "работает"
    case muted = "заглушен"
}

enum WindowsStatus: String {
    case opened = "открыты"
    case closed = "закрыты"
}




struct Car {
    let type: TypeCar
    let mark: String
    let yearOfRelease: Int
    let trunkVolume: Int
    var engineStatus: EngineStatus {
        willSet {
            print ("Теперь двигатель \(newValue.rawValue)")
        }
    }
    var windowsstatus: WindowsStatus {
        willSet {
            print("Теперь окна \(newValue.rawValue)")
        }
    }
    var filledTrunkVolume: Int {
        didSet {
            if oldValue < filledTrunkVolume {
                print ("В багажник загрузили еще \(filledTrunkVolume - oldValue). Свободным осталось \(trunkVolume - filledTrunkVolume)")
            } else {
                print ("Из багажника выгрузили \(oldValue - filledTrunkVolume). Свободным осталось \(trunkVolume - filledTrunkVolume)")
            }
        }
    }
}

var car1 = Car(type: .Big, mark: "BMW", yearOfRelease: 2015, trunkVolume: 700, engineStatus: .work, windowsstatus: .opened, filledTrunkVolume: 340)
car1.engineStatus = .muted
car1.windowsstatus = .closed
car1.filledTrunkVolume = 170


