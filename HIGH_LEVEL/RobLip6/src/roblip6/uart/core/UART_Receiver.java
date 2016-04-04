package roblip6.uart.core;
import java.io.*;
import java.util.concurrent.Semaphore;
public class UART_Receiver implements Runnable {
	private final Semaphore mutexes_trame[];
	private Boolean terminer;
	private InputStream in;
	private Integer trame[];
	private Integer tailleTrame; 
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
	
	public void run()
	{
		
		try
		{
			int idPrec = 1;
			while(terminer == false)
			{
				if(in.available() > 2)
				{
					Integer id = in.read();
					if(id < tailleTrame && id != idPrec)
					{
						Integer result1 = in.read();
						Integer result2 = in.read();
						this.mutexes_trame[id].acquire();
							this.trame[id] = new Integer((result1<<8) | result2) ;
						this.mutexes_trame[id].release();
						idPrec = id;
					}
				}
			}
			this.in.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public Integer getElement(Integer i) throws Exception
	{
		System.out.println("lecture:...");
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
