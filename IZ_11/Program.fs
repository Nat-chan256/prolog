open System
open System.Drawing
open System.IO
open System.Windows.Forms

//Создаем форму
let form = new Form(Width= 400, Height = 500, Text = "Individual task №11", StartPosition = FormStartPosition.CenterScreen)
//Шрифт на форме
let font = new Font("Times New Roman", (float32)16)

//Создаем текстБокс и надпись возле него
let text_box = new TextBox(Width = 150, Location = new Point(170,20), 
Font = new Font("Times New Roman", (float32)16))
let lb_elem = new Label(Font = font, Text = "Element:")
lb_elem.Location <- new Point(text_box.Location.X - lb_elem.Width - 10, text_box.Location.Y)
form.Controls.Add(text_box)
form.Controls.Add(lb_elem)

//Создаем кнопку
let button = new Button(Width = 75, Height = 30, Location = new Point(245,70), Text = "Add")
form.Controls.Add(button)

//ТекстБокс для элементов списка
let lb_list = new Label(Text = "List:", Font = font, 
Location = new Point(20, button.Location.Y + button.Height + 30))
let tb_list = new RichTextBox(Width = 340, Height = font.Height * 10, Font = font, ReadOnly = true, 
Location = new Point(20, lb_list.Location.Y + lb_list.Height + 10), WordWrap = true)
form.Controls.Add(tb_list)
form.Controls.Add(lb_list)

//Обработчик события для кнопки
let button_Click _ = 
    let new_elem = text_box.Text
    text_box.Text <- String.Empty
    let new_list = tb_list.Text + " " + new_elem.ToString()
    tb_list.Text <- new_list

let _ = button.Click.Add(button_Click)

do Application.Run(form)