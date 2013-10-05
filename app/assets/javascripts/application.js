// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$( document ).ready(function() {
draw();
});


var colors = ["#B8D430", "#3AB745", "#029990", "#3501CB",
    "#2E2C75", "#673A7E", "#CC0071", "#F80120",
    "#F35B20", "#FB9A00", "#FFCC00", "#FEF200"];
var special_offers = ["100% Bonus", "Free Bet", "Double SP", "Money Back",
    "50% Bonus", "Price Boost", "On The Dogs", "Odds You Win",
    "Faller Wins", "25% Bonus", "Match Bet", "Round Up"];

var startAngle = 0;
var arc = Math.PI / 6;
var spinTimeout = null;

var spinTime = 100;
var spinTimeTotal = 40;

var ctx;

var result;

var current_spin_id;

function draw() {
    drawRouletteWheel();
}

function drawRouletteWheel() {
    var canvas = document.getElementById("wheelcanvas");
    if (canvas.getContext) {
        var outsideRadius = 200;
        var textRadius = 175;
        var insideRadius = 160;

        ctx = canvas.getContext("2d");
        ctx.clearRect(0, 0, 500, 500);


        ctx.strokeStyle = "black";
        ctx.lineWidth = 2;

        ctx.font = 'bold 13px sans-serif';
        ctx.fontFamily = 'impact sans-serif';

        for (var i = 0; i < 12; i++) {
            var angle = startAngle + i * arc;
            ctx.fillStyle = colors[i];

            ctx.beginPath();
            ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
            ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
            ctx.stroke();
            ctx.fill();

            ctx.save();
            ctx.shadowOffsetX = +1;
            ctx.shadowOffsetY = +1;
            ctx.shadowBlur = 4;
            ctx.shadowSpread = 3;
            ctx.strokeStyle = "black";
            ctx.stroke();

            ctx.shadowColor = "rgb(0,0,0)";
            ctx.fillStyle = "white";

            ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 250 + Math.sin(angle + arc / 2) * textRadius);
            ctx.rotate(angle + arc / 2 + Math.PI / 2);
            var text = special_offers[i];
            ctx.fillText(text, -ctx.measureText(text).width / 2, 0);

            ctx.strokeText(text, 10, 200);

            ctx.restore();
        }

        //Arrow
        var vertical = 200;
        var horizontal = 250;
        ctx.fillStyle = "#FFCC00";
        ctx.strokeStyle = "black"
        ctx.beginPath();
        ctx.moveTo(horizontal - 16, vertical - (outsideRadius + 20));
        ctx.lineTo(horizontal + 16, vertical - (outsideRadius + 20));
        ctx.lineTo(horizontal + 16, vertical - (outsideRadius - 20));
        ctx.lineTo(horizontal + 36, vertical - (outsideRadius - 20));
        ctx.lineTo(horizontal + 0, vertical - (outsideRadius - 52));
        ctx.lineTo(horizontal - 36, vertical - (outsideRadius - 20));
        ctx.lineTo(horizontal - 16, vertical - (outsideRadius - 20));
        ctx.lineTo(horizontal - 16, vertical - (outsideRadius + 20));
        ctx.fill();
    }
}

function spin() {
    $("input[type=button]").attr("disabled", "disabled");
//    $('#spin_details').empty();
    spinAngleStart = Math.random() * 10 + 10;
    spinTime = 0;
    spinTimeTotal = Math.random() * Math.random() * 3 + 4 * 2000;
    create_spin();
    rotateWheel();

}

function create_spin() {
// Assign handlers immediately after making the request,
// and remember the jqxhr object for this request
    var new_spin = {
        "spin": {
            "location_id": "1",
            "user_id": "1",
            "session_id": "1"
        }
    };
    $.ajax({
        type: "POST",
        url: "http://evening-castle-3789.herokuapp.com//spins.json",
        cache: false,
        data: new_spin,
        dataType: "json",
        success: new_spin_id_received
    });
}

function new_spin_id_received(data){
    current_spin_id = data.id
    $("#spin_details").prepend('<br />')
    $("#spin_details").prepend(data.off_time);
    $("#spin_details").prepend('Off time: ');
    $("#spin_details").prepend('<br />');
    $("#spin_details").prepend(data.id);
    $("#spin_details").prepend('Spin ID: ');

}
function rotateWheel() {
    spinTime += 30;
    if (spinTime >= spinTimeTotal) {
        stopRotateWheel();
        return;
    }
    var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
    startAngle += (spinAngle * Math.PI / 180);
    drawRouletteWheel();
    spinTimeout = setTimeout('rotateWheel()', 30);
}

function stopRotateWheel() {
    clearTimeout(spinTimeout);
    // Code Duplication 1
    var degrees = startAngle * 180 / Math.PI + 90;
    var arcd = arc * 180 / Math.PI;
    var index = Math.floor((360 - degrees % 360) / arcd);
    ctx.save();
    ctx.font = 'bold 46px sans-serif';
    var text = special_offers[index];
    ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
    send_result();
    ctx.restore();
}

function send_result(){
    // Code Duplication 1
    var degrees = startAngle * 180 / Math.PI + 90;
    var arcd = arc * 180 / Math.PI;
    var index = Math.floor((360 - degrees % 360) / arcd);
    var text = special_offers[index];
    var update_spin = {
        "spin":{
            "id": current_spin_id,
            "result": text
        }
    }
    $.ajax({
        type: "PUT",
        url: "http://evening-castle-3789.herokuapp.com/spins/" + current_spin_id + ".json",
        cache: false,
        data: update_spin,
        dataType: "json"
    });
    $("#spin_details").prepend('<br />');
    $("#spin_details").prepend(text);
    $("#spin_details").prepend('Result: ');
    $("#spin_details").prepend('<br />');
    $("#spin_details").prepend('- - - - - - - - - - - - - - - - - - - - - - - - ');
    setTimeout(function(){
        $("input[type=button]").removeAttr("disabled");
    },250);


}

function easeOut(t, b, c, d) {
    var ts = (t /= d) * t;
    var tc = ts * t;
    return b + c * (tc + -3 * ts + 3 * t);
}