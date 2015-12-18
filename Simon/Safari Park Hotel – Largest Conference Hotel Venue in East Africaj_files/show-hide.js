function show1(i,tnumber)
{

document.getElementById("showhidef"+i).style.display='block';

document.getElementById("show"+i).style.display='none';

document.getElementById("show"+(i+1)).style.display='block';
//define value for k<=max_showhide_div_number
for(var k=1;k<tnumber;k=k+2){
	if(k==i){
				
	}else{
		document.getElementById('showhidef'+k).style.display='none';
	}
		
	}
	
var flag=1;
//define value for j<=max_showhide_div_number
	for(var j=1;j<tnumber;j=j+2){
	
	if(j!=i){
		if(flag==1){
		document.getElementById("show"+(j+1)).style.display='none';
			document.getElementById("show"+j).style.display='block';
			flag=0;
		}else{
		document.getElementById("show"+j).style.display='block';
		document.getElementById("show"+(j+1)).style.display='none';
		}
		
	}
	}
}

function show2(i)
{

document.getElementById("showhidef"+i).style.display='none';

document.getElementById("show"+i).style.display='block';

document.getElementById("show"+(i+1)).style.display='none';

}

