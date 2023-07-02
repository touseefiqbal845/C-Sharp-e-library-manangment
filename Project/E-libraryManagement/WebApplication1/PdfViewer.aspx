<%@ Page Language="C#" AutoEventWireup="true" Codefile="PdfViewer.aspx.cs" Inherits="WebApplication1.PdfViewer" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
<head>
    <script src="pdf.js-master/pdf.js-master/src/pdf.js"></script>
    <title>PDF Viewer</title>
    <style>
        #pdfContainer {
            width: 100%;
            height: 600px;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">
        <div id="pdfContainer"></div>
    </form>
 <script type="module">
     import { getDocument, GlobalWorkerOptions } from './pdf.js-master/pdf.js-master/src/pdf.js';

     // Specify the worker source path
     GlobalWorkerOptions.workerSrc = './pdf.js-master/pdf.js-master/src/pdf.worker.js';

     function loadPDF(url) {
         getDocument(url).promise.then(function (pdf) {
             var pageCount = pdf.numPages;
             var container = document.getElementById("pdfContainer");

             for (var pageNumber = 1; pageNumber <= pageCount; pageNumber++) {
                 pdf.getPage(pageNumber).then(function (page) {
                     var scale = 1.5;
                     var viewport = page.getViewport({ scale: scale });

                     var canvas = document.createElement("canvas");
                     var context = canvas.getContext("2d");
                     canvas.height = viewport.height;
                     canvas.width = viewport.width;

                     container.appendChild(canvas);

                     page.render({
                         canvasContext: context,
                         viewport: viewport
                     });
                 });
             }
         });
     }

   

      // Call the loadPDF function with the URL of the PDF file
 
       var pdfUrl = "Book_inventiry/Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf";
       loadPDF(pdfUrl);
</script>


</body>
</html>
