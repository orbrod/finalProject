$(document).ready(function () {

    var check = false;
    //הסתרת סינונים
    //$("#tagsList1").addClass("hiden");
    //$("#tagsList2").addClass("hiden");
    //$("#tagsList3").addClass("hiden");
    //$("#populationBtn").addClass("hiden");
    //$("#agesBtn").addClass("hiden");
    //$("#extra").addClass("hiden");
    $("#background").hide();
    $("#breadcrumbsMenu").hide();
    $("#tagsPanel").addClass("hiden");
    document.getElementById("continuNewAct").disabled = true;
    $('[data-toggle="tooltip"]').tooltip();
    //$("#chooseActType").hide();
    //$("#chooseTags").hide();
    //document.getElementById("chooseActType").style.visibility = "hidden";
    //document.getElementById("chooseTags").style.visibility = "hidden";
    clone = false;
    //תגדיר לתוך משתנים את האורך והרוחב של החלון
    var windowsW = $(document).width();
    var windowsH = $(document).height();

    //תגדיר ערכים אלה לפאנל של החלון האפור
    //יגרום לכך שהחלון האפור תמיד יהיה בגודל של החלון שלנו
    $("#grayWindows").css("width", windowsW);
    $("#grayWindows").css("height", windowsH);
    $("#gray").css("width", windowsW);
    $("#gray").css("height", windowsH);
    $("#gray").hide();
    
    //פופ אפ עמוד אודות
    $("#aboutDiv").hide();
    $(".about").click(function () {
        $("#aboutDiv").toggle();
    });
    $(".closeAbout").click(function () {
        $("#aboutDiv").hide();
        //$("#gameIframe")[0].contentWindow.focus();
    });

    //תיבת הסבר 
    $("#welcome").html("<b>ברוכים הבאים למערכת ההדרכה של כפר נהר הירדן!</b><br/> כדי לחפש פעולות בחרו בתפריט העליון בסוג הפעולה ולאחר מכן בחרו את הסינון המתאים ולחצו על כפתור סנן")
 //אקורדיון
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            /* Toggle between adding and removing the "active" class,
            to highlight the button that controls the panel */
            this.classList.toggle("active");

            /* Toggle between hiding and showing the active panel */
            var panel = this.nextElementSibling;
            
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
                panel.style.overflow = "auto";
            }
        });
    }


    $("#popUpAct").hide();
    $(document).on("click", ".actionSq", function () {
        var id = $(this).attr("activityId");//איידי של פעולה שנלחצה
        $("#saveInfo").val(id);
        var buttonHid = $("#Button1");
        buttonHid.click();
        
        console.log($("#saveInfo").val());
        //window.location.assign("Default.aspx");
     

    })

    //הגנות
    //בהקלדה בתיבת הטקסט
    $(".CharacterCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".CharacterCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });

    var countCurrentC;
    //פונקציה שמקבלת את תיבת הטקסט שבה מקלידים ובודקת את מספר התווים
    function checkCharacter(myTextBox) {

        //משתנה למספר התווים הנוכחי בתיבת הטקסט
         countCurrentC = myTextBox.val().length;

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
        console.log(check);
        if (countCurrentC >= 3 && check==true) {
            console.log("אני גדול מ3");
            document.getElementById("continuNewAct").disabled = false;

        }
        else if (countCurrentC <= 3) {
            console.log("אני קטן מ3");
            document.getElementById("continuNewAct").disabled = true;
        }
 
      
    }
    $("#activityType").change(
        function () {
            // Your code goes here...
            check = true;
            console.log("אני עובדת");
            if (countCurrentC >= 3 && check == true) {
                console.log("אני גדול מ3");
                document.getElementById("continuNewAct").disabled = false;

            }
            else if (countCurrentC <= 3) {
                console.log("אני קטן מ3");
                document.getElementById("continuNewAct").disabled = true;
            }
        }
    );
        $("#tagsList1").change(function () {
            console.log("יש שינויי");
            $("#filterBtn").addClass("countText");
        });
    $("#tagsList2").change(function () {
        console.log("יש שינויי");
        $("#filterBtn").addClass("countText");
    });
    $("#tagsList3").change(function () {
        console.log("יש שינויי");
        $("#filterBtn").addClass("countText");
    });

    //var input = document.getElementById("passWord");
    //input.addEventListener("keyup", function (event) {
    //    if (event.keyCode === 13) {
    //        event.preventDefault();
    //        document.getElementById("userEnt").click();
    //    }
    //});

});

var activityType;//משתנה גלובלי לשמירת סוג הפעולה שנלחצה
var clone;
var second;
function getData() {//פונקציה שמקבלת את הצק בוקסים שנבחרו ומסננת את הפעולות המתאימות מבסיס הנתונים
    $("#actionsAfterFilter").html("");
    $("#allActionsDiv").html("");
    $("#main").remove();
    $("#filterBtn").removeClass("countText");
    var mylist = document.getElementById("upperTaglist");
    mylist.innerHTML = "";
    var checkboxs = $("input[type=checkbox]:checked");
    if (checkboxs.length > 0) {
        
        console.log(checkboxs);
        var IDarray = [];
        for (var i = 0; i < checkboxs.length; i++) {
            IDarray[i] = ($(checkboxs[i]).val());
            //$("#allActionsDiv").append(IDarray[i]+",");
        }

        console.log(IDarray);
        var actTypeMenu;
        $.ajax({
            method: "GET",
            url: "Handlers/Handler.ashx",
            data: { Action: "getFilters", IDs: IDarray.toString(), actKind: activityType } //שליחת שם הפעולה שתתבצע בהנדלר
        })
            .done(function (data) { //ברגע שהפעולה הסתיימה  
                obj = JSON.parse(data);
                console.log(obj);
                console.log(obj.Table[0].activityName);
                for (var i = 0; i < obj.Table.length; i++) {
                    var id = obj.Table[i].ID;
                    console.log("הפעולה:" + obj.Table[i]);
                    $("<div/>").attr('id', "activity" + id).appendTo("#actionsAfterFilter");


                    $("#" + "activity" + id + "").append("<h3>פעילות " + obj.Table[i].activityName + " </h3>" + "</br>" + "<b>משך הפעולה: </b>" + obj.Table[i].activityDuration + " דקות" + "<br/>" + "<b>מטרות הפעולה:</b> " + obj.Table[i].activityGoal1 + ", " + obj.Table[i].activityGoal2);
                    $("#" + "activity" + id + "").attr("activityId", id);
                    switch (activityType) {
                        case "morning":
                            $("#actionsAfterFilter").children().addClass("actionSq yellow col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות בוקר";
                            break;
                        case "dayClose":
                            $("#actionsAfterFilter").children().addClass("actionSq yellow col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות סיכום יום"
                            break;
                        case "group":
                            $("#actionsAfterFilter").children().addClass("actionSq green col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות קבוצה";
                            break;
                        case "endCamp":
                            $("#actionsAfterFilter").children().addClass("actionSq blue col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות סיכום ופרידה";
                            break;
                        case "otef":
                            $("#actionsAfterFilter").children().addClass("actionSq purple col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות מתחמים";
                            break;
                        case "community":
                            $("#actionsAfterFilter").children().addClass("actionSq purple col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות קהילתי";
                            break;
                        case "intro":
                            $("#actionsAfterFilter").children().addClass("actionSq red col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                            actTypeMenu = "פעילות היכרות ותקנון";
                            break;
                    }

                }





            })
            .fail(function (error) { //במצב של שגיאה  
                console.log("error");
                console.log(error.statusText);
            })

        //תפריט פירורי לחם עליון מראה למשתשמ איפה הוא נמצא ואיזה סינונים בחר
        $.ajax({
            method: "GET",
            url: "Handlers/Handler.ashx",
            data: { Action: "showTags", IDs: IDarray.toString() }
        })
            .done(function (data) {
                obj = JSON.parse(data);
                for (var i = 0; i < obj.Table.length; i++) {
                    var tagName = document.createElement("span");
                    var text = document.createTextNode(obj.Table[i].TagTitle);
                    tagName.appendChild(text);
                    if (i != obj.Table.length - 1) {
                        $("#upperTaglist").append(tagName);
                        var bullet = document.createElement("p");
                        bullet.innerHTML = "&#8226";

                        $("#upperTaglist").append(bullet);
                    }
                    else {
                        $("#upperTaglist").append(tagName);
                    }

                    console.log(obj.Table[i].TagTitle);
                }
                //console.log(obj.Table[0].TagTitle);
            })
            .fail(function (error) { //במצב של שגיאה  
                console.log("error");
                console.log(error.statusText);
            })
    }
    else {
        getSpesificActs(activityType);
        console.log("לא סומנו סינונים");
    }
}
function showfilters() {
    //$("#tagsList1").removeClass("hiden");
    
    //$("#tagsList2").removeClass("hiden");
    //$("#tagsList3").removeClass("hiden");
    //$("#populationBtn").removeClass("hiden");
    //$("#agesBtn").removeClass("hiden");
    //$("#extra").removeClass("hiden");
    $("#tagsPanel").removeClass("hiden");
}
//פונקציות הקורות בעת לחיצה על אחד מכפתורי התפריט
var p;
var extarP;
function morningAct1() {
    
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "morning";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות בוקר");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        extarP = document.createElement("span");
        extarP.innerHTML = "פעילויות יומיות";
        $("#activityKind2").append(extarP);
        p = document.createElement("span");
        p.innerHTML = "פעילות בוקר";
        $("#activityKind").append(p);
        second = true;
    }
    else {
        p.innerHTML = "פעילות בוקר";
        if (second == true) {
            extarP.innerHTML = "פעילויות יומיות";
            $("#activityKind2").show();
        }
        else {
            extarP = document.createElement("span");
            extarP.innerHTML = "פעילויות יומיות";
            $("#activityKind2").append(extarP);
            $("#activityKind2").show();
            second = true;
        }

    }
    
}
function dayClose1() {
    
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "dayClose";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות סיכום יום");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        extarP = document.createElement("span");
        extarP.innerHTML = "פעילויות יומיות";
        $("#activityKind2").append(extarP);
        p = document.createElement("span");
        p.innerHTML = "פעילות סיכום יום";
        $("#activityKind").append(p);
        second = true;
    }
    else {
        p.innerHTML = "פעילות בוקר";
        if (second == true) {
            extarP.innerHTML = "פעילויות יומיות";
            $("#activityKind2").show();
        }
        else {
            extarP = document.createElement("span");
            extarP.innerHTML = "פעילויות יומיות";
            $("#activityKind2").append(extarP);
            $("#activityKind2").show();
            second = true;
        }

    }
}
function groupAct1() {
    
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "group";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות קבוצה");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        p = document.createElement("span");
        p.innerHTML = "פעילות קבוצה";
        $("#activityKind").append(p);
        $("#activityKind2").hide();

    }
    else {
        p.innerHTML = "פעילות קבוצה";
        $("#activityKind2").hide();
    }
   
}
function endCampAct1() {
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "endCamp";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות סיכום ופרידה");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        p = document.createElement("span");
        p.innerHTML = "פעילות סיכום ופרידה";
        $("#activityKind").append(p);
        $("#activityKind2").hide();
    }
    else {
        p.innerHTML = "פעילות סיכום ופרידה";
        $("#activityKind2").hide();
    }
}
function otefAct1() {
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "otef";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות מתחמים");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        extarP = document.createElement("span");
        extarP.innerHTML = "פעילויות עוטף";
        $("#activityKind2").append(extarP);
        p = document.createElement("span");
        p.innerHTML = "פעילות מתחמים";
        $("#activityKind").append(p);
        second = true;
    }
    else {
        p.innerHTML = "פעילות מתחמים";
        if (second == true) {
            extarP.innerHTML = "פעילויות עוטף";
            $("#activityKind2").show();
        }
        else {
            extarP = document.createElement("span");
            extarP.innerHTML = "פעילויות עוטף";
            $("#activityKind2").append(extarP);
            $("#activityKind2").show();
            second = true;
        }

    }
    
}
function communityAct() {
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "community";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות קהילתי");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        extarP = document.createElement("span");
        extarP.innerHTML = "פעילויות עוטף";
        $("#activityKind2").append(extarP);
        $("#breadcrumbsMenu").show();
        p = document.createElement("span");
        p.innerHTML = "פעילות קהילתי";
        $("#activityKind").append(p);
    }
    else {
        p.innerHTML = "פעילות קהילתי";
        if (second == true) {
            extarP.innerHTML = "פעילויות עוטף";
            $("#activityKind2").show();
        }
        else {
            extarP = document.createElement("span");
            extarP.innerHTML = "פעילויות עוטף";
            $("#activityKind2").append(extarP);
            $("#activityKind2").show();
            second = true;
        }

    }
}
function introAct1() {
    $("#main").remove();
    $("#background").show();
    $("#actionsAfterFilter").html("");
    $('input:checkbox').removeAttr('checked');
    activityType = "intro";
    getSpesificActs(activityType);
    $("#headLine").html("פעילויות היכרות ותקנון");
    showfilters();
    if ($("#breadcrumbsMenu").is(":hidden")) {
        $("#breadcrumbsMenu").show();
        p = document.createElement("span");
        p.innerHTML = "פעילות היכרות ותקנון";
        $("#activityKind").append(p);
        $("#activityKind2").hide();
    }
    else {
        p.innerHTML = "פעילות היכרות ותקנון";
        $("#activityKind2").hide();
    }
}
//הצגת כלל הפעולות בהתאם לסוג הפעולה שנבחר
function getSpesificActs(activityKind) {
    var actTypeMenu;
    $("#allActionsDiv").html("");
    $.ajax({
        method: "GET",
        url: "Handlers/Handler.ashx",
        data: { Action: "getSpesificAct", actKind1:activityKind } //שליחת שם הפעולה שתתבצע בהנדלר
    })
        .done(function (data) { //ברגע שהפעולה הסתיימה  
            obj = JSON.parse(data);
            //console.log(obj);
            //console.log(obj.Table[0].activityName);
            for (var i = 0; i < obj.Table.length; i++) {
                var id = obj.Table[i].ID;
                //var f = showAct(obj.Table, i);
               
                $("<div/>").attr('id', "activity" + id).appendTo("#allActionsDiv");
            
                $("#" + "activity" + id + "").append("<h3>פעילות " + obj.Table[i].activityName+" </h3>" + "</br>" + "<b>משך הפעולה: </b>" + obj.Table[i].activityDuration + " דקות" + "<br/>" + "<b>מטרות הפעולה:</b> " + obj.Table[i].activityGoal1 + ", " + obj.Table[i].activityGoal2);
                $("#" + "activity" + id + "").attr("activityId", id);//הוספת אטריביוט 
                
                switch (activityType) {
                    case "morning":
                        $("#allActionsDiv").children().addClass("actionSq yellow col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות בוקר";
                        break;
                    case "dayClose":
                        $("#allActionsDiv").children().addClass("actionSq yellow  col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות סיכום יום";
                        break;
                    case "group":
                        $("#allActionsDiv").children().addClass("actionSq green col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות קבוצה";
                        break;
                    case "endCamp":
                        $("#allActionsDiv").children().addClass("actionSq blue col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות סיכום ופרידה";
                        break;
                    case "otef":
                        $("#allActionsDiv").children().addClass("actionSq purple col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות מתחמים";
                        break;
                    case "community":
                        $("#allActionsDiv").children().addClass("actionSq purple col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות קהילתי";
                        break;
                    case "intro":
                        $("#allActionsDiv").children().addClass("actionSq red  col-lg-offset-1 col-lg-2 col-lg-offset-1 col-xs-12");
                        actTypeMenu = "פעילות היכרות ותקנון";
                        break;
                }
               
            }
            

            var divs = $("#allActionsDiv").children();
            
            for (var i = 0; i < divs.length; i++) {
                console.log(divs[i]);
                //divs[i].onclick(showAct(obj.Table, i));
                //divs[i].on("click", showAct(obj.Table,i));
                //document.getElementById(i).on("click", f);
                //divs[i].addEventListener("click", showAct(obj.Table, i));
                
            }
            //console.log(divs);
            
            //$("#allActionsDiv").html(data);
        })
        .fail(function (error) { //במצב של שגיאה  
            console.log("error");
            console.log(error.statusText);
        })
 

}

function newActClick() {
    //משתנה המונע שכפול מרובה 
     $("#popUpAct").show();
    $("#gray").show();
    if (clone == false) {
        
        $("#tagsList1").clone().removeClass().addClass("popUpCheck col-lg-3 col-md-3").appendTo("#containTags");
       
        $("#tagsList2").clone().removeClass().addClass("popUpCheck col-lg-3 col-md-3").appendTo("#containTags");
        
        $("#tagsList3").clone().removeClass().addClass("popUpCheck col-lg-3 col-md-3").appendTo("#containTags");
        clone = true;
    }
       
    
   
    //הסרת כל סימוני הצק בוקס
    $('input:checkbox').removeAttr('checked');
    
}
function Confirm() {
    $('#myModal').modal('show');
}










