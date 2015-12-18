




/*
OnlineOpinion v5.6.4
Released: 10/4/2012. Compiled 10/04/2012 11:28:22 AM -0500
Branch: master 4f693587716b7e98e287fda65b83b28cde6a3d5b
Components: Full
The following code is Copyright 1998-2012 Opinionlab, Inc.  All rights reserved. Unauthorized use is prohibited. This product and other products of OpinionLab, Inc. are protected by U.S. Patent No. 6606581, 6421724, 6785717 B1 and other patents pending. http://www.opinionlab
*/

    


/* [+] Tab Icon configuration */
yuiEvent.onDOMReady(function(){
  var oo_tab = new OOo.Ocode({
	  tab: { }
      , cookie: {
		  name: "oo_tab"
		, type: "page"
		, expiration: 3600
	  }
	  , disappearOnClick: false
	  , referrerRewrite: {
		  searchPattern: /:\/\/[^\/]*/
		, replacePattern: "://es-ES.www.starwoodhotels.com"
	  }
      /*
      ,customVariables: {
          propertyID: propertyID,
          screenResolution: screen.width + 'x' +screen.height
      }
      */
  });
});  
  