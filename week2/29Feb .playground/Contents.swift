import UIKit

// alamofire -> kutuphane
// URLSession

let url = "https://gelecegiyazanlar.turkcell.com.tr"

let myURL = URL(string: url)

let handler: (Data?, URLResponse?, Error?) -> () = {data, response, error in
    print(String(data: data!, encoding: .utf8)!)
}

let task = URLSession.shared.dataTask(with: myURL!) { data, response , error in
    
    print(String(data: data!, encoding: .utf8)!)
}

task.resume()

let task2 = URLSession.shared.dataTask(with: myURL!, completionHandler: handler)


task2.resume()

// non-escaping , @escaping

// non-escaping: closures sadece kendi blogunda calisabilir, blok disinda calismaz
// non escaping kullaniyorsaniz compiler bu closure in kod blogu disinda calistirmak istenemdigini bilir.

// escaping: non escaping in tersi seklindedir. Baska bir yerde calistirmak istedigmiz zaman @escaping kullaniriz. Swift te @escaping olarak isaretlenmezse baska yerde cagirip kullanamazsiniz

/*
 ====>  ENUMS: ortak ozellikleri olan nesneleri toplamak icin kullanilir.
 */

enum Direction {
    case right
    case left
    case top
    case bottom
}
// bu sekildede tanimlanabilir.
enum Direction2 {
    case right, left , top, bottom
}

let rightside = Direction.right
let leftside = Direction.left

let bottomside: Direction = .bottom

enum Numbers: Int {
    case first = 1, second, third, forth, fifth
}


let besinci = Numbers.fifth

print(besinci.rawValue) // ekrana 5 yazdirir

enum Hata: Error {
    case sunucuHatasi(sebep: String)
    case kullaniciHatasi(sebep: String)
}

let hata = Hata.kullaniciHatasi(sebep: "Kullanici hatasi")

print(hata)

enum Cities: String {
    case Izmir = "Boyoz"
    case Hatay = "Kunefe"
    case Canakkale = "Peynir Helvasi"
    case Karabuk = "Lokum"
    case Malatya = "Kayisi"
    case Samsun = "Pide"
    case Tekirdag = "Kofte"
    case Erzurum = "Cag kebabi"
    case Bursa = "Sut helvasi"
}

let city = Cities.Tekirdag
print(city.rawValue)

func move(direction: Direction) {
    print("oyuncu \(direction) yonunde hareket etti")
}

move(direction: .right)

let direct: Direction = .right

switch direct {
case .right:
    print("rigth")
case .left:
    print("left")
case .top:
    print("top")
case .bottom:
    print("bottom")
}

enum Orchestra {
    enum Strings {
        case guitar
        case baglama
    }
    
    enum keyboards {
        case piano
        case org
    }
    
    enum Percussion {
        case drum
        case bell
    }
}

let inst1 = Orchestra.keyboards.piano
// gibi gibi


// Optionals
// Backend e asla guvenme, degiskenlere optional tanimla

var number: Int?
number = 5
print(number ?? 0)

// if let kullanimi
if let number { // number != nil islevi gorur burasi onemliiiiii
    print("number: \(number)")
} else {
    print("number was not assigned a value")
}


var sehir: String?
sehir = "Ankara"

if let sehir {
    print("My city \(sehir)")
}


// --------------------  STRUCTS  ---------------------

struct Member {
    var name: String?
    var email: String?
    var password: String?
}

var member = Member(name: "yigit", email: "yigit@gmail.com", password: nil)

func getMember(member: Member) {
    
    if let name = member.name, let email = member.email, let password = member.password {
        print(name)
        print(email)
        print(password)
    } else {
        print("veriler okunamadi")
    }
}

getMember(member: member)

// Guard let .... else { ... }
// hatayi once yakalamak icin kullaniyor.
func uyeGetir(uye: Member) {
    guard let name = uye.name, let email = uye.email, let password = member.password else {
        print("veriler okunamadi")
        return
    }
    
    print(name)
    print(email)
    print(password)
    
}

let uye = Member(name: "zeynep", email: "zeynepgmail", password: nil)

uyeGetir(uye: uye)


// ------------------ ERROR HANDLING --------------------

// try, try?, try!

enum NameValidator: Error {
    case tooLong
    case tooShort
}

func nameValidation(name: String) throws -> String {
    if name.count > 8 {
        throw NameValidator.tooLong
    } else if name.count < 2 {
        throw NameValidator.tooShort
    } else {
        print(name)
        return name
    }
}

//try nameValidation(name: "Cem")

// try: Hata varsa ben onu yakalarim, Do try catch yapisini severim.

do {
    try nameValidation(name: "Zeynep Ozcan")
} catch NameValidator.tooLong {
    print("name is too long")
} catch NameValidator.tooShort {
    print("Name is very short")
}

// try?: Hatasiz kul olmaz, Do catch kullanmaya ihtiyacim yok

if let isim = try? nameValidation(name: "Songul") {
    print("Name is valid: \(isim)")
} else {
    print("name is invalid")
}

//try!: Ben hatalari hic sevmem hata yakalarsam BOZULURUM :)
// Do or Die yaklasimiyla hata yakalar

let result = try! nameValidation(name: "oguzhan")

// Homework 1  bir firmanin ise alim sirasinda gonderdigi sorular bunlar almanya firmasi
/*
 Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yaınız.
 Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır
 */

/*
 Homework 2
 Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz.
 Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 olmalıdır
 */











































