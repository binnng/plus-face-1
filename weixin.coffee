(->
  onBridgeReady = ->
  
    #转发朋友圈
    WeixinJSBridge.on "menu:share:timeline", (e) ->
      url = location.href
      img = "#{url}/god.jpg"
      data =
        img_url: img
        img_width: "120"
        img_height: "120"
        link: url
        
        #desc这个属性要加上，虽然不会显示，但是不加暂时会导致无法转发至朋友圈
        desc: "新头像，我骄傲，你也来做个吧！"
        title: "我做了个新头像，邀请你一起玩坏处女座！"

      WeixinJSBridge.invoke "shareTimeline", data, (res) ->
        WeixinJSBridge.log res.err_msg


    
    #分享给朋友
    WeixinJSBridge.on "menu:share:appmessage", (argv) ->
      url = location.href
      WeixinJSBridge.invoke "sendAppMessage",
        img_url: img
        img_width: "120"
        img_height: "120"
        link: url
        desc: "新头像，我骄傲，你也来做个吧！"
        title: "我做了个新头像，邀请你一起玩坏处女座！"
      , (res) ->
        WeixinJSBridge.log res.err_msg



  #执行
  try
    document.addEventListener "WeixinJSBridgeReady", ->
      onBridgeReady()

)()