import UIKit
import Foundation

// --------------- Murat Albayrak ----------------
// 2 PARAMETRELI VE FARKLI TIPLI BIR GENERIC ORNEGI YAPINIZ


func myFunc<T, U>(par1: T, par2: U) {
    print("Item 1: \(par1), Item 2: \(par2)")
}

myFunc(par1: 10, par2: "murat")

