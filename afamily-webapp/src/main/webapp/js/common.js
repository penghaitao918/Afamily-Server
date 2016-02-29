var basePath = (function() {
    var url = window.location + "";
    var h = url.split("//");
    var x = h[1].split("/");
    return h[0] + "//" + window.location.host + "/" + x[1] + "/";
})();

function doError(data){
    if(data.status==404){
        toast.error("未找到请求地址");
        return
    }
    if(data.statusText.indexOf("Failure")!=-1){
        toast.error("操作超时，请检查网络连接");
        return
    }
    if(data.statusText=="timeout"){
        toast.error("操作超时，请检查网络连接");
    }else{
        toast.error(data.responseText);
    }
}
