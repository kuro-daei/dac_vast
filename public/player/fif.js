
document.addEventListener('DOMContentLoaded', function(){
  var show = document.getElementById('show');
  show.addEventListener('click', function(){
    var url = document.getElementById('vast').value;
    var adspace = document.getElementById('adspace');
    adspace.innerHTML = "";
    var iframe = document.createElement('iframe');
    iframe.width = 775;
    iframe.height = 436;
    iframe.frameBorder = "1";
    iframe.scrolling = "no";
    iframe.marginWidth = 0;
    iframe.marginHeight = 0;
    iframe.src = "about:self";
    adspace.appendChild(iframe);
    var doc = iframe.contentWindow.document;
    doc.open();
    var rnd = Math.round(new Date().getTime() / 1000);
    var d = "";
    d += '<html><head></head>';
    d += '<body>';
    d += '<script src="./index.js?rnd=' + rnd + '"></script>';
    d += '<script>';
    d += 'inDapIF = true;';
    d += 'var vastUrl = "' + url + '";';
    d += '</script>';
    d += '</body></html>';
    doc.write(d);
    doc.close();
  });
});
