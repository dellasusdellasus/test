<%@page import="com.google.cloud.storage.Bucket"%>
<%@page import="com.google.cloud.storage.StorageOptions"%>
<%@page import="com.google.cloud.storage.Storage"%>
<%@page import="com.google.cloud.storage.BlobId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<%

//Credentials are inferred from the environment.
Storage storage = StorageOptions.getDefaultInstance().getService();


String bucketname =  (String)session.getAttribute("contact");
//get the bucket
Bucket bucket = storage.get(bucketname);

String blobName = request.getParameter("blobname");
   
    BlobId blobId = BlobId.of(bucketname, blobName);
boolean deleted = storage.delete(blobId);
if (deleted) {
  response.sendRedirect("view.jsp");
} 

 %>