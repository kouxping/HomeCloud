// JavaScript Document

function reg(){
	if(document.form.password.value!=document.form.rpassword.value){
		alert("Please make sure you type in the same password two times");
		return false;
	}
	return true;
}
