/* by Steven Yang, Feb 2015, originally for www.mathscore.com.  This code is free for anybody to use as long as you include this comment.  */
function FacebookFeedDialog(appID, linkTarget, redirectTarget) {
  this.mParams = {
    app_id: appID,
    link: linkTarget,
    redirect_uri: redirectTarget,
    display: "popup"
  }
};

/* Common params include:
   name - the title that appears in bold font
   description - the text that appears below the title
   picture - complete URL path to the image on the left of the dialog
   caption - replaces the link text
*/
FacebookFeedDialog.prototype.addParam = function(key, value) {
  this.mParams[key] = value;
};

FacebookFeedDialog.prototype.open = function() {

  var url = 'https://www.facebook.com/dialog/feed?' + encodeCGIArgs(this.mParams);
  popup(url, 'feedDialog', 700, 400);
};

/* Takes a param object like this:
   { arg1: "value1", arg2: "value2" }
   and converts into CGI args like this:
   arg1=value1&arg2=value2

   The values and args will be properly URI encoded
*/
function encodeCGIArgs(paramObject) {

  var result = '';

  for (var key in paramObject) {
    if (result)
      result += '&';
    result += encodeURIComponent(key) + '=' + encodeURIComponent(paramObject[key]);
  }

  return result;
}

function popup(mylink,windowname,width,height) {
  if (!window.focus) return;
  var href;
  if (typeof(mylink) == 'string')
    href=mylink;
  else
    href=mylink.href;
  if (!windowname)
    windowname='mywindow';
  if (!width)
    width=600;
  if (!height)
    height=350;
  window.open(href, windowname, 'resizable=yes,width='+width+',height='+height+',scrollbars=yes');
}