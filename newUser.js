function checkForm() {
    var firstname = $("firstname").value;
    var lastname = $("lastname").value;
    var password = $("password").value;
    var confirmPassword = $("confirmPassword").value;
    var username = $("username").value;
   
    var re = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$/; 
    if (firstname===""){
        $("firstname").style.backgroundColor="red";
    }else{
        $("firstname").removeAttribute("style");
    }
    if(lastname===""){
        $("lastname").style.backgroundColor="red";
    }
    else{
        $("lastname").removeAttribute("style");
    }
    if(username===""){
        $("username").style.backgroundColor="red";
    }else{
        $("username").removeAttribute("style");
    }
    if(password.length < 8|| re.exec(password)===null){
        $("password").style.backgroundColor="red";
    }else{
        $("password").removeAttribute("style");
    }
    if(confirmPassword==="" || confirmPassword!==password){
        $("retypePassword").style.backgroundColor="red";
    }else{
        $("retypePassword").removeAttribute("style");
    }
    if(firstname!==""&&lastname!==""&&username!==""&&password.length>7&&re.exec(password)!==null&&confirmPassword!==""&&confirmPassword===password){
        new Ajax.Request("newUser.php",
            {
                method: "GET",
                parameters: 'firstname='+firstname+'&lastname='+lastname+'&username='+username+'&password='+password,
                onSuccess: function handler(ajax){
                    document.open();
                    document.write(ajax.responseText);
                    document.close;
                }
            }
        );
    }
}

function defaultForm(){
    var textfields = document.getElementsByTagName("input");
    for (var i=0;i< textfields.length;i++){
        textfields[i].removeAttribute("style");
    }
}