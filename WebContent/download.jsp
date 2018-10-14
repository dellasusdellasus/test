<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="com.google.cloud.storage.BlobId"%>
<%@page import="com.google.cloud.storage.Blob"%>
<%@page import="com.google.cloud.storage.StorageOptions"%>
<%@page import="com.google.cloud.storage.Storage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    // The name of the bucket to access
 String bucketName = (String)session.getAttribute("contact");

// The name of the remote file to download
String srcFilename = request.getParameter("filename");

//Instantiate a Google Cloud Storage client
Storage storage = StorageOptions.getDefaultInstance().getService();



// The path to which the file should be downloaded
 Path destFilePath = Paths.get("/root/Downloads/"+srcFilename);
out.println("Downloaded to : "+destFilePath.toString());
// Get specific file from specified bucket
Blob blob = storage.get(BlobId.of(bucketName, srcFilename));

// Download file to specified path
blob.downloadTo(destFilePath);

%>    
