function subscribecheckfun()
{ with(window.document.subscribe)
{
	if(subemail.value=="" || subemail.value=="Your Email Address")
	{ 
		var a ="Please Enter Email Address";
		document.getElementById('subscribe_error').innerHTML=a;
		subemail.focus(); return false;
	}
	var evtemailpattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/;  
	if(evtemailpattern.test(subemail.value)==false)
	{	
		var b ="Please Enter Valid Email Address";
		document.getElementById('subscribe_error').innerHTML=b;
		subemail.focus(); return false;
	}
	
}
}