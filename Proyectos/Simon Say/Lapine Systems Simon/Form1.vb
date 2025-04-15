Public Class Form1
#Region "Random number generator"
    Dim objRandom As New System.Random( _
    CType(System.DateTime.Now.Ticks Mod System.Int32.MaxValue, Integer))

    Public Function GetRandomNumber( _
      Optional ByVal Low As Integer = 1, _
      Optional ByVal High As Integer = 100) As Integer
        ' Returns a random number,
        ' between the optional Low and High parameters
        Return objRandom.Next(Low, High + 1)
    End Function
#End Region


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Engine(GetSimonNumber(0, 3))
        'rxb_simon.Clear()
        'rxb_uinput.Clear()
    End Sub

    Public Function GetSimonNumber(ByVal min As Integer, ByVal max As Integer)
        GetRandomNumber(min, max)
        GetRandomNumber(min, max)
        GetRandomNumber(min, max)
        GetRandomNumber(min, max)
        Return GetRandomNumber(min, max)
    End Function

    Public Sub Engine(ByVal SimonNum As Integer)
        rxb_simon.Text += SimonNum.ToString
        ' i = -1
        selector.Start()
        ' engine_.Start()
        '  MsgBox("done")
    End Sub

    Public Function BtnShow(ByVal index As Integer)
        If index = 0 Then
            s_0t.Start()
        ElseIf index = 1 Then
            s_1t.Start()
        ElseIf index = 2 Then
            s_2t.Start()
        ElseIf index = 3 Then
            s_3t.Start()
        End If
        Return 0
    End Function

    Dim si0, si1, si2, si3 As Integer

#Region "BTN show"
    Private Sub s_0t_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles s_0t.Tick
        si0 += 1
        inon(False)
        TX(True, False, False, False)
        If si0 = 1 Then
            s_0.BackColor = Color.Red
            My.Computer.Audio.Play(My.Resources._0, AudioPlayMode.WaitToComplete)
        ElseIf si0 = 3 Then
            si0 = 0
            s_0.BackColor = Color.Salmon
            inon(True)
            s_0t.Stop()
            TX(False, False, False, False)
            s_1t.Stop()
            s_2t.Stop()
            s_3t.Stop()
        End If

    End Sub

    Private Sub s_1t_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles s_1t.Tick
        si1 += 1
        inon(False)
        TX(False, True, False, False)
        If si1 = 1 Then
            s_2.BackColor = Color.Yellow
            My.Computer.Audio.Play(My.Resources._1, AudioPlayMode.WaitToComplete)
        ElseIf si1 = 3 Then
            si1 = 0
            s_2.BackColor = Color.Moccasin
            inon(True)
            s_1t.Stop()
            TX(False, False, False, False)
            s_0t.Stop()
            s_2t.Stop()
            s_3t.Stop()
        End If
    End Sub

    Private Sub s_2t_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles s_2t.Tick
        si2 += 1
        inon(False)
        TX(False, False, True, False)
        If si2 = 1 Then
            s_3.BackColor = Color.Green
            My.Computer.Audio.Play(My.Resources._2, AudioPlayMode.WaitToComplete)
        ElseIf si2 = 3 Then
            si2 = 0
            s_3.BackColor = Color.PaleGreen
            inon(True)
            s_2t.Stop()
            TX(False, False, False, False)
            s_0t.Stop()
            s_1t.Stop()
            s_3t.Stop()
        End If
    End Sub

    Private Sub s_3t_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles s_3t.Tick
        si3 += 1
        inon(False)
        TX(False, False, False, True)
        If si3 = 1 Then
            s_4.BackColor = Color.Blue
            My.Computer.Audio.Play(My.Resources._3, AudioPlayMode.WaitToComplete)
        ElseIf si3 = 3 Then
            si3 = 0
            s_4.BackColor = Color.LightBlue
            inon(True)
            s_3t.Stop()
            TX(False, False, False, False)
            s_0t.Stop()
            s_1t.Stop()
            s_2t.Stop()
        End If
    End Sub

#End Region
    Public Sub inon(ByVal state As Boolean)
        s_0.Enabled = state
        s_2.Enabled = state
        s_3.Enabled = state
        s_4.Enabled = state
    End Sub

    Public Sub TX(ByVal t0x As Boolean, ByVal t1x As Boolean, ByVal t2x As Boolean, ByVal t3x As Boolean)
        s_0t.Enabled = t0x
        s_1t.Enabled = t1x
        s_2t.Enabled = t2x
        s_3t.Enabled = t3x
    End Sub

    Dim i As Integer = -1
    Dim iscontrol As Integer
    Private Sub selector_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles selector.Tick
        i += 1
        lbl_lvl.Text = i & "      " & rxb_simon.Text.Length
        If i < rxb_simon.Text.Length Then
            iscontrol = 0
            Button1.Enabled = False
            BusyToolStripMenuItem.Visible = True
            rxb_simon.Select(i, 1)
            BtnShow(CInt(rxb_simon.SelectedText))
        ElseIf i = rxb_simon.Text.Length Then
            Button1.Enabled = True
            BusyToolStripMenuItem.Visible = False
            i = -1
            iscontrol = 1
            selector.Stop()
        End If
    End Sub

    Dim j As Integer = 0
    Dim ui, st As String
    Dim ched As Integer
    Private Sub s_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles s_4.Click, s_3.Click, s_2.Click, s_0.Click
        If iscontrol = 1 Then
            rxb_uinput.Text += (CInt(Strings.Left(sender.text, 1)) - 1).ToString
            BtnShow(CInt(Strings.Left(sender.text, 1) - 1))
            j += 1
            kontroll()
        End If
    End Sub

    Public Sub vege()
        MsgBox("A játéknak vége." & vbCrLf & "Az ön eredménye: " & rxb_simon.TextLength - 1, MsgBoxStyle.Critical, "Hibázott")
        i = -1
        j = 0
        iscontrol = 0
        rxb_simon.Clear()
        rxb_uinput.Clear()
        Button1.Enabled = True
        ÚjJátékToolStripMenuItem.Enabled = True
        inon(True)
        TX(False, False, False, False)
        engine_.Stop()
    End Sub
    Public Sub kontroll()
        If iscontrol = 1 Then
            If j - 1 < rxb_simon.Text.Length Then
                If j = rxb_simon.Text.Length Then
                    GoTo vege
                End If
                rxb_uinput.Select(j - 1, 1)
                rxb_simon.Select(j - 1, 1)
                ui = rxb_uinput.SelectedText
                st = rxb_simon.SelectedText
                Label2.Text = j & "             " & rxb_simon.Text.Length
                If ui <> st Then
                    vege()
                    Exit Sub
                End If
            ElseIf j - 1 = rxb_simon.Text.Length Then
vege:
                rxb_uinput.Select(j - 1, 1)
                rxb_simon.Select(j - 1, 1)
                ui = rxb_uinput.SelectedText
                st = rxb_simon.SelectedText
                Label2.Text = j & "             " & rxb_simon.Text.Length
                If ui <> st Then
                    vege()
                    Exit Sub
                End If
                j = 0
                rxb_uinput.Clear()
                rxb_uinput.Select(0, 0)
                rxb_simon.Select(0, 0)
                Engine(GetSimonNumber(0, 3))
            End If
        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked Then
            Me.Height = 342
            Me.Width = 446
        Else
            Me.Height = 304
            Me.Width = 233
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.Height = 304
        Me.Width = 233
    End Sub

    Private Sub ÚjJátékToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ÚjJátékToolStripMenuItem.Click
        Engine(GetSimonNumber(0, 3))
        ÚjJátékToolStripMenuItem.Enabled = False
    End Sub

    Private Sub TextBox1_KeyDown(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyCode = Keys.NumPad1 Then
            TextBox1.Text = "1"
        ElseIf e.KeyCode = Keys.NumPad2 Then
            TextBox1.Text = "2"
        ElseIf e.KeyCode = Keys.NumPad3 Then
            TextBox1.Text = "3"
        ElseIf e.KeyCode = Keys.NumPad4 Then
            TextBox1.Text = "4"
        ElseIf e.KeyCode = Keys.Q Then
            TextBox1.Text = "1"
        ElseIf e.KeyCode = Keys.W Then
            TextBox1.Text = "2"
        ElseIf e.KeyCode = Keys.A Then
            TextBox1.Text = "3"
        ElseIf e.KeyCode = Keys.S Then
            TextBox1.Text = "4"
        ElseIf e.Control And e.KeyCode = Keys.N Then
            ÚjJátékToolStripMenuItem_Click(Nothing, Nothing)
        End If
    End Sub

    Private Sub TextBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.Click
        TextBox1.Clear()
    End Sub

    Private Sub TextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If iscontrol = 1 Then
            Try
                rxb_uinput.Text += (CInt(TextBox1.Text) - 1).ToString
                BtnShow((CInt(TextBox1.Text) - 1))
                j += 1
                kontroll()
                TextBox1.Clear()
            Catch ex As Exception
                TextBox1.Text = "Makro enabled"
            End Try

        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If TextBox1.Focused = False Then
            TextBox1.Text = "Makro disabled"
        End If
    End Sub
End Class
