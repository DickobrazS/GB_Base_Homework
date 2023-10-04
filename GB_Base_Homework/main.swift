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
    var windowsStatus: Status { get set }

    func printFullInformation()
    mutating func statusEngine (engineStatus: EngineStatus)
    mutating func statusCentralLock (centralLock: Status)
}


extension Car {
    
    
    
    
   mutating func statusEngine (engineStatus: EngineStatus) {
        self.engineStatus = engineStatus
        switch engineStatus{
        case.turnedOff: print ("Теперь \(engineStatus.rawValue)")
        case.works: print ("Теперь \(engineStatus.rawValue)")
        }
    }
    
    mutating func statusCentralLock (centralLock: Status) {
        self.centralLock = centralLock
        switch centralLock {
        case.closed: print ("Центральный замок \(centralLock.rawValue)")
        case.opened: print ("Центральный замок \(centralLock.rawValue)")
        }
    }
    
    mutating func statusWindows (windowsStatus: Status) {
        self.windowsStatus = windowsStatus
        switch windowsStatus {
        case .closed: print ("Теперь окна \(windowsStatus.rawValue)ы")
        case.opened: print ("Теперь окна \(windowsStatus.rawValue)ы")
        }
    }
    
    
    func printFullInformation() {
        print ("""
        
        Название машины: \(carName)
        Количество лошадинных сил: \(horsePower)
        Цвет машины: \(carColor.rawValue)
        В машине \(trunk.rawValue)
        Статус двигателя: \(engineStatus.rawValue)
        Окна \(windowsStatus.rawValue)ы
        Замок дверей: \(doorsStatus.rawValue)
        Замок багажника: \(trunkStatus.rawValue)
        Центральный замок: \(centralLock.rawValue)
""")
    }
}


//MARK: Classes

final class SportCar: Car, CustomStringConvertible {
    

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
    var windowsStatus: Status
    var centralLock: Status
    var horsePower: Int
    
    var description: String {
        return ("""
Краткая информация по спорткару \(carName):
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
         windowsStatus: Status,
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
        self.windowsStatus = windowsStatus
        self.centralLock = centralLock
        self.horsePower = horsePower
    }
    
}



final class TrunkCar: Car, CustomStringConvertible {
    var carName: String
    var carColor: Color
    var trunk: Trunk = .available
    var trunkType: TrunkType
    var trunkVolume: Int
    var filledTrunkVolume: Int {
        willSet {
            print ("Теперь в машине \(carName) загружено \(newValue) литров. Осталось свободно \(trunkVolume - newValue)")
        }
    }
    var engineStatus: EngineStatus
    var doorsStatus: Status
    var trunkStatus: Status
    var centralLock: Status
    var horsePower: Int
    var windowsStatus: Status
    var description: String {
        return ("""
Краткая информация по грузовику \(carName):
Цвет грузовика \(carColor)
Тип: \(trunkType)
Статус двигателя \(engineStatus)

Если вам нужна полная информация, вызовите функцию printFullInformation

""")
    }
    
    
    
    func printFullTrunkInformation() {
        printFullInformation()
        print ("""
        Тип грузовика: \(trunkType)
        Объем багажного отделения: \(trunkVolume)
        Объем занятого багажного отделения: \(filledTrunkVolume)
        Объем совбодного багажного отделения: \(trunkVolume - filledTrunkVolume)
""")
        
    }
    
    
    init(carName: String,
         carColor: Color,
         trunk: Trunk,
         trunkType: TrunkType,
         trunkVolume: Int,
         filledTrunkVolume: Int,
         engineStatus: EngineStatus,
         doorsStatus: Status,
         trunkStatus: Status,
         centralLock: Status,
         horsePower: Int,
         windowsStatus: Status)
    {
        self.carName = carName
        self.carColor = carColor
        self.trunk = trunk
        self.trunkType = trunkType
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.engineStatus = engineStatus
        self.trunkStatus = trunkStatus
        self.doorsStatus = doorsStatus
        self.trunkStatus = trunkStatus
        self.centralLock = centralLock
        self.horsePower = horsePower
        self.windowsStatus = windowsStatus
    }
    
    
}

//MARK: Implementation


var firstSportCar: SportCar = .init(carName: "C63 AMG", typeOfSportCar: .sportCar, EngineLocation: .forward, nitro: .no, doorsType: .standart, transmission: .auto, carColor: .black, trunk: .available, engineStatus: .works, doorsStatus: .closed, trunkStatus: .closed, windowsStatus: .closed, centralLock: .opened, horsePower: 349)

print(firstSportCar)

firstSportCar.statusEngine(engineStatus: .works)
firstSportCar.statusCentralLock(centralLock: .closed)
firstSportCar.statusWindows(windowsStatus: .opened)


firstSportCar.printFullInformation()

var firstTrunkCar: TrunkCar = .init(carName: "Volvo", carColor: .black, trunk: .available, trunkType: .lorry, trunkVolume: 1500, filledTrunkVolume: 600, engineStatus: .turnedOff, doorsStatus: .closed, trunkStatus: .closed, centralLock: .closed, horsePower: 500, windowsStatus: .closed)

firstTrunkCar.printFullTrunkInformation()

firstTrunkCar.filledTrunkVolume = 980


 
