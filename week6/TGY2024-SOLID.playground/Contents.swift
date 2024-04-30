import UIKit

var greeting = "Hello, playground"

var str = "Solid"

// Single Responsibility Principle -> Tek Sorumluluk Prensibi
// Open/closed Principle -> Acik/Kapali Prensibi (Gelisime Acik, Degisime Kapali)
// Liskov substitution -> Liskov Yerine Gecme Prensibi
// Interface segragation -> Arayuz Ayirma Prensibi
// Dependency Inversion -> Bagimliliklari tersine cevirme


// Single Responsibility

class Membership {
    func delete() {}
    func register() {}
    func update() {}
}

class LoginSevice {
    func login() {}
    func logout() {}
}

class SmsService {
    func sendSms() {}
}

// bunu yapmayin yukaridaki gibi ayirabildigin kadar ayirman gerekiyor
class UserOperations {
    func delete() {}
    func register() {}
    func update() {}
    func login() {}
    func logout() {}
    func sendSms() {}
}


// Open - Closed

/* boyle yapmayin
 
class Draw {
    func circle() {}
    func rectangle() {}
}
 
*/

protocol Shape {
    func draw()
}

class Circle: Shape {
    func draw() {
        print("circle is drawed")
    }
}

class Rectangle: Shape {
    func draw() {
        print("regtaangle is drawed")
    }
}

class Draw {
    func drawShape(shape: Shape) {
        shape.draw()
    }
}

let draw = Draw()
let circle = Circle()
let regtagle = Rectangle()

draw.drawShape(shape: circle)
draw.drawShape(shape: regtagle)


// Liskov Prensibi

protocol DBService {
    func connect()
    func query()
}

class SQLService: DBService {
    func connect() {
        print("Connect SQL")
    }
    
    func query() {
        print("Select * from users")

    }
}

class OracleService: DBService {
    func connect() {
        print("Connected Oracle service")
    }
    func query() {
        print("select * from comments")
    }
}

class Connection {
    func connect(with service: DBService) {
        service.connect()
    }
}

let sqlservice = SQLService()
let oracleService = OracleService()
let connection = Connection()

connection.connect(with: sqlservice)
connection.connect(with: oracleService)

// Arayuz Ayirma Prensibi

/* once yanlis bir ornek yapacagiz

protocol LivingSpecifications {
    func breath()
    func eat()
    func run()
    func fly()
}

class Birds: LivingSpecifications {
    func breath() {
        print("i can")
    }
    
    func eat() {
        print("i can")
    }
    
    func run() {
        print("i can")
    }
    
    func fly() {
        print("i can")
    }
    
}

class Human: LivingSpecifications {
    func breath() {
        print("i can")
    }
    
    func eat() {
        print("i can")
    }
    
    func run() {
        print("i can")
    }
    
    func fly() {
        print("i can not")
    }
}

*/


protocol LivingSpecifications {
    func breath()
    func eat()
}

protocol FlySpecification {
    func fly()
}

protocol SprintingSpecifications {
    func run()
}

class Birds: LivingSpecifications, SprintingSpecifications, FlySpecification {
    func breath() {
        print("i can")
    }
    
    func eat() {
        print("i can")
    }
    
    func run() {
        print("i can")
    }
    
    func fly() {
        print("i can")
    }
    
}

class Human: LivingSpecifications, SprintingSpecifications {
    func breath() {
        print("i can")
    }
    
    func eat() {
        print("i can")
    }
    
    func run() {
        print("i can")
    }
}



// Dependency Inversion - Bagimliliklari tersine cevirme


// burada ust seviye sinif alt seviye siniflarra bagimli oldugu icin bunu istemiyoruz
// bunu cozmek icin protocol kullanacagiz
/*
 class FileLogger {
     func log() {}
 }
 class DBLogger {
     func log() {}
 }
 
 class LogManager {
 var fileLogger: FileLogger!
 var dbLogger: DBLogger!
 
 
 public init(fileLogger: FileLogger!, dbLogger: DBLogger!) {
 self.fileLogger = fileLogger
 self.dbLogger = dbLogger
 }
 
 func log() {
 fileLogger.log()
 dbLogger.log()
 }
 }
 
 */

protocol Logger {
    func log()
}

class FileLogger: Logger {
    func log() {}
}

class DBLogger: Logger {
    func log() {}
}

class LogManager {
    
    var logger: Logger!
    
    init(logger: Logger!) {
        self.logger = logger
    }
    
    func log() {
        logger.log()
    }
}


let dbLogger = DBLogger()
let fileLogger = FileManager()

let logManager = LogManager(logger: dbLogger)
logManager.log()

// -----------------------
/* weak & unowned arasindaki fark nedir mulakat sorusu?

 unowned nil olamaz crash olur
*/

protocol SwiftDelegete: AnyObject { }

weak var delegete: (SwiftDelegete)?

class Bmw {
    // bunlardan birinde weak kullanmassak retain cycle olusturmus oluyorum ve memeryde bunlar siki tutuluyor bunu istemiyoruz.
    weak var araba: Araba?
    
    deinit {
        print("Deallocation Araba")
    }
}

class Araba {
    var bmw: Bmw?
    
    deinit {
        print("Deallocation Araba")
    }
}


// burais onemli mulakatlarda sorulabilir 
/*
 Closure
 
 { [ weak self] (data, response, error)
 
 }
 */
// notification center // observar i kaldirma
// memory leak detect? Xcode instruments
// memory leak icin unit test yazilabilir

