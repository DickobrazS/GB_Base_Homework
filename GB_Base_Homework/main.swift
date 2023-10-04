//
//  main.swift
//  GB_Base_Homework
//
//  Created by Тимофей Соломатин on 19.08.2023.
//

import Foundation

//MARK: Enums

enum Transmission: String {
     case manual = "механическая коробка передач"
     case auto = "автоматическая коробка передач"
 }

 enum Color: String {
     case yellow = "желтый"
     case black = "черный"
     case white = "белый"
     case red = "красный"
     case blue = "синий"
     case pink = "розовый"
 }

 enum EngineStatus: String {
     case works = "двигатель работает"
     case turnedOff = "двигатель заглушен"
 }

 enum TypeOfSportCar: String {
     case superCar = "суперкар"
     case sportCar = "спорткар"
     case hyperCar = "гиперкар"
 }

 enum DoorsType: String {
     case gullWings = "двери типа крылья чайки"
     case swanWings = "двери типа крылья лебедя"
     case standart = "стандартные двери"
 }

 enum EngineLocation: String {
     case back = "двигатель сзади"
     case middle = "двигатель посередине"
     case forward = "двигатель спереди"
 }

 enum Trunk: String {
     case available = "есть багажник"
     case notAvailable = "багажника нет"
 }

 enum Nitro: String {
     case yes = "в машине есть закись азота"
     case no = "в машине нет закиси азота"
 }

 enum TrunkType: String {
     case truck = "фура"
     case lorry = "грузовик"
     case minivan = "минивен"
 }


enum Status: String{
    case closed = "закрыт"
    case opened = "открыт"
}

//MARK: Protocols and Extensions

protocol Car {
    var carName: String { get set }
    var carColor: Color { get set }
    var trunk: Trunk { get set }
    var engineStatus: EngineStatus { get set }
    var doorsStatus: Status { get set }
    var trunkStatus: Status { get set }
    var centralLock: Status { get set }
    var horsePower: Int { get set }

    func printFullInformation()
    func openDoors (_ doorStatus: Status)
}


extension Car {
    
//    mutating func openDoors (_ doorStatus: Status) -> Status {
//        print ("Двери !!!!!!!открылись")
//        var doorStatus: Status = doorStatus
//        doorStatus = .opened
//        return doorStatus
//    }
    
    
    
   mutating func statusEngine (engineStatus: EngineStatus) {
        self.engineStatus = engineStatus
        switch engineStatus{
        case.turnedOff: print ("Теперь двигатель выключен")
        case.works: print ("Теперь двигатель включен")
        }
    }
//    
//    mutating func openCentralLock () {
//        return centralLock = .opened
//        print ("Центральный замок открыт")
//    }
    
    
    
    func printFullInformation() {
        print ("""
        
        Название машины: \(carName)
        Количество лошадинных сил: \(horsePower)
        Цвет машины: \(carColor.rawValue)
        В машине \(trunk.rawValue)
        Статус двигателя: \(engineStatus.rawValue)
        Замок дверей: \(doorsStatus.rawValue)
        Замок багажника: \(trunkStatus.rawValue)
        Центральный замок: \(centralLock.rawValue)
        
        """)
    }
}


//MARK: Classes

final class SportCar: Car, CustomStringConvertible {
    
    func openDoors(_ doorStatus: Status) {
        print ("gbplf")
    }
    



    var carName: String
    var typeOfSportCar: TypeOfSportCar
    var EngineLocation: EngineLocation
    var nitro: Nitro
    var doorsType: DoorsType
    var transmission: Transmission
    var carColor: Color
    var trunk: Trunk
    var engineStatus: EngineStatus
    var doorsStatus: Status
    var trunkStatus: Status
    var centralLock: Status
    var horsePower: Int
    
    var description: String {
        return ("""
Краткая информация по машине
Название машины: \(carName)
Цвет машины: \(carColor.rawValue)
Статус двигателя: \(engineStatus.rawValue)

Если вам нужна полная информация, вызовите функцию printFullInformation

""")
    }
    
    init(carName: String,
         typeOfSportCar: TypeOfSportCar,
         EngineLocation: EngineLocation,
         nitro: Nitro,
         doorsType: DoorsType,
         transmission: Transmission,
         carColor: Color,
         trunk: Trunk,
         engineStatus: EngineStatus,
         doorsStatus: Status,
         trunkStatus: Status,
         centralLock: Status,
         horsePower: Int)
    {
        self.carName = carName
        self.typeOfSportCar = typeOfSportCar
        self.EngineLocation = EngineLocation
        self.nitro = nitro
        self.doorsType = doorsType
        self.transmission = transmission
        self.carColor = carColor
        self.trunk = trunk
        self.engineStatus = engineStatus
        self.doorsStatus = doorsStatus
        self.trunkStatus = trunkStatus
        self.centralLock = centralLock
        self.horsePower = horsePower
    }
    
}


var firstSportCar: SportCar = .init(carName: "C63 AMG", typeOfSportCar: .sportCar, EngineLocation: .forward, nitro: .no, doorsType: .standart, transmission: .auto, carColor: .black, trunk: .available, engineStatus: .works, doorsStatus: .closed, trunkStatus: .closed, centralLock: .opened, horsePower: 349)
print(firstSportCar)

firstSportCar.statusEngine(engineStatus: .works)

firstSportCar.printFullInformation()


 
