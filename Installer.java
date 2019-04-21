/*
	DroidScript Plugin Installer.
	(You can modify this activity but don't delete it)
*/
package com.myname.plugins.user;

import android.app.*;
import android.util.*;
import android.widget.*;
import android.os.*;
import android.content.*;
import android.content.pm.*;
import java.io.*;
import java.nio.channels.*;
import java.util.*;

//Installer activity.
public class Installer extends Activity 
{
	public static String TAG = "matrix@awesomnonymous";	

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        
		//Extract this plugin to the DroidScript 'Plugins' folder.
		try {
			ExtractPlugin( this, "matrix@awesomnonymous" );
		}
		catch(Exception e ) {
			String msg = "Failed to install plugin!";
			Log.e( TAG, msg, e );
			Toast.makeText( this, msg, Toast.LENGTH_LONG).show(); 
			return;
		}
		//Show the user a 'success' message.
		String msg = "Plugin installed.\n\nPlease restart DroidScript.";
		Toast.makeText( this, msg, Toast.LENGTH_LONG).show(); 
    }

	//Extract plugin from APK to plugins folder.
	public void ExtractPlugin( Context ctx, String name ) throws Exception 
	{
		//Get the source dir of an app.
		String packageName = ctx.getPackageName();
		ApplicationInfo info = ctx.getPackageManager().getApplicationInfo(packageName, 0 );
		String srcDir = info.sourceDir;
		Log.d( TAG, "srcDir: " + srcDir );

		//Create plugins folder if required.
		String plugDir = "/sdcard/DroidScript/Plugins";
		File dir = new File( plugDir );
		if( !dir.exists() ) dir.mkdirs(); 

		//Copy the APK to the plugins folder.
		CopyFile( new File(srcDir), new File(plugDir+"/"+name+".apk") );
	}

	//Copy a file.
	public void CopyFile( File src, File dst ) throws Exception 
	{
		FileInputStream inStream = new FileInputStream(src);
		FileOutputStream outStream = new FileOutputStream(dst);
		FileChannel inChannel = inStream.getChannel();
		FileChannel outChannel = outStream.getChannel();
		inChannel.transferTo(0, inChannel.size(), outChannel);
		inStream.close();
		outStream.close();
	}
}
