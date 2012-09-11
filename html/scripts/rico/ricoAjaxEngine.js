//-------------------- ricoAjaxEngine.js

Rico.AjaxEngine = Class.create();

Rico.AjaxEngine.prototype = {

   initialize: function() {
      this.ajaxElements = new Array();
      this.ajaxObjects  = new Array();
      this.requestURLS  = new Array();
   },

   registerAjaxElement: function( anId, anElement ) {
      if ( arguments.length == 1 )
         anElement = $(anId);
      this.ajaxElements[anId] = anElement;
   },

   registerAjaxObject: function( anId, anObject ) {
      this.ajaxObjects[anId] = anObject;
   },

   registerRequest: function (requestLogicalName, requestURL) {
      this.requestURLS[requestLogicalName] = requestURL;
   },

   sendRequest: function(requestName) {
      var requestURL = this.requestURLS[requestName];
      if ( requestURL == null )
         return;

      var queryString = "";
      if ( arguments.length > 1 )
         queryString = this._createQueryString(arguments, 1);

      new Ajax.Request(requestURL, this._requestOptions(queryString));
   },

   sendRequestWithData: function(requestName, xmlDocument) {
      var requestURL = this.requestURLS[requestName];
      if ( requestURL == null )
         return;

      var queryString = "";
      if ( arguments.length > 2 )
         queryString = this._createQueryString(arguments, 2);

      new Ajax.Request(requestURL + "?" + queryString, this._requestOptions(null,xmlDocument));
   },

   sendRequestAndUpdate: function(requestName,container,options) {
      var requestURL = this.requestURLS[requestName];
      if ( requestURL == null )
         return;

      var queryString = "";
      if ( arguments.length > 3 )
         queryString = this._createQueryString(arguments, 3);

      var updaterOptions = this._requestOptions(queryString);
      updaterOptions.onComplete = null;
      updaterOptions.extend(options);

      new Ajax.Updater(container, requestURL, updaterOptions);
   },

   sendRequestWithDataAndUpdate: function(requestName,xmlDocument,container,options) {
      var requestURL = this.requestURLS[requestName];
      if ( requestURL == null )
         return;

      var queryString = "";
      if ( arguments.length > 4 )
         queryString = this._createQueryString(arguments, 4);


      var updaterOptions = this._requestOptions(queryString,xmlDocument);
      updaterOptions.onComplete = null;
      updaterOptions.extend(options);

      new Ajax.Updater(container, requestURL + "?" + queryString, updaterOptions);
   },

   // Private -- not part of intended engine API --------------------------------------------------------------------

   _requestOptions: function(queryString,xmlDoc) {
      var self = this;

      var requestHeaders = ['X-Rico-Version', Rico.Version ];
      var sendMethod = "post"
      if ( arguments[1] )
         requestHeaders.push( 'Content-type', 'text/xml' );
      else
         sendMethod = "get";

      return { requestHeaders: requestHeaders,
               parameters:     queryString,
               postBody:       arguments[1] ? xmlDoc : null,
               method:         sendMethod,
               onComplete:     self._onRequestComplete.bind(self) };
   },

   _createQueryString: function( theArgs, offset ) {
      var queryString = ""
      for ( var i = offset ; i < theArgs.length ; i++ ) {
          if ( i != offset )
            queryString += "&";

          var anArg = theArgs[i];

          if ( anArg.name != undefined && anArg.value != undefined ) {
            queryString += anArg.name +  "=" + escape(anArg.value);
          }
          else {
             var ePos  = anArg.indexOf('=');
             var argName  = anArg.substring( 0, ePos );
             var argValue = anArg.substring( ePos + 1 );
             queryString += argName + "=" + escape(argValue);
          }
      }

      return queryString;
   },

   _onRequestComplete : function(request) {

      //!!TODO: error handling infrastructure?? 
      if (request.status != 200)
        return;

      var response = request.responseXML.getElementsByTagName("ajax-response");
      if (response == null || response.length != 1)
         return;
      this._processAjaxResponse( response[0].childNodes );
   },

   _processAjaxResponse: function( xmlResponseElements ) {
      for ( var i = 0 ; i < xmlResponseElements.length ; i++ ) {
         var responseElement = xmlResponseElements[i];

         // only process nodes of type element.....
         if ( responseElement.nodeType != 1 )
            continue;

         var responseType = responseElement.getAttribute("type");
         var responseId   = responseElement.getAttribute("id");

         if ( responseType == "object" )
            this._processAjaxObjectUpdate( this.ajaxObjects[ responseId ], responseElement );
         else if ( responseType == "element" )
            this._processAjaxElementUpdate( this.ajaxElements[ responseId ], responseElement );
         else
            alert('unrecognized AjaxResponse type : ' + responseType );
      }
   },

   _processAjaxObjectUpdate: function( ajaxObject, responseElement ) {
      ajaxObject.ajaxUpdate( responseElement );
   },

   _processAjaxElementUpdate: function( ajaxElement, responseElement ) {
      ajaxElement.innerHTML = RicoUtil.getContentAsString(responseElement);
   }

}

var ajaxEngine = new Rico.AjaxEngine();