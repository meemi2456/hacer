<!DOCTYPE html>
<html lang="ar">
<head>
  <meta charset="UTF-8">
  <title>رفع ملفات</title>
</head>
<body style="text-align: center; padding: 50px;">
  <h2>اختر الملفات لرفعها</h2>
  <input type="file" id="fileInput" multiple>
  <br><br>
  <button onclick="uploadFiles()">رفع الملفات</button>

  <script>
    function uploadFiles() {
      const files = document.getElementById('fileInput').files;
      if (files.length === 0) {
        alert("يرجى اختيار ملفات أولاً");
        return;
      }

      const formData = new FormData();
      for (let i = 0; i < files.length; i++) {
        formData.append('files[]', files[i]);
      }

      fetch('https://your-server.com/upload', {
        method: 'POST',
        body: formData
      })
      .then(response => response.text())
      .then(result => alert("تم رفع الملفات بنجاح!"))
      .catch(error => alert("حدث خطأ أثناء الرفع"));
    }
  </script>
</body>
</html>
