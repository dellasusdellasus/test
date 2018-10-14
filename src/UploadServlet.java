import java.io.IOException; 
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;


@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 16177215)  //max file sized 16MB
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UploadServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		InputStream inputStream = null;

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("file");
		
		if (filePart != null) {
		    // debug messages
		    System.out.println(filePart.getName());
		    System.out.println(filePart.getSize());
		    System.out.println(filePart.getContentType());

		    // obtains input stream of the upload file
		    inputStream = filePart.getInputStream();
		    
		}






		Storage storage = StorageOptions.getDefaultInstance().getService();
		HttpSession hs = request.getSession();
		String bucketName = (String)hs.getAttribute("contact");
		Bucket bucket = storage.get(bucketName);
		// Upload a blob to the bucket
		Blob blob = bucket.create(filePart.getName(), inputStream, filePart.getContentType());
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InputStream inputStream = null;

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null)
		{
		   
		    // obtains input stream of the upload file
		    inputStream = filePart.getInputStream();
		    
		}

		
		Storage storage = StorageOptions.getDefaultInstance().getService();
		HttpSession hs = request.getSession();
		String bucketName = (String)hs.getAttribute("contact");
		Bucket bucket = storage.get(bucketName);
		// Upload a blob to the bucket
		Blob blob = bucket.create(filePart.getSubmittedFileName(), inputStream, filePart.getContentType());
	   
		response.sendRedirect("select.jsp?success=Uploaded%20Successfully");
	
	}

}
