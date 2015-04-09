package webshop

class Newsletter {

    String title
    String content
    Date dateSendMail

    static hasMany = [users : User]

    static mapping = {
        users cascade: "all"
    }

    static constraints = {
        content(maxSize : 1200, nullable: false)
        users(nullable: false)
    }
}
