package roblip6.uart.debug;

import java.util.Vector;

import javax.swing.*;


public class VueCapteurs extends JPanel {
	
	private static final long serialVersionUID = 1L;
	
	private JProgressBar[] capteurs;
	
	private JLabel[] labels_capteurs;
	
	public VueCapteurs(Integer nbCapteurs)
	{
		this.capteurs = new JProgressBar[nbCapteurs];
		this.labels_capteurs = new JLabel[nbCapteurs];
		Box global = Box.createVerticalBox();
		for(Integer i=0; i < nbCapteurs ; i++)
		{
			Box local = Box.createHorizontalBox();
			this.labels_capteurs[i] = new JLabel("capteur "+i+":");
			this.capteurs[i] = new JProgressBar(0);
			this.capteurs[i].setMaximum(255);
			this.capteurs[i].setMinimum(0);
			local.add(this.labels_capteurs[i]);
			local.add(this.capteurs[i]);
			global.add(local);
		}
		this.add(global);
	}
	
	public void setValues(Vector<Number> values)
	{
		for(Integer i=0; i< values.size() ; i++)
		{
			this.capteurs[i].setValue(values.elementAt(i).intValue());
		}
	}
}
