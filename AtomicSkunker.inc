//Add CreateAtomicSkunker method to global app object. 
app.CreateAtomicSkunker = function() { return new AtomicSkunker();}

//Plugin wrapper class.
function AtomicSkunker( options )
{
	var dw = app.GetDisplayWidth();
	var dh = app.GetDisplayHeight();
    this.plg = _CreatePlugin( "com.awesomenonymous.plugins.user.AtomicSkunker", options );  
	this.GetVersion = function( num, txt ) { return parseFloat( this.plg.Send( "GetVersion" ) ); }
	
	//Your method calls go here.
	this.CreateMyButton = function( txt,width,height ) { 
        var ret = this.plg.CreateObj( "MyButton", txt, width*dw, height*dh );  
        if( ret ) return new Obj(ret); else return null; 
    }
	//...
}
