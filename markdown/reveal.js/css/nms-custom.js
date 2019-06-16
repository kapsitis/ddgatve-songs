function main() {

    // KAP
    var applyHeaderStyles = function() {
        var x = document.getElementsByTagName("h1");
        console.log("Found h1 elements: " + x.length);
/* 
       for (i = 0; i < x.length; i++) {
            if (x[i].innerHTML.indexOf("lo-sample") !== -1) {
                x[i].classList.add('sample');
		theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'sample'");		
            } else if (x[i].innerHTML.indexOf("lo-summary") !== -1) {
                x[i].classList.add('summary');
		theAsterisk = getAsterisk();
		x[i].parentNode.insertBefore(theAsterisk,x[i].parentNode.firstChild);
                console.log("Added class 'summary'");
            } else {
                x[i].classList.add('default');
            }
        }
*/
    };

    var applyLogo = function() {
        var x = document.getElementsByClassName("slide-1");
        console.log("Found first slide");
        theLogo = getLogo();
        x[0].insertBefore(theLogo,x[0].firstChild);
    };

    var fixImageLinks = function() {
        var x = document.getElementsByTagName("img");
        for (i = 0; i < x.length; i++) {
            var ss = x[i].getAttribute("src");
            if (ss.startsWith("instructional-design/slides/")) {
                var n = ss.lastIndexOf("/");
                x[i].setAttribute("src",ss.substring(n+1));
            }
        }
    };

    // initialize
    (function() {

	// KAP
	applyHeaderStyles();

    })();
}
