package roblip6.uart.core;
import java.io.OutputStream;	
import java.util.concurrent.Semaphore;
/**
 * <b>Classe d'envoi pour la communication UART avec le HIGH LEVEL</b> 
 * @author Raf
 * @version 1.0
 */
public class UART_Sender implements Runnable {
	/**
	 * True pour terminer
	 */
	private Boolean terminer;
	/**
	 * Stream de sortie
	 */
	private OutputStream out;
	/**
	 * buffer d'envoi
	 */
	private Integer trame[];
	/**
	 * Taille de la trame d'envoi
	 */
	private Integer tailleTrame;
	/**
	 * Curseur déterminant l'envoi courant
	 */
	private Integer curseur;
	/**
	 * Mutexes pour chaque case du buffer
	 */
	private final Semaphore mutexes_trame[];
	/**
	 * Constructeur en fonction d'un stream d'entrée et de la taille de la trame
	 * @param out stream d'entrée
	 * @param tailleTrame taille de la trame
	 */
	public UART_Sender(OutputStream out, Integer tailleTrame)
	{
		this.terminer = false;
		this.out = out;
		this.tailleTrame = tailleTrame;
		this.trame = new Integer[tailleTrame];
		this.mutexes_trame = new Semaphore[tailleTrame];
		for(int i = 0; i < tailleTrame ; i++)
		{
			this.trame[i] = 0;
			this.mutexes_trame[i] = new Semaphore(1);
		}
		this.curseur = tailleTrame - 1;
	}
	/**
	 * Retourne la taille du buffer d'écriture
	 * @return la taille de la trame de sortie
	 */
	public Integer getTailleTrame()
	{
		return this.tailleTrame;
	}
	
	/**
	 * Ecriture asynchrone
	 */
	@Override
	public void run()
	{
		try
		{
			while(!terminer)
			{
				this.out.write(this.curseur);
				this.mutexes_trame[this.curseur].acquire();
					this.out.write(this.trame[this.curseur]);
					if(this.curseur > 0)
						this.curseur--;
					else
						this.curseur = tailleTrame - 1;
				this.mutexes_trame[this.curseur].release();
				
				Thread.sleep(20);
			}
			this.out.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * Modifier l'élément placé à la case i et remplacer sa valeur par e.
	 * @param e nouvelle valeur
	 * @param i index
	 * @throws Exception
	 */
	public void setElement(Integer e, Integer i) throws Exception
	{
		this.mutexes_trame[i].acquire();
			this.trame[i] = e;
		this.mutexes_trame[i].release();
	}
	
	/**
	 * Terminer proprement
	 */
	public void setTerminer()
	{
		this.terminer = true;
	}

}
