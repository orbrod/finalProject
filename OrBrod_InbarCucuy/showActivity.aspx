<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showActivity.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Scripts -->
    <script src="jScripts/jquery-1.12.0.min.js"></script>
    <script src="jScripts/JavaShowAct.js"></script>
    <%--boostrap--%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="styles/myStyle.css" rel="stylesheet" />
    <link href="styles/newActStyle.css" rel="stylesheet" />
</head>
<body style="direction: rtl">
    <form id="form1" method="post" runat="server">
        <div class="container-fluid" style="min-height: 100vh">
            
            
            <nav aria-label="breadcrumb">
                
                <ol id="showAct" class="breadcrumb">
                    <span><a href="Main.aspx"><img src="Images/logoVTry.png" style="width:100px" id="logoMenueBread" /></a></span>
                    <li class="breadcrumb-item"><a href="Main.aspx">דף בית</a></li>
                    <li class="breadcrumb-item active" aria-current="page" id="actTypeMenu" runat="server"></li>
                    <li class="breadcrumb-item active" aria-current="page" id="actNameMenu" runat="server"></li>
                    <div id="login" runat="server">
                        <span class="glyphicon glyphicon-log-in"></span>
                        <button type="button" id="Button2" data-toggle="modal" data-target="#myModal" runat="server">כניסת משתמש</button>

                    </div>
                    <div class="dropdown" style="display:inline-block; float:left">
                     <button id="user" style="margin-top: 1vh; border:none; background-color:transparent" runat="server" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <asp:Label ID="currentUser" runat="server"></asp:Label>
                    </button>
                        <ul class="dropdown-menu">
                            <li><a href="#" data-toggle="modal" data-target="#myModal">החלפת משתמש</a></li>
                            <li><a href="#"><asp:Button ID="logOut" runat="server" Text="התנתקות מהמערכת" OnClick="logOut_Click" /></a></li>
                            
                        </ul>
                    </div>

                </ol>

            </nav>

            <%--<asp:Button ID="openCheck" runat="server" Text="מחק פעולה" OnClick="openCheck_Click" />--%>
            <h1>

                
                <asp:Label ID="actName" CssClass="inline" runat="server"></asp:Label>
            </h1>
            <br />
            <button id="openCheck" type="button" data-toggle="modal" data-target="#myModal2" runat="server"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="מחיקת פעולה"></span></button>
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="goals" runat="server" Text="מטרות"></asp:Label>
                </h2>
                <br />
                <div class="row">
                    <p class="col-lg-3">
                        1. כיף והנאה
                    </p>
                    <p class="col-lg-3">
                        2. 
            <asp:Label ID="Goal1" runat="server"></asp:Label>
                    </p>
                    <p class="col-lg-3">
                        3.
            <asp:Label ID="Goal2" runat="server"></asp:Label>
                    </p>

                    <p class="col-lg-3">
                        <span class="glyphicon glyphicon-time"></span>
                        משך הפעולה:
            <asp:Label ID="duration" runat="server"></asp:Label>
                        <span>דקות</span>
                    </p>
                </div>
            </div>
            <div class="wrap boxs">

                <h2>
                    <asp:Label ID="actBodyServe" runat="server" Text="גוף הפעולה"></asp:Label>
                </h2>
                <p>
                    &nbsp;<asp:GridView CssClass="table table-bordered table-condensed table-responsive table-hover" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="activityID" HeaderText="activityID" SortExpression="activityID" Visible="False" />
                            <asp:BoundField DataField="method" HeaderText="מתודה" SortExpression="method" />
                            <asp:BoundField DataField="explanation" HeaderText="הסבר" SortExpression="explanation" />
                            <asp:BoundField DataField="aids" HeaderText="עזרים" SortExpression="aids" />
                            <asp:BoundField DataField="metodTime" HeaderText="זמן" SortExpression="metodTime" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [activityMain] WHERE [ID] = ?" InsertCommand="INSERT INTO [activityMain] ([ID], [activityID], [method], [explanation], [aids], [metodTime]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [activityMain]" UpdateCommand="UPDATE [activityMain] SET [activityID] = ?, [method] = ?, [explanation] = ?, [aids] = ?, [metodTime] = ? WHERE [ID] = ?">
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

            </div>

            
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="extra" runat="server" Text="נספחים"></asp:Label></h2>
                <div id="extraLink">
                <span class="glyphicon glyphicon-download-alt"></span>
                <a id="download" runat="server" style="text-align: center" href="#" target="_blank">קישור לנספח</a>
              </div>
            </div>
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="tags" runat="server" Text="מתאים ל"></asp:Label></h2>
                <%-- <asp:Panel ID="showTags" runat="server">
        </asp:Panel>--%>
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
            <div id="newcomment" runat="server" class="wrap boxs">
                <h2>
                    <asp:Label ID="newComent" runat="server" Text="הוספת תגובה"></asp:Label></h2>

                <asp:TextBox ID="commentText" runat="server" TextMode="MultiLine" CharacterLimit="100000" CssClass="CharacterCount"></asp:TextBox>
                &nbsp;
            <asp:Button ID="addNewComment" runat="server" CssClass="buttonNewAct" Text="הוסף" OnClick="Button3_Click" />


            </div>
            <div class="wrap boxs">
                <h2>
                    <asp:Label ID="Label1" runat="server" Text="תגובות"></asp:Label></h2>
                <asp:Panel ID="allComments" runat="server"></asp:Panel>
                <p>
                    &nbsp;
                </p>
                <p>
                    &nbsp;
                </p>
            </div>

            <%--  <asp:Panel ID="grayWindows" runat="server">
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
                    <asp:Button ID="close" runat="server" Text="X" CssClass="Exit" OnClick="close_Click" />
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
                            <br />
                            <label runat="server" id="wrong" style="color: red"></label>
                        </div>
                    </div>
                </div>
            </div>

            <%-- פופ אפ של וידוא לפני מחיקת פעולה--%>

            <div class="modal fade" id="myModal2" role="dialog" runat="server">
                <div class="modal-dialog modal-sm" runat="server">
                    <div class="modal-content " runat="server">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">האם אתה בטוח?</h4>
                        </div>

                        <asp:Button CssClass="buttonNewAct" ID="deleteAfterCheck" runat="server" Text="מחיקת פעולה" OnClick="deleteAct_Click" />
                        <asp:Button CssClass="buttonNewAct" ID="closeCheckPop" runat="server" Text="ביטול" data-dismiss="modal" />
                    </div>
                </div>
            </div>

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

        </div>
        <footer class="panel-footer">
            <%--<p> <a data-toggle="modal" data-target="#myModal3">למידע נוסף>></a> | HIT,<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a> זה פותח במסגרת פרוייקט גמר לתואר ראשון ב</p>--%>
            <p dir="rtl">תוצר זה פותח במסגרת פרוייקט גמר לתואר ראשון ב<a href="https://www.hit.ac.il/telem/overview" target="_blank">פקולטה לטכנולוגיות למידה</a>, HIT | <a data-toggle="modal" data-target="#myModal3" id="extraInfo">למידע נוסף>></a></p>
        </footer>
    </form>
</body>
</html>
