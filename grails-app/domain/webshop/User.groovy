package webshop

class User {

    String name
    String email
    Boolean newsletter


    static constraints = {
        email(email: true, unique: true)
    }

    String toString(){
        name + " - " + email
    }
}
