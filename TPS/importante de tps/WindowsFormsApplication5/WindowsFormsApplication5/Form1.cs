using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication5
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int D0;
        int D1;
        int D2;
        int D3;
        int D4;
        int D5;
        int D6;
        int D7;
        private void Form1_Load(object sender, EventArgs e)
        {
            
            

        }

        private void mostrar_Click(object sender, EventArgs e)
        {
            byte dato;
            dato = Convert.ToByte(textBox1.Text);

            D0 = Convert.ToByte(dato & 1);
            D1 = Convert.ToByte(dato & 2);
            D2 = Convert.ToByte(dato & 4);
            D3 = Convert.ToByte(dato & 8);
            D4 = Convert.ToByte(dato & 16);
            D5 = Convert.ToByte(dato & 32);
            D6 = Convert.ToByte(dato & 64);
            D7 = Convert.ToByte(dato & 128);

            if (D0 == 1)
            { b8.BackColor = Color.Aqua;
                b8.Text = "1";
            }

            else{
                b8.Text = "0";
                b8.BackColor = Color.White;
            }
            if (D1 == 2)
            {
                b7.Text = "1";
                b7.BackColor = Color.Aqua; }
            else{
                b7.Text = "0";
                b7.BackColor = Color.White;
            }
                if (D2 == 4)
                {
                    b6.Text = "1";
                    b6.BackColor = Color.Aqua;
                }else
                {
                    b6.Text = "0";
                    b6.BackColor = Color.White;
                }
                    if (D3 == 8)
                    {
                        b5.Text = "1";
                        b5.BackColor = Color.Aqua;
                    }

                    else
                    {
                        b5.Text = "0";
                        b5.BackColor = Color.White;
                    }
                        if (D4 == 16)
                        {
                            b4.Text = "1";
                            b4.BackColor = Color.Aqua;
                        }
                        else
                        {
                            b4.Text = "0";
                            b4.BackColor = Color.White;
                        }
                            if (D5 == 32)
                            {
                                b3.Text = "1";
                                b3.BackColor = Color.Aqua;
                            }
                            else
                            {
                                b3.Text = "0";
                                b3.BackColor = Color.White;
                            }
                                if (D6 == 64)
                                {
                                    b2.Text = "1";
                                    b2.BackColor = Color.Aqua;
                                }
                                else
                                {
                                    b2.Text = "0";
                                    b2.BackColor = Color.White;
                                }
                                    if (D7 == 128)
                                    {
                                        b1.BackColor = Color.Aqua;
                                        b1.Text = "1";
                                    }
                                    else
                                    {
                                        b1.Text = "0";
                                        b1.BackColor = Color.White;


                                    }
                                }
                            }
                        }
             