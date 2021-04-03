Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function sendSGJ($content){

Write-Host "Before Send Check => $content"

$preTime = Get-Date -UFormat '%s'

$time = $preTime - 28800

$body = @{
    time = $time
    content = $content   
}
$contentType = 'application/x-www-form-urlencoded' 
$sourceApi = 'https://katcloud.cn/wxindex223355600872.php'


$res = Invoke-WebRequest -Method POST -Uri $sourceApi -body $body -ContentType $contentType

Write-Host $res.StatusCode

function Read-MessageBoxDialog

{

param ([string]$Message,

[string]$WindowTitle,

[System.Windows.Forms.MessageBoxButtons]$Buttons = [System.Windows.Forms.MessageBoxButtons]::OK,

[System.Windows.Forms.MessageBoxIcon]$Icon = [System.Windows.Forms.MessageBoxIcon]::None)

Add-Type -AssemblyName System.Windows.Forms

return [System.Windows.Forms.MessageBox]::Show($Message, $WindowTitle, $Buttons, $Icon)

}

if($res.StatusCode -eq 200){
    Write-Host "send success!!!"
    Read-MessageBoxDialog -Message "时光机已载着文字出发~" -WindowTitle "KatCloud 时光机" -Buttons OK -Icon Information
}else{
    Write-Host "send failed!!!"
}
}
 
$PowerShellForms = New-Object System.Windows.Forms.Form 
$PowerShellForms.Text = "KatCloud 时光机"
$PowerShellForms.Size = New-Object System.Drawing.Size(600,600) 
$PowerShellForms.StartPosition = "CenterScreen"
$PowerShellForms.SizeGripStyle = "Hide"
$PowerShellForms.MaximizeBox = $false
$PowerShellForms.FormBorderStyle = "FixedSingle"

$WarningForms = New-Object System.Windows.Forms.Form
$WarningForms.Text = "KatCloud 警告"
$WarningForms.Size = New-Object System.Drawing.Size(300,300)
$WarningForms.StartPosition = "CenterScreen"
$WarningForms.SizeGripStyle = "Hide"
$WarningForms.MaximizeBox = $false
$WarningForms.MinimizeBox = $false
$WarningForms.FormBorderStyle = "FixedSingle"

$LabelsWarning = New-Object System.Windows.Forms.Label
$LabelsWarning.Location = New-Object System.Drawing.Point(40,40) 
$LabelsWarning.Size = New-Object System.Drawing.Size(40,20) 
$LabelsWarning.Text = "时光机不能为空！"
$LabelsWarning.AutoSize = $True
$WarningForms.Controls.Add($LabelsWarning)

$WarningButton = New-Object System.Windows.Forms.Button
$WarningButton.Location = New-Object System.Drawing.Point(130,150)
$WarningButton.Size = New-Object System.Drawing.Size(100,50)
$WarningButton.Text = "OK"
$WarningButton.Add_Click({
    Write-Host "空空如也，返回！"
    $WarningForms.Close()
})
$WarningForms.AcceptButton = $WarningButton
$WarningForms.Controls.Add($WarningButton)
 
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(230,450)
$OKButton.Size = New-Object System.Drawing.Size(100,50)
$OKButton.Text = "发送时光机"
$OKButton.Add_Click({
    if($TextBox1.Text){
        Write-Host "通过了非空检查"
        Write-Host "检查都通过了！"
        Write-Host $TextBox1.Text
        sendSGJ -content $TextBox1.Text
    }else{
        Write-Host "youshangjiao else"
        $WarningForms.ShowDialog()
    }
})
$PowerShellForms.AcceptButton = $OKButton
$PowerShellForms.Controls.Add($OKButton)

$Labels1 = New-Object System.Windows.Forms.Label
$Labels1.Location = New-Object System.Drawing.Point(90,40) 
$Labels1.Size = New-Object System.Drawing.Size(280,20) 
$Labels1.Text = "写下现在的感想吧~"
$Labels1.AutoSize = $True
$PowerShellForms.Controls.Add($Labels1) 

$Labels2 = New-Object System.Windows.Forms.Label
$Labels2.Location = New-Object System.Drawing.Point(510,530)
$Labels2.Size = New-Object System.Drawing.Size(50,20)
$Labels2.Text = "©KatCloud"
$Labels2.AutoSize = $True
$PowerShellForms.Controls.Add($Labels2)
 
$TextBox1 = New-Object System.Windows.Forms.TextBox
$TextBox1.Multiline = $True
$TextBox1.Location = New-Object System.Drawing.Point(90,100) 
$TextBox1.Size = New-Object System.Drawing.Size(400,300)
$TextBox1.Font = New-Object System.Drawing.Font($TextBox1.Font.FontFamily, 12, $TextBox1.Font.Style)
$TextBox1.AcceptsReturn = $True
$PowerShellForms.Controls.Add($TextBox1)


$PowerShellForms.TopMost = $True
$WarningForms.TopMost = $True

 
$result = $PowerShellForms.ShowDialog()