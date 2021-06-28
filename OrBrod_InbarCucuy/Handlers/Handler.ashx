<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using Newtonsoft.Json; //להוסיף את הNewtonsoft
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;

public class Handler : IHttpHandler
{
    SQLClass mySql = new SQLClass();

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        //קבלת הפעולה שאותה אנחנו רוצים לעשות - ניתן כמובן להחליט על שמות הפעולות
        string Action = context.Request["Action"]; // חשוב לשים לב שזה אותו שם משתנה כמו בקובץ הJS

        switch (Action)
        {
            //הצגת כל הפעולות
            case "getAllActivities":

                //שאילתה לשליפת כל היוזרים
                // string myQueryAllUsers = "SELECT * FROM Activities WHERE activityType='morning' ";

                string myQueryAllUsers = "SELECT * FROM Activities  ";


                //שליפה באמצעות פנייה למחלקה
                DataSet myUsers = mySql.SQLSelect(myQueryAllUsers);

                //אם יש יוזרים
                if (myUsers.Tables[0].Rows.Count != 0)
                {
                    //המרת הטבלה שחזרה מהשליפה לג'ייסון
                    string jsonUsersText = JsonConvert.SerializeObject(myUsers);

                    context.Response.Write(jsonUsersText);
                }
                else
                {
                    context.Response.Write("noUsers");
                }
                break;

            case "somthingChecked":
                bool isAutism = Convert.ToBoolean(context.Request["autism"]);
                string myQuery = "SELECT * FROM פעולות WHERE אוטיזם="+isAutism;
                //string x = "";//על מנת למנוע טעויות

                break;

            case "getFilters"://קבלת פעולות על בסיס מה שהמשתמש סימן בצק בוקס
                string IDs = context.Request["IDs"];
                string actType = context.Request["actKind"];
                // string myQuery1 = "SELECT activityID,tagID FROM connectTable WHERE tagID IN(" + IDs + ")";
                string myQury1 = "SELECT * FROM Activities WHERE ID IN (SELECT activityID FROM connectTable WHERE tagID IN(" + IDs + ")) AND activityType= '"+actType+"'";
                DataSet filteredActivities = mySql.SQLSelect(myQury1);
                if (filteredActivities.Tables[0].Rows.Count != 0)
                {
                    //המרת הטבלה שחזרה מהשליפה לג'ייסון
                    string jsonGamesText = JsonConvert.SerializeObject(filteredActivities);

                    context.Response.Write(jsonGamesText);
                }
                else
                {
                    context.Response.Write("noActivitiesFound");
                }
                break;

            case "showTags":
                string IDArray = context.Request["IDs"];
                string query = "SELECT TagTitle FROM tags WHERE ID IN("+IDArray+")";
                DataSet tagsName = mySql.SQLSelect(query);
                if (tagsName.Tables[0].Rows.Count != 0)
                {
                    //המרת הטבלה שחזרה מהשליפה לג'ייסון
                    string jsonGamesText = JsonConvert.SerializeObject(tagsName);

                    context.Response.Write(jsonGamesText);
                }
                else
                {
                    context.Response.Write("noActivitiesFound");
                }
                break;
            case "getSpesificAct"://קבלת פעולות לפי סוג לאחר לחיצה על כפתור

                string actType1 = context.Request["actKind1"];
                //שאילתה לשליפת כל היוזרים
                string myQueryByType = "SELECT * FROM Activities WHERE activityType='"+actType1+"' ";
                //string x = "";

                //שליפה באמצעות פנייה למחלקה
                DataSet myActs = mySql.SQLSelect(myQueryByType);

                //אם יש יוזרים
                if (myActs.Tables[0].Rows.Count != 0)
                {
                    //המרת הטבלה שחזרה מהשליפה לג'ייסון
                    string jsonUsersText = JsonConvert.SerializeObject(myActs);

                    context.Response.Write(jsonUsersText);
                }
                else
                {
                    context.Response.Write("noUsers");
                }



                break;


            //הוספת תגיות לconnect table

            case "registerNewTags":
                //קבלת כל הפרטים שנשלחו מהקריאה  

                string [] tagsNumbers1 = context.Request["tagNumbers"].Split(',');//מערך של מספרי תגיות
                string tagLen = context.Request["tagLen"];
                string actIdQuery = "SELECT TOP 1 ID FROM Activities ORDER BY ID DESC";                                                  //האיידי של הפעולה
                DataSet actIdAns = mySql.SQLSelect(actIdQuery);
                int actId = Convert.ToInt32(actIdAns.Tables[0].Rows[0][0].ToString());
                //יצירת מערך של התגיות


                //אם קיים תוכן בכל אחד מהפרטים     
                if (tagsNumbers1 != null)
                {
                    for(int i = 0; i < tagsNumbers1.Length; i++)
                    {

                        string tagNum = tagsNumbers1[i].ToString();
                        string insertTag = "INSERT INTO connectTable (activityID,tagID) VALUES (" + actId + ",'" + tagNum + "')";
                        mySql.SQLChange(insertTag);

                    }
                    context.Response.Write("actionSucceed");
                }
                else
                {
                    context.Response.Write("noData");
                }
                break;


        }


    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
















