<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Button1 = New System.Windows.Forms.Button
        Me.s_0 = New System.Windows.Forms.Button
        Me.s_2 = New System.Windows.Forms.Button
        Me.s_3 = New System.Windows.Forms.Button
        Me.s_4 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.lbl_lvl = New System.Windows.Forms.Label
        Me.s_0t = New System.Windows.Forms.Timer(Me.components)
        Me.s_1t = New System.Windows.Forms.Timer(Me.components)
        Me.s_2t = New System.Windows.Forms.Timer(Me.components)
        Me.s_3t = New System.Windows.Forms.Timer(Me.components)
        Me.engine_ = New System.Windows.Forms.Timer(Me.components)
        Me.rxb_simon = New System.Windows.Forms.TextBox
        Me.rxb_uinput = New System.Windows.Forms.TextBox
        Me.selector = New System.Windows.Forms.Timer(Me.components)
        Me.Label2 = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Label3 = New System.Windows.Forms.Label
        Me.CheckBox1 = New System.Windows.Forms.CheckBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip
        Me.SimonBasicToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.LSToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.FunToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator
        Me.ÚjJátékToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.BusyToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(246, 190)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Next"
        Me.Button1.UseVisualStyleBackColor = True
        '
        's_0
        '
        Me.s_0.BackColor = System.Drawing.Color.Salmon
        Me.s_0.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.s_0.Location = New System.Drawing.Point(12, 58)
        Me.s_0.Name = "s_0"
        Me.s_0.Size = New System.Drawing.Size(100, 100)
        Me.s_0.TabIndex = 1
        Me.s_0.Text = "1" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Q"
        Me.s_0.UseVisualStyleBackColor = False
        '
        's_2
        '
        Me.s_2.BackColor = System.Drawing.Color.Moccasin
        Me.s_2.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.s_2.Location = New System.Drawing.Point(118, 58)
        Me.s_2.Name = "s_2"
        Me.s_2.Size = New System.Drawing.Size(100, 100)
        Me.s_2.TabIndex = 2
        Me.s_2.Text = "2" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "W"
        Me.s_2.UseVisualStyleBackColor = False
        '
        's_3
        '
        Me.s_3.BackColor = System.Drawing.Color.PaleGreen
        Me.s_3.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.s_3.Location = New System.Drawing.Point(11, 164)
        Me.s_3.Name = "s_3"
        Me.s_3.Size = New System.Drawing.Size(100, 100)
        Me.s_3.TabIndex = 3
        Me.s_3.Text = "3" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "A"
        Me.s_3.UseVisualStyleBackColor = False
        '
        's_4
        '
        Me.s_4.BackColor = System.Drawing.Color.LightBlue
        Me.s_4.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.s_4.Location = New System.Drawing.Point(118, 164)
        Me.s_4.Name = "s_4"
        Me.s_4.Size = New System.Drawing.Size(100, 100)
        Me.s_4.TabIndex = 4
        Me.s_4.Text = "4" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "S"
        Me.s_4.UseVisualStyleBackColor = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(243, 37)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Debug"
        '
        'lbl_lvl
        '
        Me.lbl_lvl.AutoSize = True
        Me.lbl_lvl.Location = New System.Drawing.Point(243, 53)
        Me.lbl_lvl.Name = "lbl_lvl"
        Me.lbl_lvl.Size = New System.Drawing.Size(17, 13)
        Me.lbl_lvl.TabIndex = 8
        Me.lbl_lvl.Text = "lvl"
        '
        's_0t
        '
        Me.s_0t.Interval = 200
        '
        's_1t
        '
        Me.s_1t.Interval = 200
        '
        's_2t
        '
        Me.s_2t.Interval = 200
        '
        's_3t
        '
        Me.s_3t.Interval = 200
        '
        'engine_
        '
        Me.engine_.Interval = 1
        '
        'rxb_simon
        '
        Me.rxb_simon.Location = New System.Drawing.Point(246, 90)
        Me.rxb_simon.Name = "rxb_simon"
        Me.rxb_simon.ReadOnly = True
        Me.rxb_simon.Size = New System.Drawing.Size(182, 20)
        Me.rxb_simon.TabIndex = 11
        '
        'rxb_uinput
        '
        Me.rxb_uinput.Location = New System.Drawing.Point(246, 126)
        Me.rxb_uinput.Name = "rxb_uinput"
        Me.rxb_uinput.ReadOnly = True
        Me.rxb_uinput.Size = New System.Drawing.Size(182, 20)
        Me.rxb_uinput.TabIndex = 12
        '
        'selector
        '
        Me.selector.Interval = 800
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(243, 174)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(39, 13)
        Me.Label2.TabIndex = 13
        Me.Label2.Text = "Label2"
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 1
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(11, 277)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(70, 13)
        Me.Label3.TabIndex = 14
        Me.Label3.Text = "Debug status"
        '
        'CheckBox1
        '
        Me.CheckBox1.Appearance = System.Windows.Forms.Appearance.Button
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.Location = New System.Drawing.Point(14, 29)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(78, 23)
        Me.CheckBox1.TabIndex = 15
        Me.CheckBox1.Text = "Debug mode"
        Me.CheckBox1.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(243, 74)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(60, 13)
        Me.Label4.TabIndex = 16
        Me.Label4.Text = "Simon says"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(243, 113)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(45, 13)
        Me.Label5.TabIndex = 17
        Me.Label5.Text = "You say"
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SimonBasicToolStripMenuItem, Me.BusyToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System
        Me.MenuStrip1.Size = New System.Drawing.Size(456, 24)
        Me.MenuStrip1.TabIndex = 18
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'SimonBasicToolStripMenuItem
        '
        Me.SimonBasicToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.LSToolStripMenuItem, Me.FunToolStripMenuItem, Me.ToolStripSeparator1, Me.ÚjJátékToolStripMenuItem})
        Me.SimonBasicToolStripMenuItem.Name = "SimonBasicToolStripMenuItem"
        Me.SimonBasicToolStripMenuItem.Size = New System.Drawing.Size(80, 20)
        Me.SimonBasicToolStripMenuItem.Text = "Simon Basic"
        '
        'LSToolStripMenuItem
        '
        Me.LSToolStripMenuItem.Name = "LSToolStripMenuItem"
        Me.LSToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.LSToolStripMenuItem.Text = "LS"
        '
        'FunToolStripMenuItem
        '
        Me.FunToolStripMenuItem.Name = "FunToolStripMenuItem"
        Me.FunToolStripMenuItem.Size = New System.Drawing.Size(120, 22)
        Me.FunToolStripMenuItem.Text = "Fun"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(117, 6)
        '
        'ÚjJátékToolStripMenuItem
        '
        Me.ÚjJátékToolStripMenuItem.Name = "ÚjJátékToolStripMenuItem"
        Me.ÚjJátékToolStripMenuItem.ShortcutKeys = CType((System.Windows.Forms.Keys.Control Or System.Windows.Forms.Keys.N), System.Windows.Forms.Keys)
        Me.ÚjJátékToolStripMenuItem.Size = New System.Drawing.Size(161, 22)
        Me.ÚjJátékToolStripMenuItem.Text = "Új játék"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(98, 31)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(120, 20)
        Me.TextBox1.TabIndex = 19
        Me.TextBox1.Text = "(Enable keys)"
        '
        'BusyToolStripMenuItem
        '
        Me.BusyToolStripMenuItem.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right
        Me.BusyToolStripMenuItem.Name = "BusyToolStripMenuItem"
        Me.BusyToolStripMenuItem.Size = New System.Drawing.Size(52, 20)
        Me.BusyToolStripMenuItem.Text = "Busy..."
        Me.BusyToolStripMenuItem.Visible = False
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(456, 310)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.CheckBox1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.rxb_uinput)
        Me.Controls.Add(Me.rxb_simon)
        Me.Controls.Add(Me.lbl_lvl)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.s_4)
        Me.Controls.Add(Me.s_3)
        Me.Controls.Add(Me.s_2)
        Me.Controls.Add(Me.s_0)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MainMenuStrip = Me.MenuStrip1
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Text = "Lapine Systems Simon Basic"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents s_0 As System.Windows.Forms.Button
    Friend WithEvents s_2 As System.Windows.Forms.Button
    Friend WithEvents s_3 As System.Windows.Forms.Button
    Friend WithEvents s_4 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lbl_lvl As System.Windows.Forms.Label
    Friend WithEvents s_0t As System.Windows.Forms.Timer
    Friend WithEvents s_1t As System.Windows.Forms.Timer
    Friend WithEvents s_2t As System.Windows.Forms.Timer
    Friend WithEvents s_3t As System.Windows.Forms.Timer
    Friend WithEvents engine_ As System.Windows.Forms.Timer
    Friend WithEvents rxb_simon As System.Windows.Forms.TextBox
    Friend WithEvents rxb_uinput As System.Windows.Forms.TextBox
    Friend WithEvents selector As System.Windows.Forms.Timer
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents SimonBasicToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents LSToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FunToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ÚjJátékToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents BusyToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem

End Class
