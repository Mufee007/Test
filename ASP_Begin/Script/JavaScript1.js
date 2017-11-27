
    var msgBoxTimeout;
var timeToShow = 10000;
var msgBoxRight = -320;

function ShowMessage(msg, type) {
    clearInterval(msgBoxTimeout);
    $("#divMessageBody").css("right", msgBoxRight);

    var classAttr = "message-box " + type;
    $("#divMessage").html(msg);
    $("#divMessageBody").attr("class", classAttr);

    $("#divMessageBody").stop().animate({
        right: "0px"
    }, 700, "easeInOutCirc");

    msgBoxTimeout = setTimeout(function () {
        HideMessage();
    }, timeToShow);
}

function HideMessage() {
    $("#divMessageBody").stop().animate({
        right: msgBoxRight
    }, 900, "easeInOutCirc");

    clearInterval(msgBoxTimeout);
}