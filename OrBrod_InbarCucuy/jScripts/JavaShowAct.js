$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    //תגדיר לתוך משתנים את האורך והרוחב של החלון
    //var windowsW = $(document).width();
    //var windowsH = $(document).height();

    //תגדיר ערכים אלה לפאנל של החלון האפור
    //יגרום לכך שהחלון האפור תמיד יהיה בגודל של החלון שלנו
    //$("#grayWindows").css("width", windowsW);
    //$("#grayWindows").css("height", windowsH);
    //$("#grayWindows2").css("width", windowsW);
    //$("#grayWindows2").css("height", windowsH);
    if ($("#newcomment").is(":hidden")==false) {
        document.getElementById("addNewComment").disabled = true;
    }
    

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

        //הדפסה כמה תווים הוקלדו מתוך כמה
        $("#" + LableToShow).text(countCurrentC + "/" + CharacterLimit);
        if (countCurrentC >= 3) {
            document.getElementById("addNewComment").disabled = false;
            console.log("אני נעובד");
        }
        else {
            document.getElementById("addNewComment").disabled = true;
        }
    }
})

function Confirm() {
    $('#myModal').modal('show');
}