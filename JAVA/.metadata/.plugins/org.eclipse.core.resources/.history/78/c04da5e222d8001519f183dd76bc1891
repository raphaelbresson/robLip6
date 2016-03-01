package robLip6.core.tcp;

import java.util.concurrent.locks.Lock;

public class Capteur {
	private Integer[] m_bufferCapteur;
	private Lock[] m_mutexes;
	
	Capteur(Integer nbByteCapt)
	{
		this.m_bufferCapteur = new Integer[nbByteCapt];
		this.m_mutexes = new Lock[nbByteCapt];
	}
	
	void setData(Integer i, Integer data)
	{
		this.m_mutexes[i].lock();
		try 
		{
			this.m_bufferCapteur[i] = data;
		}
		finally
		{
			this.m_mutexes[i].unlock();
		}
	}
	
	Integer getData(Integer i)
	{
		Integer result;
		this.m_mutexes[i].lock();
		try 
		{
			result = new Integer(this.m_bufferCapteur[i]);
		}
		finally
		{
			this.m_mutexes[i].unlock();
		}
		return result;
	}
}
