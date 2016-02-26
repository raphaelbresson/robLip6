package robLip6.core.tcp;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.util.*;
import java.net.*;

import robLip6.core.element.*;

import java.io.*;

public class TcpServer 
{
	private Receiver m_recv;
	private Sender m_send;
	private ServerSocket m_serv;
	public TcpServer(Integer port)
	{
		try
		{
			this.m_serv = new ServerSocket(port);
			init();
		}catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	public void closeConnection()
	{
		try
		{
			this.m_serv.close();
		}catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	private void init() throws IOException
	{
		Socket client = this.m_serv.accept();
		InputStream input = client.getInputStream();
		BufferedReader in = new BufferedReader(new InputStreamReader(input));
		DataOutputStream out = new DataOutputStream(client.getOutputStream());
		this.initConnection(input, in, out);
	}
	
	private void initConnection(InputStream input,BufferedReader in, DataOutputStream out) throws IOException
	{
		Vector<Capteur> capteurs = new Vector<Capteur>();
		Vector<Actionneur> actionneurs = new Vector<Actionneur>();
		out.write("ok".getBytes());
		while(input.available() >= 4);
		// on lit le nombre de capteurs � g�rer
		Integer nbCapteurs = Integer.parseInt(in.readLine()); 
		for(Integer i=0 ; i < nbCapteurs ; i++)
		{
			out.write("ok".getBytes());// on dit au client qu'il peut passer � la requ�te suivante
			while(input.available() >= 4);
			// on lit le nombre d'entiers n�cessaires pour les donn�es de ce capteur
			Integer nbByteCapt = Integer.parseInt(in.readLine()); 
			Capteur capt = new Capteur(nbByteCapt);
			capteurs.addElement(capt);
		}
		this.m_recv = new Receiver(input,in,capteurs);
		this.m_send = new Sender(out,actionneurs);
		//initialisation des threads
		Thread t1 = new Thread(this.m_recv);
		Thread t2 = new Thread(this.m_send);
		t1.start();
		t2.start();
	}
}
