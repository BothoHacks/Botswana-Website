

$(document).scroll(function() {
  var dHeight = $(this).height()-$(window).height();
  if (dHeight >= $(this).scrollTop()) {
    var elements = document.getElementsByClassName("color-overlay");
    element = getComputedStyle(elements[0]).getPropertyValue('background');
    //Get values
    colors = element.split(', ');
    colors[0] = parseFloat(colors[0].split('(')[1]);
    colors[1] = parseFloat(colors[1]);
    colors[2] = parseFloat(colors[2]);
    //Correct missing alpha
    if (colors.length == 3)
      colors[3] = 1;
    //Apply new style
    colors[3] = 1.5*($(this).scrollTop() / dHeight)+.7;
    colors = 'rgba(' + colors.join(',') + ')';
    elements[0].style.backgroundColor = colors;
    // $('color-overlay').css('background', 'rgba(34,34,34,'+ $(this).scrollTop() / dHeight + ')');
  }
});
