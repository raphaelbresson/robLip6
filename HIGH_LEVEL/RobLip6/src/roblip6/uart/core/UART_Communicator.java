package roblip6.uart.core;
import gnu.io.*;
import java.io.InputStream;
import java.io.OutputStream;	
import java.util.*;

/**
 * <b>UART_Communicator est une classe permettant de gérer la 
 * communication UART avec la carte HIGH LEVEL</b>
 * @see UART_Receiver
 * @author Raphael
 * @version 1.0
 */
public class UART_Communicator {
	/**
	 * Stream d'entrée pour la lecture
	 */
	private InputStream in;
	/**
	 * Stream de sortie pour l'écriture
	 */
	private OutputStream out;
	/**
	 * Port UART pour la communication
	 */
	private CommPort port;
	/**
	 * Objet récepteur
	 */
	private UART_Receiver receiver;
	/**
	 * Objet Receveur
	 */
	private UART_Sender sender;
	/**
	 * Taille de la trame d'envoi
	 */
	private Integer tailleTrameSend;
	/**
	 * Taille de la trame de réception
	 */
	private Integer tailleTrameRecv;
	/**
	 * 
	 * Retourne la taille de la trame de réception
	 * @return la taille de la trame de réception
	 */
	public Integer getTailleTrameRecv() { return this.tailleTrameRecv; }
	/**
	 * Retourne la taille de trame d'envoi
	 * @return la taille de trame d'envoi
	 */
	public Integer getTailleTrameSend() { return this.tailleTrameSend; }
	
	/**
	 * Constructeur: Initialise le protocole et commence la communication
	 * @param com le port série à utiliser
	 */
    public UART_Communicator(String com)
	{
    	try
    	{
    		init(com);
    		this.initialisation();
    		start();
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
	}
    /**
     * Initialisation de la connection
     * @param com le port série à utiliser
     * @throws Exception
     */
    public void init(String com) throws Exception
    {
    	CommPortIdentifier comPortID = CommPortIdentifier.getPortIdentifier(com);
		if( comPortID.isCurrentlyOwned() ) 
		{
		      System.out.println( "Erreur: le port \""+ com + "\" est actuellement utilisÃ© par une autre application" );
		}
		else 
		{
			int timeout = 2000;
			port = comPortID.open(this.getClass().getName(), timeout);
			if(port instanceof SerialPort)
			{
				SerialPort serial = (SerialPort)port;
				serial.setSerialPortParams(	5000_000, 					//BAUDS
											SerialPort.DATABITS_8,  // TAILLE DONNÃ‰ES
											SerialPort.STOPBITS_1,
											SerialPort.PARITY_NONE  
										);
				in = serial.getInputStream();
				out = serial.getOutputStream();
			}else
			{
				System.out.println( "Erreur: le port \""+ com + "\" n'est pas un port sÃ©rie" );
			}
		}
    }
    
    /**
     * Démarrage des threads de communication (in/out)
     */
    public void start()
    {
    	this.receiver = new UART_Receiver(in,this.tailleTrameRecv);
    	this.sender = new UART_Sender(out, this.tailleTrameSend);
    	Thread thread_recv = new Thread(this.receiver);
    	Thread thread_send = new Thread(this.sender);
    	thread_recv.start();
    	thread_send.start();
    }
    
    /**
     * Envoyer des données
     * @param dataToSend Données à envoyer
     */
    public void sendData(Vector<Integer> dataToSend)
    {
    	try
    	{
    		for(int i=0 ; i<dataToSend.size() && i<this.sender.getTailleTrame() ; i++)
    		{
    			Integer data = new Integer(dataToSend.elementAt(i));
    			this.sender.setElement(data, i);
    		}
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
    
    /**
     * Récupérer les valeurs des capteurs
     * @return Un vecteur contenant les valeurs des capteurs
     */
    public Vector<Number> readData()
    {
    	Vector<Number> result = new Vector<Number>();
    	try
    	{
    		for(int i = 0  ; i < this.getTailleTrameRecv() ; i++)
    		{
    			result.add(this.receiver.getElement(i));
    		}
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return result;
    }
    
    /**
     * Terminer proprement le protocole
     * @throws Exception
     */
    public void terminer() throws Exception
    {
    	this.sender.setTerminer();
    	this.receiver.setTerminer();
    }
    
    /**
     * Initialisation du protocole de communication avec le HIGH LEVEL
     */
    public void initialisation() throws Exception
    {
    	this.out.write(0XFF);
    	int nbCapteurs = 0, nbActionneurs = 0;
    	Vector<Integer> vectCapteurs = new Vector<Integer>();
    	Vector<Integer> vectActionneurs = new Vector<Integer>();
    	nbCapteurs = this.in.read();
    	nbActionneurs = this.in.read();
    	System.out.println("Nombre de capteurs:" + nbCapteurs);
    	System.out.println("Nombre d'actionneurs:" + nbActionneurs);
    	Integer tailleTrame_reception = nbCapteurs;
    	for(int i=0; i < nbCapteurs ; i++)
    	{		
    		Integer numero = this.in.read();
    		vectCapteurs.add(numero);
    		Integer type = this.in.read();
    		vectCapteurs.add(type);
    	}
    	for(int i=0; i < nbActionneurs ; i++)
    	{
    		Integer numero = this.in.read();
    		vectActionneurs.add(numero);
    		Integer type = this.in.read();
    		vectActionneurs.add(type);
    	}
    	for(int i=0; i < nbCapteurs ; i++)
    	{
    		System.out.println("capteur:"+ vectCapteurs.elementAt(i*2));
    		System.out.println("type:"+ vectCapteurs.elementAt(i*2 + 1));
    	}
    	for(int i=0; i < nbActionneurs ; i++)
    	{
    		System.out.println("actionneur:"+ vectActionneurs.elementAt(i*2));
    		System.out.println("type:"+ vectActionneurs.elementAt(i*2+1));
    	}
    	this.tailleTrameRecv = tailleTrame_reception;
    	this.tailleTrameSend = nbActionneurs;
    }
}