package roblip6.uart.debug;

import java.util.Vector;

import javax.swing.*;

public class ControlAction extends JPanel {
	
	private static final long serialVersionUID = 1L;
	private JScrollBar[] actionneurs;
	private JLabel[] label_actionneurs;
	private Integer nb_actionneurs;
	public ControlAction(Integer nbActionneurs)
	{
		Box global = Box.createVerticalBox();
		this.actionneurs = new JScrollBar[nbActionneurs];
		this.label_actionneurs = new JLabel[nbActionneurs];
		this.nb_actionneurs = nbActionneurs;
		for(Integer i=0 ; i < nbActionneurs ; i++)
		{
			Box local = Box.createHorizontalBox();
			this.label_actionneurs[i] = new JLabel("Actionneur "+i+":");
			this.actionneurs[i] = new JScrollBar(0);
			this.actionneurs[i].setMinimum(0);
			this.actionneurs[i].setMaximum(255);
			this.actionneurs[i].setValue(255);
			this.actionneurs[i].setSize(50,20);
			local.add(this.label_actionneurs[i]);
			local.add(this.actionneurs[i]);
			global.add(local);
		}
		this.add(global);
	}
	
	public Vector<Integer> getActions()
	{
		Vector<Integer> result = new Vector<Integer>();
		for(Integer i = 0; i < this.nb_actionneurs ; i++)
		{
			result.add(this.actionneurs[i].getValue()+10);
			//System.out.println("value:" + this.actionneurs[i].getValue());
		}
		return result;
	}
}
