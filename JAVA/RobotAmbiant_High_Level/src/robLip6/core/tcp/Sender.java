package robLip6.core.tcp;

import java.io.*;
import java.util.*;
import robLip6.core.element.*;

public class Sender implements Runnable 
{
	private DataOutputStream m_out;
	Vector<Actionneur> m_actionneurs;
	public Sender(DataOutputStream out, Vector<Actionneur> actionneurs)
	{
		this.m_out = out;
		this.m_actionneurs = actionneurs;
	}
	@Override
	public void run() 
	{
		while(true)
		{
			for(Integer i=0 ; i < this.m_actionneurs.size() ; i++)
			{
				String message = "A" + i + ":";
				for(Integer j=0 ; j < this.m_actionneurs.elementAt(i).getNbData() ; j++)
				{
					message += this.m_actionneurs.elementAt(i).getData(j);
					message += ";";
				}
				try
				{
					this.send(message);
				}catch(IOException e)
				{
					e.printStackTrace();
				}
			}
			//delai ici
		}
	}
	public void send(String str) throws IOException
	{
		Integer taille = str.length();
		m_out.writeInt(taille);
		m_out.writeBytes(str);
	}
}
