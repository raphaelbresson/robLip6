package roblip6.uart.core;
import java.io.*;
import java.util.concurrent.Semaphore;
/**
 * <b>Classe de réception pour la communication UART avec le HIGH LEVEL</b> 
 * @author Raf
 * @version 1.0
 */
public class UART_Receiver implements Runnable {
	/**
	 * Tableau de mutex pour le buffer des valeurs des capteurs
	 */
	private final Semaphore mutexes_trame[];
	/**
	 * True pour terminer
	 */
	private Boolean terminer;
	/**
	 * Stream d'entrée
	 */
	private InputStream in;
	/**
	 * Buffer
	 */
	private Number trame[];
	/**
	 * Taille du buffer
	 */
	private Integer tailleTrame;
	/**
	 * 
	 * @param in stream d'entrée
	 * @param tailleTrame taille de la trame
	 */
	public UART_Receiver(InputStream in,Integer tailleTrame)
	{
		this.trame = new Integer[tailleTrame];
		this.mutexes_trame = new Semaphore[tailleTrame];
		for(int i = 0; i < tailleTrame ; i++)
		{
			this.trame[i] = 0;
			this.mutexes_trame[i] = new Semaphore(1);
		}
		this.tailleTrame = tailleTrame;
		this.in = in;
		this.terminer = false;
	}
	/**
	 * Réception concurente
	 */
	@Override
	public void run()
	{
		
		try
		{
			while(!this.terminer)
			{
			//	System.out.println("Reception UART");
				if(in.available() >= 5) // on doit faire 5 lectures pour chaque capteur 
				{
					Integer id= in.read();
					//id--;
					System.out.println("ID:"+id+" taille:"+tailleTrame+" avalaible:"+in.available());
					if(id < tailleTrame && id >=0)
					{
						Integer result1 = in.read();
						Integer result2 = in.read();
						Integer result3 = in.read();
						Integer result4 = in.read();
						Integer result = new Integer(result4 | (result3<<8) | (result2<<16) | (result1<<32));
						this.mutexes_trame[id].acquire();
							this.trame[id]= new Integer(result);
						this.mutexes_trame[id].release();
						System.out.println("id"+id +"result1:"+result1+"result2:"+result2+"result3:"+result3+"result4:"+result4);
					}
				}
			}
			this.in.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param i l'indice de l'élément du buffer à récupérer
	 * @return Le nombre contenu à l'indice i dans le buffer
	 * @throws Exception
	 */
	public Number getElement(Integer i) throws Exception
	{
		//System.out.println("lecture:...");
		Number data;
		this.mutexes_trame[i].acquire();
			data = this.trame[i];
		this.mutexes_trame[i].release();
		return data;
	}
	/**
	 * Récupérer la taille de la trame
	 * @return la taille de la trame
	 */
	public Integer getTailleTrame()
	{
		return this.tailleTrame;
	}
	/**
	 * Terminer proprement
	 */
	public void setTerminer()
	{
		this.terminer = true;
	}

}
