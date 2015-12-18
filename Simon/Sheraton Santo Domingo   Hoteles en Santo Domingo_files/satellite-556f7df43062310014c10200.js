//check for element and block if found
if($( "#greetingContainer" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "#greetingContainer" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "#greetingContainer" );
}

if($( ".sendConfirmationSection" ).length > 0) {
  //Send Confirmation popup box
  $( "<!--fsrHiddenBlockStart-->").insertBefore( ".sendConfirmationSection" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( ".sendConfirmationSection" );
}

if(location.pathname.indexOf('/reservations/review/details.html') !== -1 ) {
  //Room Guest for multiple room booking
  if($( ".guestRoom" ).length > 0) {
  	$( "<!--fsrHiddenBlockStart-->").insertBefore( ".guestRoom" );
  	$( "<!--fsrHiddenBlockEnd-->").insertAfter( ".guestRoom" );
  }
  if( $( "#personInfoSection" ).length > 0 ) {
    //Personal And Credit Card Informatin box, if available
 		$( "<!--fsrHiddenBlockStart-->").insertBefore( "#personInfoSection" );
  	$( "<!--fsrHiddenBlockEnd-->").insertAfter( "#personInfoSection" );
  }
}

if(location.pathname.indexOf('/account/profile/index.html') !== -1 && $( ".receivingEmailSection .formField" ).length > 0) {
  //email section
  $( "<!--fsrHiddenBlockStart-->").insertBefore( ".receivingEmailSection .formField" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( ".receivingEmailSection .formField" );
}

/////new header nav starting with Sheraton
//user name in dropdown
if($( "#SubNavPanelWrapper .memberName" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "#SubNavPanelWrapper .memberName" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "#SubNavPanelWrapper .memberName" );
}
//starpoint
if($( "#SubNavPanelWrapper .starpoints" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "#SubNavPanelWrapper .starpoints" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "#SubNavPanelWrapper .starpoints" );
}
//sign in fields
if($( "#SubNavPanelWrapper #signIn" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "#SubNavPanelWrapper #signIn" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "#SubNavPanelWrapper #signIn" );
}
//user name in header
if($( "#ManageNavLink\\}" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "#ManageNavLink\\}" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "#ManageNavLink\\}" );
}

//AMEX signup
if(location.pathname.indexOf('/reservations/booking/verify') !== -1 ) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( "body" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( "body" );
}

//SPG Header dropdown Signed-In
if($( ".memberName" ).length > 0) {
  $( "<!--fsrHiddenBlockStart-->").insertBefore( ".memberName" );
  $( "<!--fsrHiddenBlockEnd-->").insertAfter( ".memberName" );
}
