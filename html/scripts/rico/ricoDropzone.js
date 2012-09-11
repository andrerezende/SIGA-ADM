//-------------------- ricoDropzone.js
Rico.Dropzone = Class.create();

Rico.Dropzone.prototype = {

   initialize: function( htmlElement ) {
      this.htmlElement  = $(htmlElement);
      this.absoluteRect = null;
   },

   getHTMLElement: function() {
      return this.htmlElement;
   },

   clearPositionCache: function() {
      this.absoluteRect = null;
   },

   getAbsoluteRect: function() {
      if ( this.absoluteRect == null ) {
         var htmlElement = this.getHTMLElement();
         var pos = RicoUtil.toViewportPosition(htmlElement);

         this.absoluteRect = {
            top:    pos.y,
            left:   pos.x,
            bottom: pos.y + htmlElement.offsetHeight,
            right:  pos.x + htmlElement.offsetWidth
         };
      }
      return this.absoluteRect;
   },

   activate: function() {
      var htmlElement = this.getHTMLElement();
      if (htmlElement == null  || this.showingActive)
         return;

      this.showingActive = true;
      this.saveBackgroundColor = htmlElement.style.backgroundColor;

      var fallbackColor = "#ffea84";
      var currentColor = Rico.Color.createColorFromBackground(htmlElement);
      if ( currentColor == null )
         htmlElement.style.backgroundColor = fallbackColor;
      else {
         currentColor.isBright() ? currentColor.darken(0.2) : currentColor.brighten(0.2);
         htmlElement.style.backgroundColor = currentColor.asHex();
      }
   },

   deactivate: function() {
      var htmlElement = this.getHTMLElement();
      if (htmlElement == null || !this.showingActive)
         return;

      htmlElement.style.backgroundColor = this.saveBackgroundColor;
      this.showingActive = false;
      this.saveBackgroundColor = null;
   },

   showHover: function() {
      var htmlElement = this.getHTMLElement();
      if ( htmlElement == null || this.showingHover )
         return;

      this.saveBorderWidth = htmlElement.style.borderWidth;
      this.saveBorderStyle = htmlElement.style.borderStyle;
      this.saveBorderColor = htmlElement.style.borderColor;

      this.showingHover = true;
      htmlElement.style.borderWidth = "1px";
      htmlElement.style.borderStyle = "solid";
      //htmlElement.style.borderColor = "#ff9900";
      htmlElement.style.borderColor = "#ffff00";
   },

   hideHover: function() {
      var htmlElement = this.getHTMLElement();
      if ( htmlElement == null || !this.showingHover )
         return;

      htmlElement.style.borderWidth = this.saveBorderWidth;
      htmlElement.style.borderStyle = this.saveBorderStyle;
      htmlElement.style.borderColor = this.saveBorderColor;
      this.showingHover = false;
   },

   canAccept: function(draggableObjects) {
      return true;
   },

   accept: function(draggableObjects) {
      var htmlElement = this.getHTMLElement();
      if ( htmlElement == null )
         return;

      n = draggableObjects.length;
      for ( var i = 0 ; i < n ; i++ )
      {
         var theGUI = draggableObjects[i].getDroppedGUI();
         if ( RicoUtil.getElementsComputedStyle( theGUI, "position" ) == "absolute" )
         {
            theGUI.style.position = "static";
            theGUI.style.top = "";
            theGUI.style.top = "";
         }
         htmlElement.appendChild(theGUI);
      }
   }
}
