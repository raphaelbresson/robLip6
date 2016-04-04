package robLip6.core.element;

import java.util.concurrent.locks.Lock;

public abstract class ElementElect {
	private Integer[] m_buffer;
	private Lock[] m_mutexes;
	private Integer m_nbBytes;
	public ElementElect(Integer nbByteCapt)
	{
		this.m_buffer = new Integer[nbByteCapt];
		this.m_mutexes = new Lock[nbByteCapt];
		this.m_nbBytes = new Integer(nbByteCapt);
	}
	
	public void setData(Integer i, Integer data)
	{
		this.m_mutexes[i].lock();
		try 
		{
			this.m_buffer[i] = data;
		}
		finally
		{
			this.m_mutexes[i].unlock();
		}
	}
	
	public Integer getData(Integer i)
	{
		Integer result;
		this.m_mutexes[i].lock();
		try 
		{
			result = new Integer(this.m_buffer[i]);
		}
		finally
		{
			this.m_mutexes[i].unlock();
		}
		return result;
	}
	
	public Integer getNbData()
	{
		return this.m_nbBytes;
	}
}
