
function initStorage(){
	function saveName(){
		var name = document.getElementById('name');
		localStorage.setItem('name',name.value);
	}
	
	function saveEmail(){
		var email = document.getElementById('email');
		localStorage.setItem('email',email.value);
	}
	
	//Run functions
	saveName();
	saveEmail();
    console.log("Stored name and email")
}

function displayName(){	
	if(localStorage.getItem('name') != null){
		document.write('Welcome Back, '+localStorage.getItem('name'));
	}
}
	
function showText(){
	if(localStorage.getItem('email') == null){
		document.write('<p>Please enter your email address</p>');
	} else {
		document.write('<p><strong>Subscribed Email:</strong> '+localStorage.getItem('email')+'</p> ');
	}
}

function clearAll(){
	localStorage.clear();   
	window.location.reload();
    
}