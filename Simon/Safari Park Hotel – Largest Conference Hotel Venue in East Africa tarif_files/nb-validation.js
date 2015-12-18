
  function nightsbridge() {

    if (!ValidateDate()) {
      return false;
    }

    var n = document.fm_nightsbridge;

    n.startdate.value = document.getElementById('arrivalYear').value + "-" + document.getElementById('arrivalMonth').value + "-" + document.getElementById('arrivalDay').value;
    n.enddate.value = document.getElementById('departureYear').value + "-" + document.getElementById('departureMonth').value + "-" + document.getElementById('departureDay').value;
    n.submit();

  }
function ValidateDate()    {  
  var SDate = new Date(document.getElementById('arrivalYear').value + "/" + document.getElementById('arrivalMonth').value + "/" + document.getElementById('arrivalDay').value);    
  var EDate = new Date(document.getElementById('departureYear').value + "/" + document.getElementById('departureMonth').value + "/" + document.getElementById('departureDay').value);
  var today = new Date();

  var alertReason1 =  'Departure Day must be after the Arrival Day.'    
  var alertReason2 =  'Arrival Day must be after the Current Date.';      
  var alertReason3 =  'Departure Day must be after the Current Date.';      
  
  if(SDate>=EDate)    {     
    alert(alertReason1);     
    return false;   
  } else if(SDate<=today ){
    alert(alertReason2);        
    return false;    
  }else if(EDate<today ){        
    alert(alertReason3);        
    return false;    
  }

  return true;
}
