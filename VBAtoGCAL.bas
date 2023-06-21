Attribute VB_Name = "VBAtoGCAL"
'���Q�Ɛݒ��ݒ肵�ĉ�����
'Microsoft XML, v6.0
'Microsoft Excel Object Library

Sub sample()
    Dim summary
    Dim EventDate
    Dim description
    
    summary = "sample"
    EventDate = "2026-6-23"
    description = "sample"
    
    Call CreateGoogleCalendarEvent(summary, EventDate, description)
    
End Sub

Function CreateGoogleCalendarEvent(summary, EventDate, description)
    Dim scriptUrl As String
    'GAS���f�v���C����web�A�v����URL���L��
    scriptUrl = "https://script.google.com/macros/s/************************/exec"
    
    Dim xlApp As New Excel.Application
    
    ' �����̒l��ݒ�
    summary = xlApp.WorksheetFunction.EncodeURL(summary)
    EventDate = xlApp.WorksheetFunction.EncodeURL(EventDate)
    description = xlApp.WorksheetFunction.EncodeURL(description)
    
    Dim http As Object
    Set http = CreateObject("MSXML2.XMLHTTP")
    
    ' URL�Ɉ�����ǉ�
    scriptUrl = scriptUrl & "?summary=" & summary & "&date=" & EventDate & "&description=" & description
    Debug.Print scriptUrl
    http.Open "GET", scriptUrl, False
    http.Send
    
End Function

