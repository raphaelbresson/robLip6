package roblip6.uart.core;
import java.io.OutputStream;	
import java.util.concurrent.Semaphore;

public class UART_Sender implements Runnable {
	
	private Boolean terminer;
	private OutputStream out;
	private Integer trame[];
	private Integer tailleTrame;
	private Integer curseur;
	private final Semaphore mutexes_trame[];
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
	
	public Integer getTailleTrame()
	{
		return this.tailleTrame;
	}
	
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
	
	public void setElement(Integer e, Integer i) throws Exception
	{
		this.mutexes_trame[i].acquire();
			this.trame[i] = e;
		this.mutexes_trame[i].release();
	}
	
	public void setTerminer()
	{
		this.terminer = true;
	}

}
