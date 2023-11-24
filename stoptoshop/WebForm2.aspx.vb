Imports System.Security.Cryptography

Public Class WebForm2
    Inherits System.Web.UI.Page
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim amount As String = "1"
        txnid.Value = Convert.ToString(r.Next(10000, 999999))
        Dim text As String = key.Value.ToString() & "|" + txnid.Value.ToString() & "|" + amount & "|" & "Women Tops" & "|" + "vk" & "|" + "nandakumar1052@gmail.com" & "|" & "1" & "|" & "1" & "|" & "1" & "|" & "1" & "|" & "1" & "||||||" + salt.Value.ToString()
        Dim message As Byte() = Encoding.UTF8.GetBytes(text)
        Dim UE As UnicodeEncoding = New UnicodeEncoding()
        Dim hashValue As Byte()
        Dim hashString As SHA512Managed = New SHA512Managed()
        Dim hex As String = ""
        hashValue = hashString.ComputeHash(message)

        For Each x As Byte In hashValue
            hex += String.Format("{0:x2}", x)
        Next

        hash.Value = hex
        Dim data As System.Collections.Hashtable = New System.Collections.Hashtable()
        data.Add("hash", hex.ToString())
        data.Add("txnid", txnid.Value)
        data.Add("key", key.Value)
        data.Add("amount", amount)
        data.Add("firstname", "vk")
        data.Add("email", "nandakumar1052@gmail.com")
        data.Add("phone", "9206257512")
        data.Add("productinfo", "Women Tops")
        data.Add("udf1", "1")
        data.Add("udf2", "1")
        data.Add("udf3", "1")
        data.Add("udf4", "1")
        data.Add("udf5", "1")
        data.Add("surl", "http://localhost:53989/SuccessPayment.aspx")
        data.Add("furl", "http://localhost:53989/Cart.aspx")
        data.Add("service_provider", "")
        Dim strForm As String = PreparePOSTForm("https://secure.payu.in/_payment", data)
        Page.Controls.Add(New LiteralControl(strForm))
    End Sub

    Private Function PreparePOSTForm(ByVal url As String, ByVal data As System.Collections.Hashtable) As String
        Dim formID As String = "PostForm"
        Dim strForm As StringBuilder = New StringBuilder()
        strForm.Append("<form id=""" & formID & """ name=""" & formID & """ action=""" & url & """ method=""POST"">")

        For Each key As System.Collections.DictionaryEntry In data
            strForm.Append("<input type=""hidden"" name=""" & key.Key & """ value=""" & key.Value & """>")
        Next

        strForm.Append("</form>")
        Dim strScript As StringBuilder = New StringBuilder()
        strScript.Append("<script language='javascript'>")
        strScript.Append("var v" & formID & " = document." & formID & ";")
        strScript.Append("v" & formID & ".submit();")
        strScript.Append("</script>")
        Return strForm.ToString() + strScript.ToString()
    End Function
End Class