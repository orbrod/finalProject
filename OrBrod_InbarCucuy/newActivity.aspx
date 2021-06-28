<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newActivity.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Scripts -->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <script src="jScripts/javaNewAct.js"></script>
    <link href="styles/myStyle.css" rel="stylesheet" />
    <link href="styles/newActStyle.css" rel="stylesheet" />
    <%--boostrap--%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">

        <%--          <div id="work" runat="server" >
<%: Request.Form["form"].ToString() %>
</div>--%>
        <div class="container-fluid" dir="rtl" style="min-height:100vh">
            <%--תפריט ברדקרמבס--%>

<%--
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <span><a data-toggle="modal" data-target="#myModal2" href="#"><img src="Images/logoVTry.png" style="width:100px" id="logoMenueBread" /></a></span>
                    <li class="breadcrumb-item"><a data-toggle="modal" data-target="#myModal2" href="#">דף בית</a></li>
                    <li class="breadcrumb-item active" aria-current="page">עמוד הוספת פעולה</li>
                    <div id="login">
                        <span class="glyphicon glyphicon-log-in"></span>
                        <button type="button" id="Button2" data-toggle="modal" data-target="#myModal" runat="server">כניסת משתמש</button>

                    </div>
                    <span id="user" runat="server" class="glyphicon glyphicon-user"></span>

                </ol>

            </nav>--%>
                        <nav aria-label="breadcrumb">
                
                <ol id="showAct" class="breadcrumb">
                    <span><a data-toggle="modal" data-target="#myModal2" href="#"><img src="Images/logoVTry.png" style="width:100px" id="logoMenueBread" /></a></span>
                    <li class="breadcrumb-item"><a data-toggle="modal" data-target="#myModal2" href="#">דף בית</a></li>
                    <li class="breadcrumb-item active" aria-current="page">פעולה חדשה</li>
                    <div id="login">
                        <span class="glyphicon glyphicon-log-in"></span>
                        <button type="button" id="Button2" data-toggle="modal" data-target="#myModal" runat="server">החלפת משתמש</button>

                    </div>
                         <div id="user" runat="server">
                        <span class="glyphicon glyphicon-user"></span>
                        <asp:Label ID="currentUser" runat="server"></asp:Label>
                    </div>

                </ol>

            </nav>


            <h1>

                <asp:Label ID="actName" runat="server"></asp:Label>
            </h1>
            <br />
            <div id="newActRow" class="row ">
                <div id="different" class="col-lg-4 col-lg-offset-1 claaNew">
                <h2>
                    <asp:Label ID="goals" runat="server" Text="מטרות"></asp:Label> 
                </h2>
                <p>
                    1. כיף והנאה
                </p>
                <p>
                    2. 
            <asp:TextBox ID="goal1" runat="server"></asp:TextBox>
                </p>
                <p>
                    3.
            <asp:TextBox ID="goal2" runat="server"></asp:TextBox>
                </p>
                <p>
                    &nbsp;
                </p>
                <p id="duratinMargin">
                    <span class="glyphicon glyphicon-time"></span><b>משך פעולה:</b>
            <asp:DropDownList ID="activityDuration" runat="server">
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="45">45</asp:ListItem>
                <asp:ListItem Value="60">60</asp:ListItem>
                <asp:ListItem Value="90">90</asp:ListItem>
            </asp:DropDownList> <span>דקות</span>
                </p>

                    </div>
                <div id="actBody" class="col-lg-7 claaNew">
                <h2>
                    <asp:Label ID="actBodyServe" runat="server" Text="גוף הפעולה"></asp:Label>
                </h2>
                <p>
                    &nbsp;<asp:GridView ID="GridView2" CssClass="table table-bordered table-condensed table-responsive table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="activityID" HeaderText="activityID" SortExpression="activityID" Visible="False" />
                            <asp:BoundField DataField="method" HeaderText="מתודה" SortExpression="method" />
                            <asp:BoundField DataField="explanation" HeaderText="הסבר" SortExpression="explanation"/>
                            <asp:BoundField DataField="aids" HeaderText="עזרים" SortExpression="aids" />
                            <asp:BoundField DataField="metodTime" HeaderText="זמן" SortExpression="metodTime" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [activityMain] WHERE [ID] = ?" InsertCommand="INSERT INTO [activityMain] ([ID], [activityID], [method], [explanation], [aids], [metodTime]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [activityMain]" UpdateCommand="UPDATE [activityMain] SET [activityID] = ?, [method] = ?, [explanation] = ?, [aids] = ?, [metodTime] = ? WHERE [ID] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="activityID" Type="Int32" />
                            <asp:Parameter Name="method" Type="String" />
                            <asp:Parameter Name="explanation" Type="String" />
                            <asp:Parameter Name="aids" Type="String" />
                            <asp:Parameter Name="metodTime" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="activityID" Type="Int32" />
                            <asp:Parameter Name="method" Type="String" />
                            <asp:Parameter Name="explanation" Type="String" />
                            <asp:Parameter Name="aids" Type="String" />
                            <asp:Parameter Name="metodTime" Type="Int32" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
                <p>
                    &nbsp;
                </p>
                <p>
                    &nbsp;
                </p>
                <p>
                    מתודה:&nbsp;&nbsp;
            <asp:TextBox ID="method" CharacterLimit="50" CssClass="CharacterCount" runat="server"></asp:TextBox>
                    &nbsp;הסבר:
            <asp:TextBox ID="explain" runat="server"></asp:TextBox>
                    &nbsp;עזרים:
            <asp:TextBox ID="aids" runat="server"></asp:TextBox>
                    &nbsp;זמן (בדקות):
            <asp:TextBox ID="time" CharacterLimit="50" CssClass="CharacterCount" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="addNewLine" runat="server" OnClick="Button1_Click" Text="הוסף" />
                </p>
                <p>
                    &nbsp;
                </p>
                    </div>
                <p>
                    <%-- <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="הוסף שורה" />--%>
                    <%--<i class="bi bi-pencil" onclick="newActClick()"></i>--%>
                    <%-- <input type="button"  onclick="newActClick()" value="הוספת תגיות"  />--%>
                </p>
            </div>
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="extra" runat="server" Text="נספחים"></asp:Label>
                </h2>
                <div class="row">
                    <a class="col-lg-4 extraClass" target="_blank" href="https://drive.google.com/">1.היכנס לדרייב</a>
                    <a href="#" class="col-lg-4 extraClass" data-toggle="modal" data-target="#myModal4">2.העלה לדרייב</a>
                    <div class="col-lg-4">
                        <label class="extraClass">3.הדבק קישור שיתוף</label><asp:TextBox ID="googleDriveLink" runat="server"></asp:TextBox></div>

                </div>
            </div>
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="tags" runat="server">
        <a onclick="removeExistFunc()"  href="#" data-toggle="modal" data-target="#myModal3">
          <span data-toggle="tooltip" title="הוספת תגיות" data-placement="top" class="glyphicon glyphicon-pencil"></span>
        </a>
              <span>מתאים ל</span>
                    </asp:Label>
                </h2>
                <div class="row">
                    <asp:Panel CssClass="col-lg-4 col-xs-12" ID="population" runat="server">
                        <label runat="server" class="labelClass" id="populationLable">אפיון אוכלוסייה</label><br />
                    </asp:Panel>
                    <asp:Panel CssClass="col-lg-4 col-xs-12" ID="age" runat="server">
                        <label runat="server" class="labelClass" id="ageLable">גיל</label><br />
                    </asp:Panel>
                    <asp:Panel CssClass="col-lg-4 col-xs-12" ID="more" runat="server">
                        <label runat="server" class="labelClass" id="moreLable">סינונים נוספים</label><br />
                    </asp:Panel>
                </div>
            </div>
            <div class="wrap2">
                <button type="button" class="button" data-toggle="modal" data-target="#myModal2">שמור וסגור</button>


            <%--                פופ אפ של הוספת פעולה חדשה--%>
                            <%-- ניסיון לעשות פופ אפ של הוספת פעולה בשלבים--%>
                <div class="modal fade" tabindex="-1" id="myModal3" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" style="background-color: white">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <h4 class="modal-title">הוספת פעולה חדשה</h4>
                            </div>
<%--                            <br />
                            <div id="topRow" class="row">
                                <div class="col-lg-4 newActTop">
                                    <img id="funCircle" src="Images/fun.png" />
                                </div>
                                <div id="writeActName" class="col-lg-7 col-lg-offset-1  newActTop">
                                    <div id="activityNameDiv">
                                    
           <span style="font-size:16px"><b>שם הפעולה</b>:</span> <asp:TextBox ID="actNamePopUp" runat="server" CharacterForLabel="QuestLbl" CharacterLimit="50" CssClass="CharacterCount"></asp:TextBox>
                                    <asp:Label ID="QuestLbl" runat="server" Text="0/50"></asp:Label>
                                    </div>
                                </div>

                            </div>--%>
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
                                <asp:Label ID="Label3" runat="server" Text="סמן את התגיות המתאימות"></asp:Label>
                                <div id="allInCenter">
                                <div class="row">
                                    <h2 class="col-lg-3">אפיון אוכלוסייה</h2>
                                    <h2 class="col-lg-3">גיל</h2>
                                    <h2 class="col-lg-3">סינונים נוספים</h2>
                                </div>
                            

                            <div id="containTags" class="row">

                                <asp:CheckBoxList CssClass="col-lg-3" ID="tagsList1N" runat="server" RepeatLayout="UnorderedList" Font-Bold="False">

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

                                <asp:CheckBoxList CssClass="col-lg-3" ID="tagsList2N" runat="server" RepeatLayout="UnorderedList">
                                    <asp:ListItem Text="5-9" Value="26" />
                                    <asp:ListItem Text="9-12" Value="17" />
                                    <asp:ListItem Text="13-15" Value="18" />
                                    <asp:ListItem Text="16-18" Value="19" />


                                </asp:CheckBoxList>

                                <asp:CheckBoxList CssClass="col-lg-3" ID="tagsList3N" runat="server" RepeatLayout="UnorderedList">

                                    <asp:ListItem Text="הגבלת תזונה" Value="20" />
                                    <asp:ListItem Text="הנמכה קוגניטיבית" Value="21" />
                                    <asp:ListItem Text="כיסאות גלגלים" Value="22" />
                                    <asp:ListItem Text="מורכבות בתקשורת" Value="23" />
                                    <asp:ListItem Text="מוגבלות פיזית" Value="24" />
                                    <asp:ListItem Text="מחלות נוספות" Value="25" />


                                </asp:CheckBoxList>
                            </div>
                               
                            </div>
                            <%--<asp:Button ID="continuBTN" runat="server" Text="הוסף" OnClick="continuBTN_Click" />--%>
                               
                        </div>
                             <asp:Button ID="continuNewAct" CssClass="buttonNewAct" runat="server" Text="הוסף" OnClick="continuBTN_Click" />
                    </div>
                </div>
            </div>



            <%--פופ אפ וידוא לאחר לחיצה על שמור וסגור--%>
            <div class="modal fade" tabindex="-1" id="myModal2" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">האם אתה בטוח?</h4>
                        </div>

                        <p id="areUsure">אתה בטוח שסיימת לערוך את הפעולה? ברגע שתצא מדף זה לא יהיה ניתן לחזור ולערוך את הפעולה!</p>
                        <asp:Button ID="saveAndretuen" CssClass="buttonNewAct" runat="server" Text="שמור וסגור" OnClick="saveAndretuen_Click" />

                        <input id="continuEdit" type="button" class="buttonNewAct" data-dismiss="modal" value="המשך עריכה" />
                    </div>
                </div>
            </div>



            <%--      <asp:Panel ID="grayWindows" runat="server">
                <asp:Panel ID="userEnter" CssClass="PopUpUser" runat="server">
                    <div id="innerPopUpuser">
                        <asp:Label ID="userNamelabel" runat="server" Text="שם משתמש"></asp:Label>
                        <br />
                        <asp:TextBox ID="userName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="סיסמא"></asp:Label>
                        <br />
                        <asp:TextBox ID="passWord" TextMode="Password" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="userEnt" CssClass="buttonNewAct" runat="server" Text="המשך" OnClick="userEnt_Click" />
                        <asp:Button ID="Button3" runat="server" Text="X" CssClass="Exit" OnClick="Button3_Click" />
                        <asp:Label ID="wrong" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
            </asp:Panel>--%>
            <%--פופ אפ של כניסת משתמש--%>

            <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                <div class="modal-dialog modal-sm" runat="server">
                    <div class="modal-content" runat="server">
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

                            <asp:Label ID="wrong" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <%--פופ אפ של העלאת קובץ לגוגל דרייב--%>
            <div class="modal fade" tabindex="-1" id="myModal4" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                            <h4 class="modal-title">העלאת קובץ</h4>
                        </div>
                        <img id="fileUploadExplanation" src="Images/fileUpload.jpeg" />
                    </div>
                </div>

            </div>

                            <%--פופ אפ של אודות--%>

                <div <%--id="aboutDiv"--%> class="modal fade" id="myModal5" role="dialog">
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

        </div>

        </div>
                <footer class="panel-footer">
            <%--<p> <a data-toggle="modal" data-target="#myModal3">למידע נוסף>></a> | HIT,<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a> זה פותח במסגרת פרוייקט גמר לתואר ראשון ב</p>--%>
            <p dir="rtl">תוצר זה פותח במסגרת פרוייקט גמר לתואר ראשון ב<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a>, HIT | <a data-toggle="modal" data-target="#myModal5" id="extraInfo">למידע נוסף>></a></p>
        </footer>
    </form>
</body>
</html>
