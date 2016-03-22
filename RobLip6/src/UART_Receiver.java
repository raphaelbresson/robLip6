import java.io.*;
import java.util.concurrent.Semaphore;
public class UART_Receiver implements Runnable {
	private final Semaphore mutexes_trame[];
	private Boolean terminer;
	private InputStream in;
	private Integer trame[];
	private Integer tailleTrame;
	private Integer curseur;  
	
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
		this.curseur = 0;
	}
	
	public void run()
	{
		Integer result = -1;
		try
		{
			while(terminer == false)
			{
				result = in.read();
				System.out.println("capteur numero "+ this.curseur +": data=" + result);
				this.mutexes_trame[this.curseur].acquire();
					this.trame[this.curseur] = new Integer(result) ;
				this.mutexes_trame[this.curseur].release();
				if(this.curseur < tailleTrame-1)
					this.curseur++;
				else
					this.curseur = 0;
			}
			this.in.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public Integer getElement(Integer i) throws Exception
	{
	//	System.out.println("capteur : 0");
		this.mutexes_trame[i].acquire();
			Integer data = new Integer(this.trame[i]);
		this.mutexes_trame[i].release();
		return data;
	}
	
	public Integer getTailleTrame()
	{
		return this.tailleTrame;
	}
	public void setTerminer()
	{
		this.terminer = true;
	}

}
