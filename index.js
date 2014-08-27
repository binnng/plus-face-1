// Generated by CoffeeScript 1.7.1
(function() {
  var btn, canvas, html, showPicture, showPictureWrap, takePicture;
  takePicture = document.querySelector("#take-picture");
  showPicture = document.querySelector("#show-picture");
  showPictureWrap = document.querySelector("#show-picture-wrap");
  canvas = document.querySelector("#canvas");
  html = document.querySelector('#html');
  btn = document.querySelector(".btn");
  btn.onclick = function() {
    return html2canvas(showPictureWrap, {
      onrendered: function(canvas) {
        html.className = "save";
        return showPicture.src = canvas.toDataURL();
      }
    });
  };
  showPicture.onload = function() {
    var context;
    context = canvas.getContext('2d');
    return context.drawImage(showPicture, 0, 0, 320, 200);
  };
  if (takePicture && showPicture) {
    return takePicture.onchange = function(event) {
      var URL, e, file, fileReader, files, imgURL;
      files = event.target.files;
      file = void 0;
      if (files && files.length > 0) {
        file = files[0];
        try {
          URL = window.URL || window.webkitURL;
          imgURL = URL.createObjectURL(file);
          showPicture.src = imgURL;
          return html.className = "show";
        } catch (_error) {
          e = _error;
          try {
            fileReader = new FileReader();
            fileReader.onload = function(event) {
              return showPicture.src = event.target.result;
            };
            return fileReader.readAsDataURL(file);
          } catch (_error) {
            e = _error;
          }
        }
      }
    };
  }
})();
