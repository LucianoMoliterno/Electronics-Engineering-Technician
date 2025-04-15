namespace WindowsFormsApplication5
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
            this.b4 = new System.Windows.Forms.Button();
            this.b3 = new System.Windows.Forms.Button();
            this.b7 = new System.Windows.Forms.Button();
            this.b6 = new System.Windows.Forms.Button();
            this.b1 = new System.Windows.Forms.Button();
            this.b2 = new System.Windows.Forms.Button();
            this.b8 = new System.Windows.Forms.Button();
            this.b5 = new System.Windows.Forms.Button();
            this.mostrar = new System.Windows.Forms.Button();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // b4
            // 
            this.b4.Location = new System.Drawing.Point(134, 68);
            this.b4.Name = "b4";
            this.b4.Size = new System.Drawing.Size(27, 23);
            this.b4.TabIndex = 0;
            this.b4.Text = "0";
            this.b4.UseVisualStyleBackColor = true;
            // 
            // b3
            // 
            this.b3.Location = new System.Drawing.Point(99, 68);
            this.b3.Name = "b3";
            this.b3.Size = new System.Drawing.Size(29, 23);
            this.b3.TabIndex = 1;
            this.b3.Text = "0";
            this.b3.UseVisualStyleBackColor = true;
            // 
            // b7
            // 
            this.b7.Location = new System.Drawing.Point(240, 68);
            this.b7.Name = "b7";
            this.b7.Size = new System.Drawing.Size(28, 23);
            this.b7.TabIndex = 2;
            this.b7.Text = "0";
            this.b7.UseVisualStyleBackColor = true;
            // 
            // b6
            // 
            this.b6.Location = new System.Drawing.Point(205, 68);
            this.b6.Name = "b6";
            this.b6.Size = new System.Drawing.Size(29, 23);
            this.b6.TabIndex = 3;
            this.b6.Text = "0";
            this.b6.UseVisualStyleBackColor = true;
            // 
            // b1
            // 
            this.b1.Location = new System.Drawing.Point(12, 68);
            this.b1.Name = "b1";
            this.b1.Size = new System.Drawing.Size(46, 23);
            this.b1.TabIndex = 4;
            this.b1.Text = "0";
            this.b1.UseVisualStyleBackColor = true;
            // 
            // b2
            // 
            this.b2.Location = new System.Drawing.Point(64, 68);
            this.b2.Name = "b2";
            this.b2.Size = new System.Drawing.Size(29, 23);
            this.b2.TabIndex = 5;
            this.b2.Text = "0";
            this.b2.UseVisualStyleBackColor = true;
            // 
            // b8
            // 
            this.b8.Location = new System.Drawing.Point(274, 68);
            this.b8.Name = "b8";
            this.b8.Size = new System.Drawing.Size(27, 23);
            this.b8.TabIndex = 6;
            this.b8.Text = "0";
            this.b8.UseVisualStyleBackColor = true;

            // 
            // b5
            // 
            this.b5.Location = new System.Drawing.Point(169, 68);
            this.b5.Name = "b5";
            this.b5.Size = new System.Drawing.Size(30, 23);
            this.b5.TabIndex = 9;
            this.b5.Text = "0";
            this.b5.UseVisualStyleBackColor = true;
            // 
            // mostrar
            // 
            this.mostrar.Location = new System.Drawing.Point(255, 227);
            this.mostrar.Name = "mostrar";
            this.mostrar.Size = new System.Drawing.Size(75, 23);
            this.mostrar.TabIndex = 10;
            this.mostrar.Text = "mostrar ";
            this.mostrar.UseVisualStyleBackColor = true;
            this.mostrar.Click += new System.EventHandler(this.mostrar_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(105, 30);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(129, 20);
            this.textBox1.TabIndex = 11;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(342, 262);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.mostrar);
            this.Controls.Add(this.b5);
            this.Controls.Add(this.b8);
            this.Controls.Add(this.b2);
            this.Controls.Add(this.b1);
            this.Controls.Add(this.b6);
            this.Controls.Add(this.b7);
            this.Controls.Add(this.b3);
            this.Controls.Add(this.b4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button b4;
        private System.Windows.Forms.Button b3;
        private System.Windows.Forms.Button b7;
        private System.Windows.Forms.Button b6;
        private System.Windows.Forms.Button b1;
        private System.Windows.Forms.Button b2;
        private System.Windows.Forms.Button b8;
        private System.Windows.Forms.Button b5;
        private System.Windows.Forms.Button mostrar;
        private System.Windows.Forms.ColorDialog colorDialog1;
        private System.Windows.Forms.TextBox textBox1;
    }
}

