
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

public class alienfirefly
{
	public static String TAG = "alienfirefly";	
	public static float VERSION = 1.0f;	
	private Method m_callscript;
	private Object m_parent;
	private Context m_ctx;

	//Contruct plugin.
	public alienfirefly()
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
			else if( cmd.equals("MyFunc") ) 
				return MyFunc( b );
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
	
	//Handle the 'MyFunc' command.
	private String MyFunc( Bundle b )
	{
		Log.d( TAG, "Got MyFunc" );

		//Extract params from 'MyFunc' command.
		String txt = b.getString("p1");
		float num = b.getFloat("p2");
		boolean bool = b.getBoolean("p3");
	
		//Return result to user.
		return "Your params were: "+txt+","+num+","+bool;
	}

} 


