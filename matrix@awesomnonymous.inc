//Add Creatematrix@awesomnonymous method to global app object. 
app.Creatematrix@awesomnonymous = function() { return new matrix@awesomnonymous();}

//Plugin wrapper class.
function matrix@awesomnonymous( options )
{
	var dw = app.GetDisplayWidth();
	var dh = app.GetDisplayHeight();
    this.plg = _CreatePlugin( "com.myname.plugins.user.matrix@awesomnonymous", options );  
	this.GetVersion = function( num, txt ) { return parseFloat( this.plg.Send( "GetVersion" ) ); }
	
	//Your method calls go here.
	this.CreateMyButton = function( txt,width,height ) { 
        var ret = this.plg.CreateObj( "MyButton", txt, width*dw, height*dh );  
        if( ret ) return new Obj(ret); else return null; 
    }
	//...
}
