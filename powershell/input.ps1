<#
.SYNOPSIS
Three functions to gather user input - get-UInputListbox, get-UInputYesNo, and Get-UInputFreeText

.DESCRIPTION
Dot-Source this script into yours to easily get user input. 
Get-UInputListbox takes three parameters - 
- List - list of values to display in the listbox
- Title (optional) - title of the listbox window
- Message (optional) - message to display above the listbox

The function returns the item selected by the user.
No validation is done - if a user does NOT make a selection and clicks OK - the function will return NULL

Get-UInputYesNo takes two parameters - 
- Title (optional) - title of the message box window
- Message (optional) - message above the Yes and No button
This function returns "Yes" if "yes" button is clicked or "No" if "no" button is clicked

Get-UInputFreeText takes two parameters - 
- Title (optional) - title of the message box window
- Message (optional) - message above the textbox

This function returns content of the textbox when the user clicks "ok". 
No validation is done - if the textbox is empty - null is returned.

.EXAMPLES
get-UInputFreeText -message "What is your favorite food?"
get-uinputlistbox -list 'chocolate', 'vanilla', 'strawberry', 'cookies and cream' -message "What's your favorite ice cream?" -title "select ice cream"
get-UInputYesNo -message "Do you like ice cream?"

.NOTES
For information on how to dot-source functions in PowerShell - 
see http://blogs.technet.com/b/heyscriptingguy/archive/2010/08/10/how-to-reuse-windows-powershell-functions-in-scripts.aspx 

#>

Function get-UInputListbox{

param(
[string]$title = "ListBox" ,
[string]$message = "Please make a selection",
$list)
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$Form = New-Object system.Windows.Forms.Form
$Form.Text = $title
$Form.Width = 400
$Form.Height = 300


$Label = New-Object System.Windows.Forms.Label
$Label.Text = $message
$Label.BackColor = "Transparent"
$Label.AutoSize = $True

$objListBox = New-Object System.Windows.Forms.ListBox 
$objListBox.Location = New-Object System.Drawing.Size(10,20) 
$objListBox.Size = New-Object System.Drawing.Size(260,20) 
$objListBox.Height = 200

foreach ($item in $list)
{
    [void]$objListBox.Items.add($item)
}

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(10,220)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.AcceptButton = $OKButton


[void]$Form.Controls.Add($OKButton)
[void]$Form.Controls.Add($Label)
[void]$form.controls.add($objListBox)

$Form.Add_Shown({$Form.Activate()})
$dialogResult = $Form.ShowDialog()
if ($dialogResult -eq [System.Windows.Forms.DialogResult]::OK)
    {
          $objlistbox.SelectedItem
    }

}

Function get-UInputYesNo{

param(
[string]$title = "ListBox" ,
[string]$message = "Please make a selection"
)
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$Form = New-Object system.Windows.Forms.Form
$Form.Text = $title
$Form.Width = 300
$Form.Height = 150


$Label = New-Object System.Windows.Forms.Label
$label.Location = New-Object system.drawing.size(10,10)
$Label.Text = $message
$Label.BackColor = "Transparent"
$Label.AutoSize = $True


$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(10,50)
$OKButton.Size = New-Object System.Drawing.Size(75,20)
$OKButton.Text = "Yes"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.AcceptButton = $OKButton

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,50)
$CancelButton.Size = New-Object System.Drawing.Size(75,20)
$CancelButton.Text = "No"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Form.CancelButton = $CancelButton

[void]$Form.Controls.Add($OKButton)
[void]$Form.Controls.Add($Label)
[void]$form.controls.add($CancelButton)

$Form.Add_Shown({$Form.Activate()})
$dialogResult = $Form.ShowDialog()
if ($dialogResult -eq [System.Windows.Forms.DialogResult]::OK)
    {
          "Yes"
    }
else
    {
            "No"
    }
}

Function get-UInputFreeText{

param(
[string]$title = "FreeText" ,
[string]$message = "Please enter your answer"
)
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$Form = New-Object system.Windows.Forms.Form
$Form.Text = $title
$Form.Width = 300
$Form.Height = 150


$Label = New-Object System.Windows.Forms.Label
$Label.Text = $message
$Label.BackColor = "Transparent"
$Label.AutoSize = $True

$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Size(20,30)
$TextBox.Size = New-Object System.Drawing.Size(200,30)



$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(10,60)
$OKButton.Size = New-Object System.Drawing.Size(75,20)
$OKButton.Text = "Ok"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.AcceptButton = $OKButton

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(150,60)
$CancelButton.Size = New-Object System.Drawing.Size(75,20)
$CancelButton.Text = "Cancel"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Form.CancelButton = $CancelButton

[void]$Form.Controls.Add($OKButton)
[void]$Form.Controls.Add($Label)
[void]$form.controls.add($CancelButton)
[void] $form.controls.add($textbox)

$Form.Add_Shown({$Form.Activate();$TextBox.focus()})
$dialogResult = $Form.ShowDialog()
if ($dialogResult -eq [System.Windows.Forms.DialogResult]::OK)
    {
          $textbox.Text
    }
}

get-UInputlistbox -message "未开启的服务" -title "power管理器" -list 'Vanilla', 'Chocolate', 'Strawberry', 'Banana'
get-UInputFreeText -message "What is your favorite ice cream flavor?" -title "Type In Flavor" 