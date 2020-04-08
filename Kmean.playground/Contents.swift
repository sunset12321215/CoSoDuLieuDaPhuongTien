import UIKit

//  Dạng bài: Giải thuật K-mean
//  Sinh viên: Vũ Xuân Cương
//  Ngôn ngữ: Swift

struct Point {
    let name: String
    let x: Float
    let y: Float
    
    init() {
        name = ""
        x = 0
        y = 0
    }
    
    init(name: String, x: Float, y: Float) {
        self.name = name
        self.x = x
        self.y = y
    }
    
    func distance(to temp: Point) -> Float {
        return pow((x - temp.x), 2) + pow((y - temp.y), 2)
    }
    
    func equal(with point: Point) -> Bool {
        if(x != point.x) { return false }
        if(y != point.y) { return false }
        return true
    }
}

func tinhTrongTam(pointName: String, arrayPoint: [Point]) -> Point {
    let numberOfPoint = Float(arrayPoint.count)
    var tu: Float = 0
    var mau: Float = 0
    arrayPoint.forEach {
        tu += $0.x
        mau += $0.y
    }
    tu /= numberOfPoint;    mau /= numberOfPoint
    return Point(name: pointName, x: tu, y: mau)
}

//  Khởi tạo các điểm

//  Bài trên Slide
//let A = Point(name: "Điểm A", x: 1, y: 1)
//let B = Point(name: "Điểm B", x: 2, y: 1)
//let C = Point(name: "Điểm C", x: 4, y: 3)
//let D = Point(name: "Điểm D", x: 5, y: 4)
//let pointArray = [A, B, C, D]

//  Bài 1
//let A = Point(name: "Điểm A", x: 4, y: 1)
//let B = Point(name: "Điểm B", x: 5, y: 1)
//let C = Point(name: "Điểm C", x: 5, y: 2)
//let D = Point(name: "Điểm D", x: 1, y: 4)
//let E = Point(name: "Điểm E", x: 1, y: 5)
//let pointArray = [A, B, C, D, E]

//  Bài 2
//let A = Point(name: "Điểm A", x: 4, y: 1)
//let B = Point(name: "Điểm B", x: 5, y: 1)
//let C = Point(name: "Điểm C", x: 5, y: 2)
//let D = Point(name: "Điểm D", x: 1, y: 4)
//let E = Point(name: "Điểm E", x: 1, y: 5)
//let F = Point(name: "Điểm D", x: 2, y: 4)
//let G = Point(name: "Điểm E", x: 2, y: 5)
//let pointArray = [A, B, C, D, E, F, G]

//  Bài 4
let A = Point(name: "Điểm A", x: 5, y: 2)
let B = Point(name: "Điểm B", x: 1, y: 4)
let C = Point(name: "Điểm C", x: 3, y: 2)
let D = Point(name: "Điểm D", x: 1, y: 5)
let E = Point(name: "Điểm E", x: 2, y: 6)
let pointArray = [A, B, C, D, E]


let k = 2

//  Bước 1: Khởi tạo:
//  Chọn 2 trọng tâm (k = 2)
//  c1 tại A, c2 tại B thuộc cụm 1 và 2
var cum1 = A
var cum2 = B
var newCum1 = Point()
var newCum2 = Point()
var notChange = true

var lap = 1

print("-------  Kết quả  --------")
print("k = \(k) => \(k) cụm")
while notChange {
    print("\n\nLặp lần \(lap): -------------")
    var arrayC1 = [Point]()
    var arrayC2 = [Point]()
    
    //  Bước 2: Tính khoảng cách
    pointArray.forEach {
        let point = $0
        let pointToCum1 = cum1.distance(to: point)
        let pointToCum2 = cum2.distance(to: point)
        if pointToCum1 < pointToCum2 {
            arrayC1.append(point)
        } else {
            arrayC2.append(point)
        }
    }
    
    print("\tCụm 1 có các điểm: ")
    arrayC1.forEach {
        print("\t", $0.name)
    }
    
    print("\tCụm 2 có các điểm: ")
    arrayC2.forEach {
        print("\t", $0.name)
    }
    
    //  Bước 3: Cập nhật lại vị trí trọng tâm
    newCum1 = tinhTrongTam(pointName: "Cụm 1", arrayPoint: arrayC1)
    newCum2 = tinhTrongTam(pointName: "Cụm 2", arrayPoint: arrayC2)
    
    if cum1.equal(with: newCum1) && cum2.equal(with: newCum2) {
        notChange = false
    }

    if !cum1.equal(with: newCum1) {
        cum1 = newCum1
    }
    
    if !cum2.equal(with: newCum2) {
        cum2 = newCum2
    }
    
    print("\nTrọng tâm mới cụm 1: \(newCum1)")
    print("Trọng tâm mới cụm 2: \(newCum2)")

    lap += 1
}
