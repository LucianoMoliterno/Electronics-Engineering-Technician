namespace WindowsFormsApplication1
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.B = new System.Windows.Forms.Button();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.B1 = new System.Windows.Forms.Button();
            this.B2 = new System.Windows.Forms.Button();
            this.B3 = new System.Windows.Forms.Button();
            this.pageSetupDialog1 = new System.Windows.Forms.PageSetupDialog();
            this.SuspendLayout();
            // 
            // B
            // 
            this.B.Location = new System.Drawing.Point(205, 231);
            this.B.Name = "B";
            this.B.Size = new System.Drawing.Size(75, 23);
            this.B.TabIndex = 0;
            this.B.Text = "On";
            this.B.UseVisualStyleBackColor = true;
            this.B.Click += new System.EventHandler(this.B1_Click);
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // B1
            // 
            this.B1.Location = new System.Drawing.Point(102, 12);
            this.B1.Name = "B1";
            this.B1.Size = new System.Drawing.Size(75, 43);
            this.B1.TabIndex = 1;
            this.B1.Text = "button1";
            this.B1.UseVisualStyleBackColor = true;
            this.B1.Click += new System.EventHandler(this.B1_Click_1);
            // 
            // B2
            // 
            this.B2.Location = new System.Drawing.Point(102, 75);
            this.B2.Name = "B2";
            this.B2.Size = new System.Drawing.Size(75, 41);
            this.B2.TabIndex = 2;
            this.B2.Text = "button1";
            this.B2.UseVisualStyleBackColor = true;
            // 
            // B3
            // 
            this.B3.Location = new System.Drawing.Point(102, 140);
            this.B3.Name = "B3";
            this.B3.Size = new System.Drawing.Size(75, 38);
            this.B3.TabIndex = 3;
            this.B3.Text = "button1";
            this.B3.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 266);
            this.Controls.Add(this.B3);
            this.Controls.Add(this.B2);
            this.Controls.Add(this.B1);
            this.Controls.Add(this.B);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button B;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Button B1;
        private System.Windows.Forms.Button B2;
        private System.Windows.Forms.Button B3;
        private System.Windows.Forms.PageSetupDialog pageSetupDialog1;
    }
}

