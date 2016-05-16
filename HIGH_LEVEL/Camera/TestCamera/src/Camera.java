/**
 * 
 */
import org.opencv.core.Mat;
import org.opencv.highgui.*;
import org.opencv.core.*;
public class Camera {

	/**
	 * 
	 */
	public Camera() {
		// TODO Auto-generated constructor stub
		try
		{
			VideoCapture camera = new VideoCapture(0);
		//	Thread.sleep(1000);
			camera.open(1);
			if(!camera.isOpened())
				System.out.println("Erreur camera");
			Mat frame = new Mat();
			camera.read(frame);
	//		VideoWriter outputCamera = new VideoWriter("test.avi",camera);
			Highgui.imwrite("camera.jpg",frame);
			System.out.println("OK");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
