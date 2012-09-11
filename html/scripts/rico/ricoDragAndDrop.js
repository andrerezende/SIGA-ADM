//-------------------- ricoDragAndDrop.js
Rico.DragAndDrop = Class.create();

Rico.DragAndDrop.prototype = {

   initialize: function() {
      this.dropZones                = new Array();
      this.draggables               = new Array();
      this.currentDragObjects       = new Array();
      this.dragElement              = null;
      this.lastSelectedDraggable    = null;
      this.currentDragObjectVisible = false;
      this.interestedInMotionEvents = false;
   },

   registerDropZone: function(aDropZone) {
      this.dropZones[ this.dropZones.length ] = aDropZone;
   },

   deregisterDropZone: function(aDropZone) {
      var newDropZones = new Array();
      var j = 0;
      for ( var i = 0 ; i < this.dropZones.length ; i++ ) {
         if ( this.dropZones[i] != aDropZone )
            newDropZones[j++] = this.dropZones[i];
      }

      this.dropZones = newDropZones;
   },

   clearDropZones: function() {
      this.dropZones = new Array();
   },

   registerDraggable: function( aDraggable ) {
      this.draggables[ this.draggables.length ] = aDraggable;
      this._addMouseDownHandler( aDraggable );
   },

   clearSelection: function() {
      for ( var i = 0 ; i < this.currentDragObjects.length ; i++ )
         this.currentDragObjects[i].deselect();
      this.currentDragObjects = new Array();
      this.lastSelectedDraggable = null;
   },

   hasSelection: function() {
      return this.currentDragObjects.length > 0;
   },

   setStartDragFromElement: function( e, mouseDownElement ) {
      this.origPos = RicoUtil.toDocumentPosition(mouseDownElement);
      this.startx = e.screenX - this.origPos.x
      this.starty = e.screenY - this.origPos.y
      //this.startComponentX = e.layerX ? e.layerX : e.offsetX;
      //this.startComponentY = e.layerY ? e.layerY : e.offsetY;
      //this.adjustedForDraggableSize = false;

      this.interestedInMotionEvents = this.hasSelection();
      this._terminateEvent(e);
   },

   updateSelection: function( draggable, extendSelection ) {
      if ( ! extendSelection )
         this.clearSelection();

      if ( draggable.isSelected() ) {
         this.currentDragObjects.removeItem(draggable);
         draggable.deselect();
         if ( draggable == this.lastSelectedDraggable )
            this.lastSelectedDraggable = null;
      }
      else {
         this.currentDragObjects[ this.currentDragObjects.length ] = draggable;
         draggable.select();
         this.lastSelectedDraggable = draggable;
      }
   },

   _mouseDownHandler: function(e) {
      if ( arguments.length == 0 )
         e = event;

      // if not button 1 ignore it...
      var nsEvent = e.which != undefined;
      if ( (nsEvent && e.which != 1) || (!nsEvent && e.button != 1))
         return;

      var eventTarget      = e.target ? e.target : e.srcElement;
      var draggableObject  = eventTarget.draggable;

      var candidate = eventTarget;
      while (draggableObject == null && candidate.parentNode) {
         candidate = candidate.parentNode;
         draggableObject = candidate.draggable;
      }
   
      if ( draggableObject == null )
         return;

      this.updateSelection( draggableObject, e.ctrlKey );

      // clear the drop zones postion cache...
      if ( this.hasSelection() )
         for ( var i = 0 ; i < this.dropZones.length ; i++ )
            this.dropZones[i].clearPositionCache();

      this.setStartDragFromElement( e, draggableObject.getMouseDownHTMLElement() );
   },


   _mouseMoveHandler: function(e) {
      var nsEvent = e.which != undefined;
      if ( !this.interestedInMotionEvents ) {
         this._terminateEvent(e);
         return;
      }

      if ( ! this.hasSelection() )
         return;

      if ( ! this.currentDragObjectVisible )
         this._startDrag(e);

      if ( !this.activatedDropZones )
         this._activateRegisteredDropZones();

      //if ( !this.adjustedForDraggableSize )
      //   this._adjustForDraggableSize(e);

      this._updateDraggableLocation(e);
      this._updateDropZonesHover(e);

      this._terminateEvent(e);
   },

   _makeDraggableObjectVisible: function(e)
   {
      if ( !this.hasSelection() )
         return;

      var dragElement;
      if ( this.currentDragObjects.length > 1 )
         dragElement = this.currentDragObjects[0].getMultiObjectDragGUI(this.currentDragObjects);
      else
         dragElement = this.currentDragObjects[0].getSingleObjectDragGUI();

      // go ahead and absolute position it...
      if ( RicoUtil.getElementsComputedStyle(dragElement, "position")  != "absolute" )
         dragElement.style.position = "absolute";

      // need to parent him into the document...
      if ( dragElement.parentNode == null || dragElement.parentNode.nodeType == 11 )
         document.body.appendChild(dragElement);

      this.dragElement = dragElement;
      this._updateDraggableLocation(e);

      this.currentDragObjectVisible = true;
   },

   /**
   _adjustForDraggableSize: function(e) {
      var dragElementWidth  = this.dragElement.offsetWidth;
      var dragElementHeight = this.dragElement.offsetHeight;
      if ( this.startComponentX > dragElementWidth )
         this.startx -= this.startComponentX - dragElementWidth + 2;
      if ( e.offsetY ) {
         if ( this.startComponentY > dragElementHeight )
            this.starty -= this.startComponentY - dragElementHeight + 2;
      }
      this.adjustedForDraggableSize = true;
   },
   **/

   _updateDraggableLocation: function(e) {
      var dragObjectStyle = this.dragElement.style;
      dragObjectStyle.left = (e.screenX - this.startx) + "px"
      dragObjectStyle.top  = (e.screenY - this.starty) + "px";
   },

   _updateDropZonesHover: function(e) {
      var n = this.dropZones.length;
      for ( var i = 0 ; i < n ; i++ ) {
         if ( ! this._mousePointInDropZone( e, this.dropZones[i] ) )
            this.dropZones[i].hideHover();
      }

      for ( var i = 0 ; i < n ; i++ ) {
         if ( this._mousePointInDropZone( e, this.dropZones[i] ) ) {
            if ( this.dropZones[i].canAccept(this.currentDragObjects) )
               this.dropZones[i].showHover();
         }
      }
   },

   _startDrag: function(e) {
      for ( var i = 0 ; i < this.currentDragObjects.length ; i++ )
         this.currentDragObjects[i].startDrag();

      this._makeDraggableObjectVisible(e);
   },

   _mouseUpHandler: function(e) {
      if ( ! this.hasSelection() )
         return;

      var nsEvent = e.which != undefined;
      if ( (nsEvent && e.which != 1) || (!nsEvent && e.button != 1))
         return;

      this.interestedInMotionEvents = false;

      if ( this.dragElement == null ) {
         this._terminateEvent(e);
         return;
      }

      if ( this._placeDraggableInDropZone(e) )
         this._completeDropOperation(e);
      else {
         this._terminateEvent(e);
         new Effect.Position( this.dragElement,
                              this.origPos.x,
                              this.origPos.y,
                              200,
                              20,
                              { complete : this._doCancelDragProcessing.bind(this) } );
      }
   },

   _completeDropOperation: function(e) {
      if ( this.dragElement != this.currentDragObjects[0].getMouseDownHTMLElement() ) {
         if ( this.dragElement.parentNode != null )
            this.dragElement.parentNode.removeChild(this.dragElement);
      }

      this._deactivateRegisteredDropZones();
      this._endDrag();
      this.clearSelection();
      this.dragElement = null;
      this.currentDragObjectVisible = false;
      this._terminateEvent(e);
   },

   _doCancelDragProcessing: function() {
      this._cancelDrag();

      if ( this.dragElement != this.currentDragObjects[0].getMouseDownHTMLElement() ) {
         if ( this.dragElement.parentNode != null ) {
            this.dragElement.parentNode.removeChild(this.dragElement);
         }
      }

      this._deactivateRegisteredDropZones();
      this.dragElement = null;
      this.currentDragObjectVisible = false;
   },

   _placeDraggableInDropZone: function(e) {
      var foundDropZone = false;
      var n = this.dropZones.length;
      for ( var i = 0 ; i < n ; i++ ) {
         if ( this._mousePointInDropZone( e, this.dropZones[i] ) ) {
            if ( this.dropZones[i].canAccept(this.currentDragObjects) ) {
               this.dropZones[i].hideHover();
               this.dropZones[i].accept(this.currentDragObjects);
               foundDropZone = true;
               break;
            }
         }
      }

      return foundDropZone;
   },

   _cancelDrag: function() {
      for ( var i = 0 ; i < this.currentDragObjects.length ; i++ )
         this.currentDragObjects[i].cancelDrag();
   },

   _endDrag: function() {
      for ( var i = 0 ; i < this.currentDragObjects.length ; i++ )
         this.currentDragObjects[i].endDrag();
   },

   _mousePointInDropZone: function( e, dropZone ) {

      var absoluteRect = dropZone.getAbsoluteRect();

      return e.clientX  > absoluteRect.left  &&
             e.clientX  < absoluteRect.right &&
             e.clientY  > absoluteRect.top   &&
             e.clientY  < absoluteRect.bottom;
   },

   _addMouseDownHandler: function( aDraggable )
   {
      var htmlElement = aDraggable.getMouseDownHTMLElement();
      if ( htmlElement != null ) {
         htmlElement.draggable = aDraggable;
         this._addMouseDownEvent( htmlElement );
      }
   },

   _activateRegisteredDropZones: function() {
      var n = this.dropZones.length;
      for ( var i = 0 ; i < n ; i++ ) {
         var dropZone = this.dropZones[i];
         if ( dropZone.canAccept(this.currentDragObjects) )
            dropZone.activate();
      }

      this.activatedDropZones = true;
   },

   _deactivateRegisteredDropZones: function() {
      var n = this.dropZones.length;
      for ( var i = 0 ; i < n ; i++ )
         this.dropZones[i].deactivate();
      this.activatedDropZones = false;
   },

   _addMouseDownEvent: function( htmlElement ) {
      if ( typeof document.implementation != "undefined" &&
         document.implementation.hasFeature("HTML",   "1.0") &&
         document.implementation.hasFeature("Events", "2.0") &&
         document.implementation.hasFeature("CSS",    "2.0") ) {
         htmlElement.addEventListener("mousedown", this._mouseDownHandler.bindAsEventListener(this), false);
      }
      else {
         htmlElement.attachEvent( "onmousedown", this._mouseDownHandler.bindAsEventListener(this) );
      }
   },

   _terminateEvent: function(e) {
      if ( e.stopPropagation != undefined )
         e.stopPropagation();
      else if ( e.cancelBubble != undefined )
         e.cancelBubble = true;

      if ( e.preventDefault != undefined )
         e.preventDefault();
      else
         e.returnValue = false;
   },

   initializeEventHandlers: function() {
      if ( typeof document.implementation != "undefined" &&
         document.implementation.hasFeature("HTML",   "1.0") &&
         document.implementation.hasFeature("Events", "2.0") &&
         document.implementation.hasFeature("CSS",    "2.0") ) {
         document.addEventListener("mouseup",   this._mouseUpHandler.bindAsEventListener(this),  false);
         document.addEventListener("mousemove", this._mouseMoveHandler.bindAsEventListener(this), false);
      }
      else {
         document.attachEvent( "onmouseup",   this._mouseUpHandler.bindAsEventListener(this) );
         document.attachEvent( "onmousemove", this._mouseMoveHandler.bindAsEventListener(this) );
      }
   }
}

var dndMgr = new Rico.DragAndDrop();
dndMgr.initializeEventHandlers();
