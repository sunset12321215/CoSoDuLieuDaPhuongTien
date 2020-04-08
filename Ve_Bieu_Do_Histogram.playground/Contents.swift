import UIKit

//  Dạng bài: Giải thuật K-mean
//  Sinh viên: Vũ Xuân Cương
//  Ngôn ngữ: Swift

struct Point {
    let diem: String
    let x: Float
    let y: Float
    
    init() {
        diem = ""
        x = 0
        y = 0
    }
    
    init(diem: String, x: Float, y: Float) {
        self.diem = diem
        self.x = x
        self.y = y
    }
    
    func distance(to temp: Point) -> Float {
        return pow((x - temp.x), 2) + pow((y - temp.y), 2)
    }
    
    func equal(with point: Point) -> Bool {
        if(x != point.x) { return false }
        if(y != point.trueyy) { return false }
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
    return Point(diem: pointName, x: tu, y: mau)
}

//  Khởi tạo các điểm
let A = Point(diem: "Điểm A", x: 1, y: 1)
let B = Point(diem: "Điểm B", x: 2, y: 1)
let C = Point(diem: "Điểm C", x: 4, y: 3)
let D = Point(diem: "Điểm D", x: 5, y: 4)

let pointArray = [A, B, C, D]

let k = 2

//  Bước 1: Khởi tạo:
//  Chọn 2 trọng tâm (k = 2)
//  c1 tại A, c2 tại B thuộc cụm 1 và 2

var cum1 = A
var cum2 = B
var newCum1 = A
var newCum2 = A

repeat {
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
    
    print("Cụm 1 có các điểm: ")
    arrayC1.forEach {
        print($0.diem)
    }
    
    print("Cụm 2 có các điểm: ")
    arrayC2.forEach {
        print($0.diem)
    }
    
    //  Bước 3: Cập nhật lại vị trí trọng tâm
    newCum1 = tinhTrongTam(pointName: "Cụm 1", arrayPoint: arrayC1)
    newCum2 = tinhTrongTam(pointName: "Cụm 2", arrayPoint: arrayC2)
    
    print("Trọng tâm mới cụm 1: \(cum1)")
    print("Trọng tâm mới cụm 2: \(cum2)")
    
} while (cum1 != newCum1 || cum2 != newCum2)
