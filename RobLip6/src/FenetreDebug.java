import java.awt.event.*;
import java.util.*;
import javax.swing.*;

public class FenetreDebug extends JFrame 
{
	private static final long serialVersionUID = 1L;
	private JTextArea area_send;
	private JTextArea area_recv;
	private JButton send_button;
	private JButton closeButton;
	Boolean terminer;
	
	private UART_Communicator uart;
	public FenetreDebug() 
	{
		this.setTitle("Fenetre de debug de l'interface UART");
		this.terminer = false;
		this.uart = new UART_Communicator("/dev/ttyACM0");
		this.setSize(800, 600);
	    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		this.area_send = new JTextArea("titi");
		this.area_recv = new JTextArea("toto");
		this.send_button = new JButton("Envoyer");
		this.closeButton = new JButton("Terminer");
		this.send_button.addMouseListener(new MouseListener(){
			@Override
			public void mouseClicked(MouseEvent e) {
				String trameEnvoi = area_send.getText();
				uart.sendData(parseUserRequest(trameEnvoi));
			}
			@Override
			public void mousePressed(MouseEvent e) {}
			@Override
			public void mouseReleased(MouseEvent e) {}
			@Override
			public void mouseEntered(MouseEvent e) {}
			@Override
			public void mouseExited(MouseEvent e) {}
		});
		this.closeButton.addMouseListener(new MouseListener(){
			@Override
			public void mouseClicked(MouseEvent e) {
				
				closeConnection();
				System.exit(0);
				
			}
			@Override
			public void mousePressed(MouseEvent e) {}
			@Override
			public void mouseReleased(MouseEvent e) {}
			@Override
			public void mouseEntered(MouseEvent e) {}
			@Override
			public void mouseExited(MouseEvent e) {}
		});
		Box bButtons = Box.createHorizontalBox();
		Box bAreas = Box.createHorizontalBox();
		Box bGlobal = Box.createVerticalBox();
		bAreas.add(this.area_send);
		bButtons.add(this.send_button);
		bAreas.add(this.area_recv);
		bButtons.add(this.closeButton);
		bGlobal.add(bButtons);
		bGlobal.add(bAreas);
		
		
		this.getContentPane().add(bGlobal);
		this.setVisible(true);
		try
		{
			this.readProcess();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public Vector<Integer> parseUserRequest(String request)
	{
		String tmp = new String();
		Vector<Integer> trame = new Vector<Integer>();
		for(int i=0; i<request.length(); i++)
		{
			if(request.charAt(i) == ';')
			{
				Integer res = Integer.parseInt(tmp);
				trame.add(res);
				tmp = "";
			}else
				tmp += request.charAt(i);
		}
		return trame;
	}
	
	public void readProcess() throws Exception
	{
		while(!terminer)
		{
			Vector<Integer> temp = this.uart.readData();
			this.area_recv.setText("");
			for(int i=0;i<temp.size();i++)
				this.area_recv.append(temp.elementAt(i).toString() + ";");
			this.area_recv.append("\n");
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
