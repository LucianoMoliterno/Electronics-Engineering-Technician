using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

        }
        int A;


        private void timer1_Tick(object sender, EventArgs e)
        {
           

            switch (A) {

                case 0: B1.BackColor = Color.Red; B2.BackColor = Color.Gray;
                    break;
                case 10: B1.BackColor = Color.Gray;
                    B2.BackColor = Color.Yellow;
                    break;
                 case 18: B2.BackColor = Color.Gray;
                    B3.BackColor = Color.Green;
                    break;
                case 28: B3.BackColor = Color.Gray;
                    B2.BackColor = Color.Yellow;
                    break;
                case 38: A = -1;
                    break;


                    
            }
            A++;
        }


        private void B1_Click(object sender, EventArgs e)
        {
            timer1.Enabled = true;
        }

        
        private void B1_Click_1(object sender, EventArgs e)
        {
            
                    
         
            }
    }
    }

