
package com.myname.plugins.user;

import android.content.*;
import android.util.*;
import android.view.*;
import android.view.ViewGroup.*;
import android.widget.*;


//TextView wrapper for calling via javascript.
public class MyButton extends Button implements View.OnClickListener
{		
	public static String TAG = "matrix@awesomnonymous";	 
	public String m_sOnClick;

	public MyButton( Context context, String text, float width, float height ) 
	{ 
		super( context );
		setText( text );
		setOnClickListener( this );

		LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams( 
					LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
		if( width > -1) lp.width = (int)(width);
		if( height > -1) lp.height = (int)(height);	
		setLayoutParams( lp );
	}

	@Override 
	public void onClick( View v )  
	{
		Log.d( TAG, "Button clicked!");
    }		
	
 }
