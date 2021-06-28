$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    clone = false;
    $("#gray").hide();
    $("#gray2").hide();
    $("#popUpCheck").hide();
    document.getElementById("addNewLine").disabled = true;
    var windowsW = $(document).width();
    var windowsH = $(document).height();
    $("#gray").css("width", windowsW);
    $("#gray").css("height", windowsH);
    $("#gray2").css("width", windowsW);
    $("#gray2").css("height", windowsH);
    //תגדיר לתוך משתנים את האורך והרוחב של החלון
    var windowsW = $(document).width();
    var windowsH = $(document).height();

    //תגדיר ערכים אלה לפאנל של החלון האפור
    //יגרום לכך שהחלון האפור תמיד יהיה בגודל של החלון שלנו
    $("#grayWindows").css("width", windowsW);
    $("#grayWindows").css("height", windowsH);
    //בהקלדה בתיבת הטקסט
    $(".CharacterCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".CharacterCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });


    //פונקציה שמקבלת את תיבת הטקסט שבה מקלידים ובודקת את מספר התווים
    function checkCharacter(myTextBox) {

        //משתנה למספר התווים הנוכחי בתיבת הטקסט
        var countCurrentC = myTextBox.val().length;

        //משתנה המכיל את מספר התווים שמוגבל לתיבה זו
        var CharacterLimit = myTextBox.attr("CharacterLimit");

        //בדיקה האם ישנה חריגה במספר התווים
        if (countCurrentC > CharacterLimit) {

            //מחיקת התווים המיותרים בתיבה
            myTextBox.val(myTextBox.val().substring(0, CharacterLimit));
            //עדכון של מספר התווים הנוכחי
            countCurrentC = CharacterLimit;

        }

        //משתנה המקבל את שם הלייבל המקושר לאותה תיבת טקסט 
        var LableToShow = myTextBox.attr("CharacterForLabel");
        //בדיקה שאכן הזמן כתוב כמספר אחרת לא יעבוד
        var stringOrNot = isNaN($("#time").val());
        //הדפסה כמה תווים הוקלדו מתוך כמה
        $("#" + LableToShow).text(countCurrentC + "/" + CharacterLimit);

        if (countCurrentC >= 1 && stringOrNot==false) {
            document.getElementById("addNewLine").disabled = false;
            console.log("אני נעובד");
            console.log(stringOrNot);
        }
        else {
            document.getElementById("addNewLine").disabled = true;
        }
    }


    //קישור לנספחים

})

function newActClick() {
    //משתנה המונע שכפול מרובה 
    $("#popUpAct").show();
    $("#gray").show();
  

}
function closeNewActPopUp() {
    $("#popUpAct").hide();
    $("#gray").hide();
}
function openCheckpop() {
    $("#gray2").show();
    $("#popUpCheck").show();

}
function closeCheckpop() {
    $("#gray2").hide();
    $("#popUpCheck").hide();
}
function removeExistFunc() {
    var buttonHid = $("#removeTagsFunc");
    buttonHid.click();
}
function Confirm() {
    $('#myModal').modal('show');
}