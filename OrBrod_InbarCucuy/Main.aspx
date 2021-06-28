<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Scripts -->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <script src="jScripts/JavaScript.js"></script>
    <%--boostrap--%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- CSS -->
    <%--<link href="styles/reset.css" rel="stylesheet" />--%>
    <link href="styles/myStyle.css" rel="stylesheet" />
    <%-- <style type="text/css">
        #allActionsDiv {
            width: 811px;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" dir="rtl">

            <!--<form action="Default.aspx" method="get" id="form">
            <input id="Hidden1" type="hidden" name="actID" />
        </form>-->
            <header>
                <!--אודות ולוגו-->
                <%--<ul>
                <li><img src="Images/HIT.png" width="40" height="30" /></li>
                <li><a class="about">אודות</a></li>
                
            </ul>--%>

                <%-- תפריט לאחר הקטנה--%>

                <div id="grayHeader">

                    <div id="login" style="margin-top: 1vh" runat="server">
                        <span class="glyphicon glyphicon-log-in"></span>
                        <button type="button" id="Button2" data-toggle="modal" data-target="#myModal" runat="server">כניסת משתמש</button>

                    </div>
<%--                    <div id="user" style="margin-top: 1vh" runat="server">
                        <span class="glyphicon glyphicon-user"></span>
                        <asp:Label ID="currentUser" runat="server"></asp:Label>
                    </div>--%>
                    <div class="dropdown">
                     <button id="user" style="margin-top: 1vh; border:none" runat="server" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <asp:Label ID="currentUser" runat="server"></asp:Label>
                    </button>
                        <ul class="dropdown-menu">
                            <li><a href="#" data-toggle="modal" data-target="#myModal">החלפת משתמש</a></li>
                            <li><a href="#"><asp:Button ID="logOut" runat="server" Text="התנתקות מהמערכת" OnClick="logOut_Click" /></a></li>
                            
                        </ul>
                    </div>
                    <button type="button" class="buttonNewAct col-xs-6" id="addNewAct" data-toggle="modal" data-target="#myModal2" runat="server" onclick="newActClick()">+ הוספת פעולה חדשה</button>
                    <%--<input id="" class="buttonNewAct" type="button" runat="server" value="+ הוספת פעולה חדשה" onclick="newActClick()" />--%>
                </div>



                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <%--<a class="navbar-brand" href="#">WebSiteName</a>--%>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-right nav-justified">
                                <li><span>
                                    <a href="Main.aspx">
                                        <img src="Images/logoVTry.png" id="logoMenue" /></a></span></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle morningAct" data-toggle="dropdown" href="#">פעילות יומית<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="morningAct" href="#" id="morningAct" onclick="morningAct1()">פעילויות בוקר</a></li>
                                        <li><a class="morningAct" href="#" id="dayCloseAct" onclick="dayClose1()">פעילויות סיכום יום</a></li>
                                    </ul>
                                </li>
                                <li><a class="groupAct" href="#" id="groupAct" onclick="groupAct1()">פעילות קבוצה</a></li>
                                <li><a href="#" class="introAct" id="introAct" onclick="introAct1()">פעילויות היכרות ותקנון</a></li>
                                <li><a href="#" class="endCampAct" id="endCampAct" onclick="endCampAct1()">פעילויות סיכום ופרידה</a></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle otefAct" data-toggle="dropdown" href="#">פעילות עוטף<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="otefAct" href="#" id="otef" onclick="otefAct1()">פעילויות מתחמים</a></li>
                                        <li><a class="otefAct" href="#" id="community" onclick="communityAct()">פעילויות קהילתיות</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle extraLinks" data-toggle="dropdown" href="#">קבצים נוספים<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="extraLinks" href="https://docs.google.com/spreadsheets/d/1zAVMSVbi-hVtq2SxH-bNFPIs-7wyYfgFnJeobfs45qE/edit?usp=sharing
"
                                            target="_blank">פז"חים</a></li>
                                        <li><a class="extraLinks" href="https://docs.google.com/spreadsheets/d/15cUhsXETnN0CBsP9Ou-hZSNy2oDMRzoNsFoXRUF6V2A/edit?usp=sharing
"
                                            target="_blank">קונספט</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <%--<ul class="nav navbar-nav">        
        <li><a href="#" runat="server"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>--%>
                        </div>
                    </div>
                </nav>
                <%--תפריט ברדקראמבס--%>
                <nav aria-label="breadcrumb" class="margin" id="breadcrumbsMenu">
                    <ol class="breadcrumb mainPageBreadcrumbs">
                        <li class="breadcrumb-item"><a href="Main.aspx">דף בית</a></li>
                        <li class="breadcrumb-item active" aria-current="page" id="activityKind2"></li>
                        <li class="breadcrumb-item active" aria-current="page" id="activityKind"></li>
                    </ol>

                </nav>
                <%--פופ אפ של אודות--%>

                <div <%--id="aboutDiv"--%> class="modal fade" id="myModal3" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" id="aboutModal">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h1 class="modal-title">אודות</h1>
                            </div>
                            <h2><b>שם הפרוייקט</b></h2>
                            <h3>מערכת אינטרנטית לניהול הדרכה עבור צוות כפר נהר הירדן</h3>
                            <br />
                            <p>
                                פרויקט גמר, תשפ"א<br />
                                <a href="https://www.hit.ac.il/telem/overview" target="_blank"><u>הפקולטה לטכנולוגיות למידה</u></a>
                            </p>
                            <br />
                            <div id="HIT">
                                <img id="HITlogoAbout" style="width: 150px" src="Images/logo%20HIT%20with%20telem.JPG" />

                                <p>
                                    <b>צוות הפרויקט:</b><br />
                                    ענבר קוקוי ואור ברוד<br />
                                    <b>מנחים:</b><br />
                                    דן קליין וטל קליין
                                </p>
                            </div>
                            <br />
                            <div id="JRV">
                                <img id="jrvAboutLogo" style="width: 120px" src="Images/jrv-logo.png" />
                                <p>
                                    בשיתוף עם כפר נהר הירדן
                                <br />
                                    נציגת הארגון: גל דובו-גליקמן
                                </p>
                            </div>

                            <div style="text-align: center" class="modal-footer">
                                <div style="display: -webkit-inline-box">
                                    <span class="glyphicon glyphicon-copyright-mark"></span>
                                    <p>כל הזכויות שמורות למכון טכנולוגי חולון HIT</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </header>

            <div class="container" id="main">

                <h1>SVG Animated Birds</h1>

                <div class="bird-container bird-container--one">
                    <div class="bird bird--one"></div>
                </div>

                <div class="bird-container bird-container--two">
                    <div class="bird bird--two"></div>
                </div>

                <div class="bird-container bird-container--three">
                    <div class="bird bird--three"></div>
                </div>

                <div class="bird-container bird-container--four">
                    <div class="bird bird--four"></div>
                </div>

            </div>


            <div id="background">
                <!--צק בוקס לבחירת המשתמש-->

                <!-- Example single danger button -->
                <asp:Panel ID="tagsPanel" CssClass="btn-group brnodisplay" runat="server">
                    <div class="btn-group">
                        <%--<input class="accordion" id="populationBtn" type="button" value="אפיון אוכלוסייה" />--%>
                        <button type="button" class="btn btn-default dropdown-toggle try text-right" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            אפיון אוכלוסייה
      <span class="caret"></span>
                        </button>
                        <asp:CheckBoxList CssClass="dropdown-menu dropdown-menu-right" ID="tagsList1" runat="server" RepeatLayout="UnorderedList" Font-Bold="False">


                            <asp:ListItem Text="ראיה" Value="2" />
                            <asp:ListItem Text="שמיעה" Value="1" />
                            <asp:ListItem Text="מש'ה" Value="3" />
                            <asp:ListItem Text="אוטיזם" Value="4" />
                            <asp:ListItem Text="לקויות למידה רב בעייתי" Value="5" />
                            <asp:ListItem Text="עצמאי" Value="6" />
                            <asp:ListItem Text="פלסטינאים" Value="7" />
                            <asp:ListItem Text="בעיות התנהגות" Value="8" />
                            <asp:ListItem Text="פוסט אישפוזי" Value="9" />
                            <asp:ListItem Text="פסיכיאטרי" Value="10" />
                            <asp:ListItem Text="משפחות" Value="11" />

                        </asp:CheckBoxList>

                    </div>


                    <div class="btn-group">
                        <%--  <input class="accordion" id="agesBtn" type="button" value="גיל" />--%>
                        <button type="button" class="btn btn-default dropdown-toggle try text-right" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            גיל
      <span class="caret"></span>
                        </button>
                        <asp:CheckBoxList CssClass="dropdown-menu dropdown-menu-right" ID="tagsList2" runat="server" RepeatLayout="UnorderedList">
                            <asp:ListItem Text="5-9" Value="20" />
                            <asp:ListItem Text="9-12" Value="17" />
                            <asp:ListItem Text="13-15" Value="18" />
                            <asp:ListItem Text="16-18" Value="19" />


                        </asp:CheckBoxList>
                    </div>
                    <div class="btn-group">
                        <%--<input class="accordion" id="extra" type="button" value="סינונים נוספים" />--%>
                        <button type="button" class="btn btn-default dropdown-toggle try text-right" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            סינונים נוספים
      <span class="caret"></span>
                        </button>
                        <asp:CheckBoxList CssClass="dropdown-menu dropdown-menu-right" ID="tagsList3" runat="server" RepeatLayout="UnorderedList">

                            <asp:ListItem Text="הגבלת תזונה" Value="26" />
                            <asp:ListItem Text="הנמכה קוגניטיבית" Value="21" />
                            <asp:ListItem Text="כיסאות גלגלים" Value="22" />
                            <asp:ListItem Text="מורכבות בתקשורת" Value="23" />
                            <asp:ListItem Text="מוגבלות פיזית" Value="24" />
                            <asp:ListItem Text="מחלות נוספות" Value="25" />


                        </asp:CheckBoxList>

                        <br />
                    </div>

                    <div class="btn-group ">
                        <button type="button" id="filterBtn" class="btn btn-default dropdown-toggle try text-right" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="getData()">
                            סנן
   
                        </button>
                        <%-- <input id="filter" type="button" value="סנן" onclick="getData()" />--%>
                    </div>
                </asp:Panel>
                <h1 id="headLine"></h1>
                <div id="upperTaglist"></div>
                <!--דיבים הכילים בתוכם את הפעולות-->
                <div id="allActionsDiv" class="row "></div>
                <div id="actionsAfterFilter" class="row "></div>


                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <asp:HiddenField ID="saveInfo" runat="server" />


                <%--                <div id="gray">
                    <div id="popUpAct" class="PopUpUser">
                        <input type="button" class="Exit" value="X" onclick="closeNewActPopUp()" />
                        <h2 id="newActHead">הוספת פעולה חדשה</h2>
                        שם הפעולה:&nbsp;
            <asp:TextBox ID="actName" runat="server" CharacterForLabel="QuestLbl" CharacterLimit="50" CssClass="CharacterCount"></asp:TextBox>
                        <asp:Label ID="QuestLbl" runat="server" Text="0/50"></asp:Label>
                        <br />
                        סוג הפעולה:
             <asp:RadioButtonList ID="activityType" runat="server">

                 <asp:ListItem Text="פעילות בוקר" Value="morning" />
                 <asp:ListItem Text="פעילות סיכום יום" Value="dayClose" />
                 <asp:ListItem Text="פעילות קבוצה" Value="group" />
                 <asp:ListItem Text="פעילות היכרות ותקנון" Value="intro" />
                 <asp:ListItem Text="פעילות סיכום ופרידה" Value="endCamp" />
                 <asp:ListItem Text="פעילות מתחמים" Value="otef" />
                 <asp:ListItem Text="פעילות קהילתי" Value="community" />

             </asp:RadioButtonList>
                        
                        <br />

                        <asp:Label ID="Label1" runat="server" Text="סמן את התגיות המתאימות"></asp:Label>
                        <div class="row">
                            <h2 class="col-lg-3">אפיון אוכלוסייה</h2>
                            <h2 class="col-lg-3">גיל</h2>
                            <h2 class="col-lg-3">סינונים נוספים</h2>
                        </div>
                        <div id="containTags" class="row">
                        </div>
                        <asp:Button ID="continuNewAct" CssClass="buttonNewAct" runat="server" Text="המשך" OnClick="continuNewAct_Click" />
                    </div>
                </div>--%>
                <%--                פופ אפ של הוספת פעולה חדשה--%>
                <%--                <div class="modal fade" tabindex="-1" id="myModal2" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <h4 class="modal-title">הוספת פעולה חדשה</h4>
                            </div>
                            שם הפעולה:&nbsp;
            <asp:TextBox ID="actName" runat="server" CharacterForLabel="QuestLbl" CharacterLimit="50" CssClass="CharacterCount"></asp:TextBox>
                            <asp:Label ID="QuestLbl" runat="server" Text="0/50"></asp:Label>
                            <br />
                            <div id="popUpAct">
                                
                                סוג הפעולה:
             <asp:RadioButtonList ID="activityType" runat="server">

                 <asp:ListItem Text="פעילות בוקר" Value="morning" />
                 <asp:ListItem Text="פעילות סיכום יום" Value="dayClose" />
                 <asp:ListItem Text="פעילות קבוצה" Value="group" />
                 <asp:ListItem Text="פעילות היכרות ותקנון" Value="intro" />
                 <asp:ListItem Text="פעילות סיכום ופרידה" Value="endCamp" />
                 <asp:ListItem Text="פעילות מתחמים" Value="otef" />
                 <asp:ListItem Text="פעילות קהילתי" Value="community" />

             </asp:RadioButtonList>

                                <br />

                                <asp:Label ID="Label1" runat="server" Text="סמן את התגיות המתאימות"></asp:Label>
                                <div class="row">
                                    <h2 class="col-lg-3">אפיון אוכלוסייה</h2>
                                    <h2 class="col-lg-3">גיל</h2>
                                    <h2 class="col-lg-3">סינונים נוספים</h2>
                                </div>
                                <div id="containTags" class="row">
                                </div>
                                <asp:Button ID="continuNewAct" CssClass="buttonNewAct" runat="server" Text="המשך" OnClick="continuNewAct_Click" />
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>

            <%-- ניסיון לעשות פופ אפ של הוספת פעולה בשלבים--%>
            <div class="modal fade" tabindex="-1" id="myModal2" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="background-color: white">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">הוספת פעולה חדשה</h4>
                        </div>
                        <br />
                        <div id="topRow" class="row">
                            <div class="col-lg-4 newActTop">
                                <img id="funCircle" src="Images/fun.png" />
                            </div>
                            <div id="writeActName" class="col-lg-7 col-lg-offset-1  newActTop">
                                <div id="activityNameDiv">

                                    <span style="font-size: 16px"><b>שם הפעולה</b>:</span>
                                    <asp:TextBox ID="actName" runat="server" CharacterForLabel="QuestLbl" CharacterLimit="50" CssClass="CharacterCount"></asp:TextBox>
                                    <asp:Label ID="QuestLbl" runat="server" Text="0/50"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <br />

                        <div id="chooseActType" class="newAct">
                            <div class="radio-toolbar">
                                <p id="actKindTitle">סוג פעולה</p>
                                <asp:RadioButtonList ID="activityType" runat="server" RepeatDirection="Horizontal">

                                    <asp:ListItem Class="option1" Text="בוקר" Value="morning" />
                                    <asp:ListItem Class="option1" Text=" סיכום יום" Value="dayClose" />
                                    <asp:ListItem Class="option1" Text=" קבוצה" Value="group" />
                                    <asp:ListItem Class="option1" Text=" היכרות ותקנון" Value="intro" />
                                    <asp:ListItem Class="option1" Text=" סיכום ופרידה" Value="endCamp" />
                                    <asp:ListItem Class="option1" Text=" מתחמים" Value="otef" />
                                    <asp:ListItem Class="option1" Text=" קהילתית" Value="community" />

                                </asp:RadioButtonList>

                                <%-- <label for="activityType_0">פעילות בוקר</label>
                                <label for="activityType_1">פעילות סיכום יום</label>
                                <label for="activityType_2">פעילות קבוצה</label>
                                <label for="activityType_3">פעילות היכרות ותקנון</label>--%>
                            </div>
                        </div>

                        <br />

                        <div id="chooseTags" class="newAct">
                            <asp:Label ID="Label1" runat="server" Text="סמן את התגיות המתאימות"></asp:Label>
                            <div id="allInCenter">
                                <div class="row">
                                    <h2 class="col-lg-3">אפיון אוכלוסייה</h2>
                                    <h2 class="col-lg-3">גיל</h2>
                                    <h2 class="col-lg-3">סינונים נוספים</h2>
                                </div>
                                <div id="containTags" class="row">
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="continuNewAct" CssClass="buttonNewAct" runat="server" Text="המשך" OnClick="continuNewAct_Click" />
                    </div>
                </div>
            </div>

            <%--פופ אפ של כניסת משתמש--%>

            <div class="modal fade" tabindex="-1" id="myModal" role="dialog" runat="server">
                <div class="modal-dialog modal-sm" runat="server">
                    <div id="userEntry" class="modal-content" runat="server">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">כניסת משתמש</h4>
                        </div>

                        <img style="height: 50%; width: 100%; display: block" src="Images/popUpUserEnter.jpg" />
                        <div id="innerPopUpuser1">
                            <asp:Label ID="userNamelabel" runat="server" Text="שם משתמש"></asp:Label>
                            <br />
                            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="סיסמא"></asp:Label>
                            <br />
                            <asp:TextBox ID="passWord" TextMode="Password" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="userEnt" CssClass="buttonNewAct" runat="server" Text="המשך" OnClick="userEnt_Click" />
                            <br />
                            <label runat="server" id="wrong" style="color: red"></label>

                        </div>
                    </div>
                </div>
            </div>

       


        </div>
        <footer class="panel-footer">
            <%--<p> <a data-toggle="modal" data-target="#myModal3">למידע נוסף>></a> | HIT,<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a> זה פותח במסגרת פרוייקט גמר לתואר ראשון ב</p>--%>
            <p dir="rtl">תוצר זה פותח במסגרת פרוייקט גמר לתואר ראשון ב<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a>, HIT | <a data-toggle="modal" data-target="#myModal3" id="extraInfo">למידע נוסף>></a></p>
        </footer>
    </form>


</body>
</html>
