
/*
	DroidScript Plugin class.
	(This is where you put your plugin code)
*/

package com.myname.plugins.user;

import android.os.*;
import android.content.*;
import android.util.*;
import android.graphics.*;
import java.lang.reflect.*;
import java.io.*;

public class matrix@awesomnonymous
{
	public static String TAG = "matrix@awesomnonymous";	
	public static float VERSION = 1.0f;	
	private Method m_callscript;
	private Object m_parent;
	private Context m_ctx;

	//Contruct plugin.
	public matrix@awesomnonymous()
	{
		Log.d( TAG, "Creating plugin object");
	}

	//Initialise plugin.
	public void Init( Context ctx, Object parent )
	{
		try {
			Log.d( TAG, "Initialising plugin object");
			m_ctx = ctx;
			m_parent = parent;
			m_callscript = parent.getClass().getMethod( "CallScript", Bundle.class );
			
			//Your initialisation code goes here.
			//...
		 } 
		 catch (Exception e) {
			   Log.e( TAG, "Failed to Initialise plugin!", e );
		 }
	}

	//Release plugin resources.
	public void Release()
	{
		//Your tidy up code goes here.
		//...
	}
	
	//Use this method to call a function in the user's script.
	private void CallScript( Bundle b )
	{
		try {
			m_callscript.invoke( m_parent, b );
		} 
		catch (Exception e) {
			Log.e( TAG, "Failed to call script function!", e );
		}
	}

	//Handle commands from DroidScript.
	public String CallPlugin( Bundle b )
	{
		//Extract command.
		String cmd = b.getString("cmd");
	
		//Process commands.
		String ret = null;
		try {
			if( cmd.equals("GetVersion") ) 
				return GetVersion( b );
				
			//Your method calls go here.
			//...
		} 
		catch (Exception e) {
		   Log.e( TAG, "Plugin command failed!", e);
		}
		return ret;
	}

	//Handle creating objects from DroidScript.
	public Object CreateObject( Bundle b )
	{
		String type = b.getString("type");
		Object ret = null;
		try {
			//Your object creation happens here.
			if( type.equals("MyButton") ) 
				return CreateMyButton( b );
			//...
		} 
		catch (Exception e) {
		   Log.e( TAG, "Plugin command failed!", e);
		}
		return ret;
	}
	
	//Handle the GetVersion command.
	private String GetVersion( Bundle b )
	{
		Log.d( TAG, "Got GetVersion" );
		return Float.toString( VERSION );
	}
	
	//Handle 'CreateMyButton' command.
	private Object CreateMyButton( Bundle b )
	{
		//Extract params.
		String txt = b.getString("p1");
		float width = b.getFloat("p2");
		float height = b.getFloat("p3");

		//Create custom button.
		MyButton btn = new MyButton( m_ctx, txt, width, height );
		return btn;
	}

} 


