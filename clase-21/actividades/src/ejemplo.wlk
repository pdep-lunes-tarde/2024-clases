
class A {
    method m() {
        return 100
    }
}

class B inherits A {
    override method m() {
        return super() / 2
    }
}