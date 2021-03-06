package roblip6.uart.debug;
import java.util.*;
import javax.swing.*;

import roblip6.uart.core.*;

public class FenetreDebug extends JFrame 
{
	private static final long serialVersionUID = 1L;
	private VueCapteurs capts;
	private ControlAction actions;
	
	Boolean terminer;
	
	private UART_Communicator uart;
	public FenetreDebug() 
	{
		this.setTitle("Fenetre de debug de l'interface UART");
		this.terminer = false;
		this.uart = new UART_Communicator("COM6");
		this.setSize(800, 600);
	    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		
		this.capts = new VueCapteurs(this.uart.getTailleTrameRecv());
		this.actions = new ControlAction(this.uart.getTailleTrameSend());
		
		Box bGlobal = Box.createHorizontalBox();
		bGlobal.add(this.capts);
		bGlobal.add(this.actions);
		
		
		this.getContentPane().add(bGlobal);
		this.setVisible(true);
		try
		{
			this.process();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void process() throws Exception
	{
		while(!terminer)
		{
			Vector<Number> temp = this.uart.readData();
			this.capts.setValues(temp);
			this.uart.sendData(this.actions.getActions());
			System.out.println("lidar="+ temp.elementAt(1));
		}
	}
	
	public void closeConnection()
	{
		try
		{
			this.uart.terminer();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
