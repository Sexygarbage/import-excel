var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
// ... give time for script to load, then type.
jQuery.noConflict();

$(document).ready(function () {

    var val = $("h3.r:first").children("a").attr("href");

    console.log(val)

});

$(document).ready(function () {

    var val = $("div.rg_di").slice(2).children("a").children("img").attr("src");

    console.log(val)

});

$(document).ready(function () {

    var val = $("div.rg_di").slice(2).children("a").children("img").trigger("mouseclick").attr("src");

    console.log(val)

});

$(document).ready(function () {

   var clipboard = require("sdk/clipboard"); 
   var val = $("div.rg_di").slice(2).children("a").children("img").trigger("mouseclick").attr("src");

   clipboard.set(val);
});
$(document).ready(function () {
    
    var a = $("h3.r:first").children("a")[0];
    
    a.onmousedown();
    
    console.log(a.href)

});


$(document).ready(function () {
    
    var val = $("h3.r:first").children("a").trigger("mousedown").prop("href");
    
    console.log(val)

});

var element = $("div.rg_di").slice(2).children("a").children("img");
$(element[0].attributes).each(function () {
    console.log(this.nodeName + ':' + this.nodeValue);
});