package fa7tapiocadelivery

class Login {
    String username
    String password
    String email
    Boolean active = true
    static constraints = {
        username(unique:true)
        password(blank:false, unique:true)
        email(email:true)
    }
}
