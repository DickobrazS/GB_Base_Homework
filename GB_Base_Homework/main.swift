//
//  main.swift
//  GB_Base_Homework
//
//  Created by Тимофей Соломатин on 19.08.2023.
//

import Foundation


//class Parent {
//    var tall: Int
//    var male: String
//    var name: String
//    
//    init (tall: Int, male: String, name: String){
//        self.tall = tall
//        self.name = name
//        self.male = male
//    }
//}
//
//final class Son: Parent {
//    
//    func sonTall(tallOfParent: Int) -> Int {
//        return tallOfParent - 50
//    }
//}
//
//
//var son1 = Son(tall: 185, male: "female", name: "Billi")
//print (son1.sonTall(tallOfParent: 185))”

//MARK: Наследование
//class People {
//    let name = "челодек"
//    let surname = "обычкновенный"
//    var fullName: String {
//        return ("\(name) \(surname)")
//    }
//    
//    func printFullName(){
//        print (fullName)
//    }
//}
//
//class GrandFather: People {
//    override func printFullName() {
//        super.printFullName()
//        print ("а конкретней дедушка")
//    }
//}
//
//class Father: GrandFather {
//    override func printFullName() {
//        super.printFullName()
//        print (", у которого есть сын Антон")
//    }
//}
//
//class Son: Father {
//    override func printFullName() {
//        super.printFullName()
//        print (", а у него есть сын Виталий")
//    }
//}
//
//var son = Son()
//son.printFullName()


//MARK: HOMEWORK

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

enum DoorStatus: String {
    case open = "двери открыты"
    case close = "двери закрыты"
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
    case available = "багажник есть"
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


class Car {
    var name: String
    var color: Color
    var doorStatus: DoorStatus {
        willSet {
            print("теперь \(newValue.rawValue)")
        }
    }
    var engineStatus: EngineStatus {
        willSet {
            print("теперь \(newValue.rawValue)")
        }
    }
    
    func fullInformation (){
        print ("""
        Данные машины \(name):
        Цвет: \(color.rawValue)
        Статус дверей: \(doorStatus.rawValue)
        Статус двигателя: \(engineStatus.rawValue)
        """)
    }
    
    
    init (name: String, color: Color, doorStatus: DoorStatus, engineStatus: EngineStatus){
        self.name = name
        self.color = color
        self.doorStatus = doorStatus
        self.engineStatus = engineStatus
    }
}


final class SportCar: Car {
    let carType: TypeOfSportCar
    let horsePower: Int
    let aerodynamics: Double
    let doorType: DoorsType
    let engineLocation: EngineLocation
    let trunk: Trunk
    var nitro: Nitro {
        willSet{
            print ("теперь \(newValue.rawValue)")
        }
    }
    
    override func fullInformation() {
        super.fullInformation()
        print("""
        Тип машины: \(carType.rawValue)
        Кол-во л.с.: \(horsePower)
        Коэф. аэродинамики: \(aerodynamics)
        Тип дверей: \(doorType.rawValue)
        Расположение двигателя: \(engineLocation.rawValue)
        Наличие багажника: \(trunk.rawValue)
        Наличие Nitro: \(nitro.rawValue)
        
        """)
    }
    
    init (
        carType: TypeOfSportCar,
        horsePower: Int,
        aerodynamics: Double,
        doorType: DoorsType,
        engineLocation: EngineLocation,
        trunk: Trunk,
        nitro: Nitro){
        self.carType = carType
        self.horsePower = horsePower
        self.aerodynamics = aerodynamics
        self.doorType = doorType
        self.engineLocation = engineLocation
        self.trunk = trunk
        self.nitro = nitro
        super.init(name: "Дефолт",color: .black, doorStatus: .close, engineStatus: .turnedOff)
    }
}


final class TrunkCar: Car {
    let trunkVolume: Int
    var filledTrunkVolume: Int {
        willSet {
            print ("Теперь в багажнике заполнено \(newValue) литров. Осталось \(trunkVolume - newValue) литров")
        }
    }
    let trunkType: TrunkType
    
    override func fullInformation() {
        super.fullInformation()
        print("""
        Тип авто: \(trunkType.rawValue)
        Изначальный объем багажника: \(trunkVolume) литров
        Заполненный объем багажника: \(filledTrunkVolume) литров
        Сейчас свободно в багажнике: \(trunkVolume - filledTrunkVolume) литров
        
        """)
    }
    
    init(trunkVolume: Int, filledTrunkVolume: Int, trunkType: TrunkType) {
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
        self.trunkType = trunkType
        super.init(name: "Дефолт",color: .black, doorStatus: .close, engineStatus: .turnedOff)    }
    
}


var cls = SportCar(carType: .sportCar, horsePower: 1100, aerodynamics: 1.2, doorType: .swanWings, engineLocation: .back, trunk: .available, nitro: .yes)
cls.name = "cls"
cls.fullInformation()
cls.doorStatus = .open


var fiat = TrunkCar(trunkVolume: 1200, filledTrunkVolume: 478, trunkType: .lorry)
fiat.name = "Фиат"
fiat.fullInformation()
fiat.filledTrunkVolume = 321
fiat.engineStatus = .works







