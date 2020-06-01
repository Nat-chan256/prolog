open System
open System.Drawing
open System.IO
open System.Windows.Forms

//Создаем форму
let form = new Form(Width= 400, Height = 500, Text = "Individual task №11", StartPosition = FormStartPosition.CenterScreen)

//Создаем текстБокс
let text_box = new TextBox(Width = 150, Location = new Point(170,20), 
Font = new Font("Times New Roman", (float32)16))
form.Controls.Add(text_box)

//Создаем кнопку
let button = new Button(Width = 75, Height = 30, Location = new Point(245,70), Text = "Add")
form.Controls.Add(button)

//ТекстБокс для элементов списка
let font = new Font("Times New Roman", (float32)16)
let tb_list = new RichTextBox(Width = 360, Height = font.Height, Font = font, ReadOnly = true, 
Location = new Point(20, button.Location.Y + button.Height + 30), WordWrap = true)
form.Controls.Add(tb_list)

//Обработчик события для кнопки
let button_Click _ = 
    let new_elem = text_box.Text
    text_box.Text <- String.Empty
    let new_list = tb_list.Text + " " + new_elem.ToString()
    tb_list.Text <- new_list

do Application.Run(form)