package robLip6.core.tcp;
import java.util.*;

import robLip6.core.element.Capteur;

import java.io.*;

/*
 * Classe qui re�oit les donn�es des capteurs de la LOW LEVEL
 */
public class Receiver implements Runnable
{
	private Vector<Capteur> m_capteurs;
	private InputStream m_input;
	private BufferedReader m_in;
	
	public Receiver(InputStream input, BufferedReader in, Vector<Capteur> capteurs) throws IOException
	{
		this.m_input = input;
		this.m_in = in;
		m_capteurs = capteurs;
	}
	
	public Capteur getCapteur(Integer i)
	{
		return this.m_capteurs.elementAt(i);
	}
	
	@Override
	public void run()
	{
		while(true)
		{
			try
			{
				if(this.m_input.available() >= 4)// on re�oit d'abord une taille de paquet
				{
					Integer taille = Integer.parseInt(this.m_in.readLine());
					while(this.m_input.available() < taille);//on attend de recevoir toute la trame
					this.traiterTrame(this.m_in.readLine());//on traite la trame (remplissage des buffers)
				}
			}catch(IOException e)
			{
				e.printStackTrace();
			}
		}

	}
	
	private void traiterTrame(String trame)
	{
		String buffer= "";
		Integer numeroCapteur=0, valeurCapteur=0, numeroCase=0;
		for(Integer i=0 ; i < trame.length() ; i++)
		{
			switch(trame.getBytes()[i])
			{
				case 'C':
					if(!buffer.isEmpty())
					{
						buffer = "";
						numeroCase = 0;
					} break;
				case ':':
					if(!buffer.isEmpty())
					{
						numeroCapteur = Integer.parseInt(buffer);
						buffer = "";
					} break;
				case ';':
					if(!buffer.isEmpty())
					{
						buffer = "";
						valeurCapteur = Integer.parseInt(buffer);
						this.m_capteurs.elementAt(numeroCapteur).setData(numeroCase, valeurCapteur);
						numeroCase++;
					} break;
				default:
					buffer += trame.getBytes()[i]; break;
			}
		}
	}
}
