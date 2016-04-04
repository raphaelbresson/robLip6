import gnu.io.*;
import java.io.InputStream;
import java.io.OutputStream;	
import java.util.*;


public class UART_Communicator {
	
	private InputStream in;
	private OutputStream out;
	private CommPort port;
	private UART_Receiver receiver;
	private UART_Sender sender;
	
	private Integer tailleTrameSend;
	
	private Integer tailleTrameRecv;
	
	public Integer getTailleTrameRecv() { return this.tailleTrameRecv; }
	public Integer getTailleTrameSend() { return this.tailleTrameSend; }
	
	
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
    
    public void init(String com) throws Exception
    {
    	CommPortIdentifier comPortID = CommPortIdentifier.getPortIdentifier(com);
		if( comPortID.isCurrentlyOwned() ) 
		{
		      System.out.println( "Erreur: le port \""+ com + "\" est actuellement utilisé par une autre application" );
		}
		else 
		{
			int timeout = 1;
			port = comPortID.open(this.getClass().getName(), timeout);
			if(port instanceof SerialPort)
			{
				SerialPort serial = (SerialPort)port;
				serial.setSerialPortParams(	115200, 					//BAUDS
											SerialPort.DATABITS_8,  // TAILLE DONNÉES
											SerialPort.STOPBITS_1,
											SerialPort.PARITY_NONE  
										);
				in = serial.getInputStream();
				out = serial.getOutputStream();
			}else
			{
				System.out.println( "Erreur: le port \""+ com + "\" n'est pas un port série" );
			}
		}
    }
    
    public void start()
    {
    	this.receiver = new UART_Receiver(in,this.tailleTrameRecv);
    	this.sender = new UART_Sender(out, this.tailleTrameSend);
    	Thread thread_recv = new Thread(this.receiver);
    	Thread thread_send = new Thread(this.sender);
    	thread_recv.start();
    	thread_send.start();
    }
    
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
    
    
    public Vector<Integer> readData()
    {
    	Vector<Integer> result = new Vector<Integer>();
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
    
    public void terminer() throws Exception
    {
    	this.sender.setTerminer();
    	this.receiver.setTerminer();
    	//Thread.sleep(4000);
    	//this.port.close();
    }
    
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
    		if(type == 1)
    		{
    			tailleTrame_reception++;
    		}
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
    //	System.exit(1);
    }
}