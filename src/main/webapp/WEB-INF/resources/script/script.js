function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.nick.value) {
            alert("사용자 닉네임을 입력하세요");
            return false;
        }
        
        
        if(!userinput.email.value) {
            alert("이메일을 입력하세요");
            return false;
        }
        
       
        if(!userinput.password.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        
        if(userinput.password.value != userinput.confirmPassword.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
        
        
        if(!userinput.phone.value ) {
            alert("핸드폰 번호를 입력하세요");
            return false;
        
        }
      
    }



/*function writeSave(){
if(document.writeform.writer.value==""){
  alert("작성자를 입력하십시요.");
  document.writeform.writer.focus();
  return false;
}
if(document.writeform.subject.value==""){
  alert("제목을 입력하십시요.");
  document.writeform.subject.focus();
  return false;
}

if(document.writeform.content.value==""){
  alert("내용을 입력하십시요.");
  document.writeform.content.focus();
  return false;
}
       
if(document.writeform.passwd.value==""){
  alert(" 비밀번호를 입력하십시요.");
  document.writeform.passwd.focus();
  return false;
}
}   */

function editCheckIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.nick.value) {
            alert("사용자 닉네임을 입력하세요");
            return false;
        }
        
        
        if(!userinput.email.value) {
            alert("이메일을 입력하세요");
            return false;
        }
        
       
        if(!userinput.password.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        
        if(userinput.password.value != userinput.confirmPassword.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
        
        
        if(!userinput.phone.value ) {
            alert("핸드폰 번호를 입력하세요");
            return false;
        
        }
      
    }


