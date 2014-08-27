(->
  takePicture = document.querySelector("#take-picture")
  showPicture = document.querySelector("#show-picture")

  showPictureWrap = document.querySelector("#show-picture-wrap")
  canvas = document.querySelector "#canvas"
  
  html = document.querySelector('#html')
  btn = document.querySelector ".btn"

  btn.onclick = ->
    html2canvas showPictureWrap, 
      onrendered: (canvas) ->
        html.className = "save"
        showPicture.src = canvas.toDataURL()


  showPicture.onload = ->
    context = canvas.getContext '2d'
    context.drawImage showPicture, 0, 0, 320, 200



  if takePicture and showPicture
    
    takePicture.onchange = (event) ->
      
      files = event.target.files
      file = undefined
      if files and files.length > 0
        file = files[0]
        try
          
          URL = window.URL or window.webkitURL
          
          imgURL = URL.createObjectURL(file)

          showPicture.src = imgURL

          html.className = "show"

        catch e
          try
            
            fileReader = new FileReader()
            fileReader.onload = (event) ->
              showPicture.src = event.target.result


            fileReader.readAsDataURL file
          catch e
            

)()